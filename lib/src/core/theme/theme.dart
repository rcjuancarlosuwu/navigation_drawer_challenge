import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

ThemeData channelTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    elevation: 0,
    toolbarHeight: 65,
    systemOverlayStyle: uiOverlayStyle,
  ),
  scaffoldBackgroundColor: primaryColor,
);

final filterByTitleStyle = GoogleFonts.nunito(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);

final productPriceStyle = GoogleFonts.nunito(
  color: const Color(0xFF4559A9),
  fontWeight: FontWeight.bold,
  fontSize: 19.0,
);

final productNameStyle = GoogleFonts.libreBaskerville(
  fontSize: 17.0,
  fontWeight: FontWeight.bold,
  height: 1.55,
);

final categoryOptionStyle = GoogleFonts.libreBaskerville(
  color: optionTextColor,
  fontSize: 30.0,
);
