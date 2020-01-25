import 'package:meuteste/view-models/viewmodel.dart';

class LoginViewModel with ViewModel {
  bool busy = false;
  String email = "";
  String password = "";

  validate() {
    clear();
    if (email.length < 5)
      errors.add(new ViewModelError(key: "email", message: "E-mail inválido"));

    if (password.length < 5)
      errors
          .add(new ViewModelError(key: "password", message: "Senha inválida"));
  }
}
