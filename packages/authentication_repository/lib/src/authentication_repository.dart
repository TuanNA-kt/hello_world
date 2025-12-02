import 'dart:async';
import 'package:authentication_repository/src/signup_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'login_failure.dart';
import 'logout_failure.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> signUp({required String username, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      _controller.add(AuthenticationStatus.authenticated);
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
      _controller.add(AuthenticationStatus.authenticated);
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
      _controller.add(AuthenticationStatus.unauthenticated);
    } catch (_) {
      throw LogOutFailure();
    }
  }

Future<void> register(
    { required String fullname, required String username, required String password }) async {
  //real register later
  await Future.delayed(const Duration(milliseconds: 300));
}

// void logOut() {
  //   _controller.add(AuthenticationStatus.unauthenticated);
  // }

  void dispose() => _controller.close();
}