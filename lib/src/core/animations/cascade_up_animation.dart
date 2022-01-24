import 'package:flutter/material.dart';

class SlideUpAnimation extends AnimatedWidget {
  const SlideUpAnimation({
    Key? key,
    required Animation<Offset> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  Animation<Offset> get progress => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: Transform.translate(
        offset: progress.status == AnimationStatus.forward
            ? progress.value
            : const Offset(0, 0),
        child: child,
      ),
    );
  }
}
