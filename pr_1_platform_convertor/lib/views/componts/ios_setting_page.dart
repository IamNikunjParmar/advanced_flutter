import 'package:flutter/cupertino.dart';

class IosSettingPage extends StatelessWidget {
  const IosSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(child: Text("settings")));
  }
}
