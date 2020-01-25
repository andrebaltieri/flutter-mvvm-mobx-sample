import 'package:flutter/cupertino.dart';
import 'package:meuteste/stores/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 40,
            ),
            Container(
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(40),
              child: Image.network(store.picture),
            ),
            Text(store.name),
            Text(store.email),
          ],
        ),
      ),
    );
  }
}
