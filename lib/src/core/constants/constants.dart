import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kDrawerAnimationDuration = Duration(milliseconds: 1500);
const kCategoryAnimationDuration = Duration(milliseconds: 1800);
const kHyphenHeight = 1.0;
const kHyphenWidth = 7.0;
const kHyphenMarginLeft = 30.0;
const kAppTitle = 'Navigator Drawer Challenge';
const kPrimaryColor = Color(0xFFEFF3F4);
const kAccentColor = Color(0xFF2C48B8);
const kPriceColor = Color(0xFF4559A9);
const kDrawerOptionsFontSize = 30.0;
const kNameFontSize = 18.0;
const kPriceFontSize = 19.0;
const kSystemUiOverlayStyleDark = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
);

// final
final Color fOptionTextColor = kPrimaryColor.withOpacity(0.7);
