import 'package:meuteste/models/user.model.dart';
import 'package:meuteste/repositories/account.repository.dart';
import 'package:meuteste/view-models/login.viewmodel.dart';
import 'package:meuteste/view-models/signup.viewmodel.dart';

class AccountController {
  IAccountRepository _repository;

  AccountController(IAccountRepository repository) {
    _repository = repository;
  }

  Future<User> login(LoginViewModel model) async {
    // Mantém a tela ocupada
    model.busy = true;

    // Valida o Modelo
    model.validate();

    // Caso o model não seja válido
    if (!model.isValid()) {
      model.busy = false;
      return null;
    }

    // Busca no repositório
    await Future.delayed(new Duration(milliseconds: 1500));
    var user = await _repository.authenticate(model.email, model.password);
    // Salva no Storage ou State

    model.busy = false;
    return user;
  }

  Future<bool> signup(SignupViewModel model) async {
    // Mantém a tela ocupada
    model.busy = true;

    // Valida o Modelo
    model.validate();

    // Caso o model não seja válido
    if (!model.isValid()) {
      model.busy = false;
      return false;
    }

    // Busca no repositório
    await Future.delayed(new Duration(milliseconds: 1500));
    var user = await _repository.signup(
      model.name,
      model.document,
      model.email,
      model.password,
    );
    // Salva no Storage ou State

    model.busy = false;
    return true;
  }
}
