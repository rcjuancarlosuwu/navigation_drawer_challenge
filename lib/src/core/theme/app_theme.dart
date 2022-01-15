import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';

class ChanelTheme {
  ChanelTheme._();

  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      color: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 65,
      systemOverlayStyle: kSystemUiOverlayStyleDark,
    ),
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
