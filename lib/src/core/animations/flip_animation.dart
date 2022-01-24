import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends AnimatedWidget {
  const FlipAnimation({
    Key? key,
    required Animation<double> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final matrix = Matrix4.identity()
      ..setEntry(3, 2, 0.002)
      ..rotateY(pi * progress.value);

    return Transform(
      alignment: Alignment.center,
      transform: progress.status == AnimationStatus.forward
          ? matrix
          : Matrix4.identity(),
      child: child,
    );
  }
}
