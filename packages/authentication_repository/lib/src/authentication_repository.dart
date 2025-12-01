import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    //fake flow
    yield AuthenticationStatus.unknown;
    await Future.delayed(const Duration(milliseconds: 2000));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({ required String username, required String password }) async {
    //real login later
    await Future.delayed(const Duration(milliseconds: 300));
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> register({ required String fullname, required String username, required String password }) async {
    //real register later
    await Future.delayed(const Duration(milliseconds: 300));
    _controller.add(AuthenticationStatus.authenticated);
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}