import 'package:meuteste/flunt/validation-contract.dart';
import 'package:meuteste/flunt/notifiable.dart';

class LoginViewModel with Notifiable {
  bool busy = false;
  String email = "";
  String password = "";

  validate() {
    clear();
    var contract = new ValidationContract(errors);
    contract.isEmail(email, "email", "E-mail inválido");
    contract.hasMinLen(password, 6, "password", "Senha inválida");
  }
}
