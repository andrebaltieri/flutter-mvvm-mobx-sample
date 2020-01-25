import 'package:flutter/cupertino.dart';
import 'package:meuteste/stores/app.store.dart';
import 'package:meuteste/views/login.view.dart';
import 'package:provider/provider.dart';

void main() => runApp(IOSApp());

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: CupertinoApp(
        title: "Arquitetura Demo",
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
