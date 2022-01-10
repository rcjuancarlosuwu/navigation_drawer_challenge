import 'package:flutter/material.dart';

import 'core/constants/constants.dart';
import 'core/theme/app_theme.dart';
import 'views/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      home: const Home(),
      theme: ChanelTheme.light,
    );
  }
}
