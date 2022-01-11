import 'package:flutter/material.dart';

class DrawerSlider extends AnimatedWidget {
  const DrawerSlider({
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
