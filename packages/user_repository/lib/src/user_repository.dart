import 'package:uuid/uuid.dart';

import 'models/models.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;

    //real getUser later
    return Future.delayed(const Duration(milliseconds: 300), () {
      _user = User(const Uuid().v4());
      return _user;
    });
  }
}
