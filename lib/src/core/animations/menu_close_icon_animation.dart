import 'package:flutter/material.dart';

import '../constants/constants.dart' show menuIcon, primaryColor;

class MenuCloseIconAnimation extends AnimatedWidget {
  const MenuCloseIconAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return progress.value > 0.1
        ? AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: progress,
            color: Color.lerp(
              Colors.black,
              primaryColor,
              (progress.value * 5).clamp(0, 1),
            ),
          )
        : Image.asset(menuIcon);
  }
}
