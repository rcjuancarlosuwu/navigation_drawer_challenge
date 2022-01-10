import 'package:flutter/material.dart';

class OnTapAnimation extends AnimatedWidget {
  const OnTapAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6 + progress.value,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.transparent,
              progress.value > .1 ? Colors.white : Colors.transparent,
            ],
            stops: const [1, 1],
            radius: progress.value,
          ),
        ),
      ),
    );
  }
}
