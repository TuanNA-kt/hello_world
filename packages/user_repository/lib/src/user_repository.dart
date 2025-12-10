import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';


class UserRepository {
  User? _user;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  SharedPreferences? _prefs;
  final Future<SharedPreferences> _prefsFuture;

  static const userCacheKey = '__user_cache_key__';

  UserRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    SharedPreferences? prefs,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _prefsFuture = prefs != null
            ? Future.value(prefs)
            : SharedPreferences.getInstance() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await _prefsFuture;
  }

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      await _cacheUser(user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    if (_prefs == null) return User.empty;

    final userJson = _prefs!.getString(userCacheKey);
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
    final prefs = _prefs ?? await _prefsFuture;
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(userCacheKey, userJson);
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid, email: email, name: displayName ?? 'null', avatarUrl: photoURL, lastSeen: null);
  }
}
