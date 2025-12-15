import 'dart:convert';

import 'package:chat_repository/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';


class UserRepository {
  User? _user;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final SharedPreferences _prefs;
  final ChatRemoteDataSource _chatRemoteDataSource;

  static const userCacheKey = '__user_cache_key__';

  UserRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    required SharedPreferences prefs,
    required ChatRemoteDataSource chatRemoteDataSource
  })
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _prefs = prefs,
        _chatRemoteDataSource = chatRemoteDataSource;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        // User logged out - clear cache
        await clearCache();
        return User.empty;
      }

      final user = firebaseUser.toUser;
      await _cacheUser(user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    final userJson = _prefs.getString(userCacheKey);
    if (userJson == null) return User.empty;

    try {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return User.fromJson(userMap);
    } catch (e) {
      return User.empty;
    }
  }

  /// Cache user to SharedPreferences
  Future<void> _cacheUser(User user) async {
    final userJson = await _chatRemoteDataSource.getUser(user.id);
    if(userJson != null) await _prefs.setString(userCacheKey, jsonEncode(userJson));
  }

  Future<void> writeUserToRTDB(firebase_auth.User user, String fullName) async {
    final newUser = User(id: user.uid,
        name: fullName,
        email: user.email,
        createdAt: user.metadata.creationTime?.millisecondsSinceEpoch);
    await _chatRemoteDataSource.createUser(newUser);
  }

  Future<void> updateUserToRTDB(User user) async {
    await _chatRemoteDataSource.updateUserProfile(
      userId: user.id,
      fullName: user.name,
      phoneNumber: user.phoneNumber,
      birthday: user.birthday,
      avatarUrl: user.avatarUrl
    );

    await _cacheUser(user);
  }

  Future<void> clearCache() async {
    await _prefs.remove(userCacheKey);
    _user = null;
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        clearCache(),
      ]);
    } catch (e) {
      throw Exception('Failed to log out: $e');
    }
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid,
        email: email,
        name: displayName ?? '',
        phoneNumber: phoneNumber ?? '',
        avatarUrl: photoURL,
        lastSeen: null);
  }
}
