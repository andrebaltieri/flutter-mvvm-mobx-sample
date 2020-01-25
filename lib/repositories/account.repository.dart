import 'package:meuteste/models/user.model.dart';

abstract class IAccountRepository {
  Future<User> authenticate(
    String email,
    String password,
  ) {}
  Future<User> signup(
    String name,
    String document,
    String email,
    String password,
  ) {}
}

class AccountRepository implements IAccountRepository {
  Future<User> authenticate(
    String email,
    String password,
  ) async {
    await Future.delayed(new Duration(milliseconds: 1500));
    return new User(
      name: "André Baltieri",
      email: email,
      picture: "https://placehold.it/200",
    );
  }

  Future<User> signup(
    String name,
    String document,
    String email,
    String password,
  ) async {
    await Future.delayed(new Duration(milliseconds: 1500));
    return new User(
      name: "André Baltieri",
      email: email,
      picture: "https://placehold.it/200",
    );
  }
}
