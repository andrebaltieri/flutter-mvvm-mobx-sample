import 'package:meuteste/flunt/notification.dart';

class ValidationContract {
  var _errors = new List<Notification>();

  ValidationContract(List<Notification> errors) {
    _errors = errors;
  }

  isRequired(String value, key, message) {
    if (value != null || value.length <= 0)
      _errors.add(new Notification(key: key, message: message));
  }

  hasFixedLen(String value, len, key, message) {
    if (value != null && value.length != len)
      _errors.add(new Notification(key: key, message: message));
  }

  hasMinLen(String value, min, key, message) {
    if (value != null && value.length < min)
      _errors.add(new Notification(key: key, message: message));
  }

  hasMaxLen(String value, max, key, message) {
    if (value != null && value.length > max)
      _errors.add(new Notification(key: key, message: message));
  }

  isEmail(value, key, message) {
    var reg = new RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
    if (!reg.hasMatch(value))
      _errors.add(new Notification(key: key, message: message));
  }
}
