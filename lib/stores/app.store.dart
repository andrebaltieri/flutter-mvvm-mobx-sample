import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

// This is the class used by rest of your codebase
class AppStore = _AppStore with _$AppStore;

// The store-class
abstract class _AppStore with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "";

  @action
  void setUser(String pName, String pEmail, String pPicture) {
    name = pName;
    email = pEmail;
    picture = pPicture;
  }
}
