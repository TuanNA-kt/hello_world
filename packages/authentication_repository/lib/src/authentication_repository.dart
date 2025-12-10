import 'dart:async';
import 'package:authentication_repository/src/signup_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'login_failure.dart';
import 'logout_failure.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  //final _controller = StreamController<AuthenticationStatus>();
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Stream<AuthenticationStatus> get status async* {
  //   yield AuthenticationStatus.unauthenticated;
  //   yield* _controller.stream;
  // }

  Stream<AuthenticationStatus> get status {
    // 🛑 SOLUTION: Listen to the built-in Firebase stream
    // This stream handles checking the persistent token on app start.
    return _firebaseAuth.authStateChanges()
        .map((firebase_auth.User? user) {
      // Firebase user object will be non-null if a valid token is found
      final isAuthenticated = user != null;

      // Map the Firebase user state to your custom enum
      return isAuthenticated
          ? AuthenticationStatus.authenticated
          : AuthenticationStatus.unauthenticated;
    });
  }

// NOTE: You can now remove _controller, dispose(), and all _controller.add() calls!
// The status stream will automatically update when logIn/logOut is successful.

// You also need to adjust logIn and logOut, as they no longer need to manually add to the controller:

  Future<firebase_auth.User?> signUp({required String username, required String password}) async {
    try {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      return userCredential.user;
      //_controller.add(AuthenticationStatus.authenticated);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> logIn(
      { required String username, required String password }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      //_controller.add(AuthenticationStatus.authenticated);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
      //_controller.add(AuthenticationStatus.unauthenticated);
    } catch (_) {
      throw LogOutFailure();
    }
  }


// void logOut() {
  //   _controller.add(AuthenticationStatus.unauthenticated);
  // }

  //void dispose() => _controller.close();
}