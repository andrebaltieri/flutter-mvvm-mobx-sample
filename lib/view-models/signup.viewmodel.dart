import 'package:meuteste/flunt/notifiable.dart';
import 'package:meuteste/flunt/notification.dart';

class SignupViewModel with Notifiable {
  bool busy = false;
  String name = "";
  String document = "";
  String email = "";
  String password = "";

  validate() {
    clear();
    if (name.length < 5)
      errors.add(new Notification(key: "name", message: "Nome inválido"));

    if (document.length < 5)
      errors.add(new Notification(key: "document", message: "CPF inválido"));

    if (email.length < 5)
      errors.add(new Notification(key: "email", message: "E-mail inválido"));

    if (password.length < 5)
      errors.add(new Notification(key: "password", message: "Senha inválida"));
  }
}
