import 'package:flutter/material.dart';

class SliderAnimation extends AnimatedWidget {
  const SliderAnimation({
    Key? key,
    required Animation<Offset> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  Animation<Offset> get offset => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: offset, child: child);
  }
}
