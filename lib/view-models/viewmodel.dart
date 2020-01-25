class ViewModelError {
  String key = "";
  String message = "";

  ViewModelError({this.key, this.message});
}

class ViewModel {
  List<ViewModelError> errors = new List<ViewModelError>();

  clear() {
    errors = new List<ViewModelError>();
  }

  addError(ViewModelError error) {
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
