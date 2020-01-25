import 'package:meuteste/view-models/viewmodel.dart';

class SignupViewModel with ViewModel {
  bool busy = false;
  String name = "";
  String document = "";
  String email = "";
  String password = "";

  validate() {
    clear();
    if (name.length < 5)
      errors.add(new ViewModelError(key: "name", message: "Nome inválido"));

    if (document.length < 5)
      errors.add(new ViewModelError(key: "document", message: "CPF inválido"));

    if (email.length < 5)
      errors.add(new ViewModelError(key: "email", message: "E-mail inválido"));

    if (password.length < 5)
      errors
          .add(new ViewModelError(key: "password", message: "Senha inválida"));
  }
}
