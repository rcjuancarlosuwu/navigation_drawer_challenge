import 'package:flutter/material.dart';

import '../constants/constants.dart' show accentColor;

class RevealAnimation extends AnimatedWidget {
  const RevealAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get height => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: accentColor,
      height: height.value,
    );
  }
}
