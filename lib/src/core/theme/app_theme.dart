import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kPrimaryColor = Color(0xFFEFF3F4);
const Color kAccentColor = Color(0xFF2C48B8);
final Color kOptionTextColor = kPrimaryColor.withOpacity(0.7);
// const SystemUiOverlayStyle kSystemUiOverlayStyleLight = SystemUiOverlayStyle(
//   statusBarIconBrightness: Brightness.light,
//   statusBarColor: Colors.transparent,
// );
const SystemUiOverlayStyle kSystemUiOverlayStyleDark = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
);

class ChanelTheme {
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 65,
      color: kPrimaryColor,
      centerTitle: true,
      systemOverlayStyle: kSystemUiOverlayStyleDark,
    ),
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
