import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/src/core/theme/app_theme.dart';

class GradientAnimation extends AnimatedWidget {
  const GradientAnimation({
    Key? key,
    required Animation<double> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: progress.value > .01 ? .7 + progress.value : 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.transparent,
              progress.value > .1 ? kAccentColor : Colors.transparent,
            ],
            stops: const [1, 1],
            radius: progress.value,
          ),
        ),
        child: child,
      ),
    );
  }
}
