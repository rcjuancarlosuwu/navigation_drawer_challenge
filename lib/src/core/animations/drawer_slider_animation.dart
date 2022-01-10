import 'package:flutter/material.dart';

class DrawerSlider extends AnimatedWidget {
  const DrawerSlider({
    Key? key,
    required Animation<Offset> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  Animation<Offset> get offset => listenable as Animation<Offset>;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset,
      child: child,
    );
  }
}
