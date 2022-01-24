import 'package:flutter/material.dart';

import 'core/constants/constants.dart' show appName;
import 'core/theme/theme.dart';
import 'views/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      title: appName,
      theme: channelTheme,
    );
  }
}
