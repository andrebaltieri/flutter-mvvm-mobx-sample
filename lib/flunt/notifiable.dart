import 'package:meuteste/flunt/notification.dart';

class Notifiable {
  List<Notification> errors = new List<Notification>();

  clear() {
    errors = new List<Notification>();
  }

  addError(Notification error) {
    if (error == null) return;
    errors.add(error);
  }

  isValid() {
    return errors.length == 0;
  }

  bool hasError(String key) {
    if (errors.length == 0) return false;

    var error = errors.where((err) => err.key == key);
    if (error != null && errors.length > 0) return true;

    return false;
  }

  String getErrorMessage(String key) {
    if (errors.length == 0) return "";

    var error = errors.firstWhere((err) => err.key == key);
    if (error != null) return error.message;

    return "";
  }

  String getErrorsAsString() {
    var result = "";
    for (var i = 0; i < errors.length; i++) {
      result += errors[i].message + "\n";
    }
    return result;
  }
}
