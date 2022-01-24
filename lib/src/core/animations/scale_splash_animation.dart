import 'package:flutter/material.dart';

import '../constants/constants.dart' show tapEffectSize;

class ScaleSplahAnimation extends AnimatedWidget {
  const ScaleSplahAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6 + progress.value,
      child: Container(
        height: tapEffectSize,
        width: tapEffectSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.transparent,
              progress.value > 0 ? Colors.white : Colors.transparent,
            ],
            stops: const [1, 1],
            radius: progress.value,
          ),
        ),
      ),
    );
  }
}
