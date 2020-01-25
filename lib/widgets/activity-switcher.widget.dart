import 'package:flutter/cupertino.dart';

class ActivitySwitcher extends StatelessWidget {
  final bool busy;
  final Widget child;

  ActivitySwitcher({
    @required this.busy,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return busy ? CupertinoActivityIndicator() : child;
  }
}
