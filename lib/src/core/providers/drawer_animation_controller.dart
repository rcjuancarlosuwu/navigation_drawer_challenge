import 'package:flutter/material.dart';

class DrawerAnimationController {
  final AnimationController controller;
  final Animation<double> drawerIconButtonAnimation;
  final Animation<double> drawerButtonSplashAnimation;
  final Animation<Offset> drawerSliderAnimation;

  DrawerAnimationController(this.controller)
      : drawerButtonSplashAnimation = Tween<double>(begin: 0, end: .5).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2),
            reverseCurve: const Interval(0.8, 1),
          ),
        ),
        drawerIconButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.15, 1),
            reverseCurve: const Interval(0.05, 0.6),
          ),
        ),
        drawerSliderAnimation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.185, 0.35),
            reverseCurve: const Interval(0, 0.05),
          ),
        );

  Animation<Offset> textUpAnimation(
    int charIndex,
    int length,
    int optionIndex,
  ) {
    final wordBegin = 0.4 + (optionIndex * 0.05);
    final charEnd = 0.6 + (optionIndex * 0.075) + (charIndex * 0.01);
    final charSection = ((charEnd - wordBegin) / length) * charIndex;
    final charBegin = wordBegin + charSection;

    return Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(charBegin, charEnd),
      reverseCurve: const Interval(0.075, 0.2),
    ));
  }

  Animation<double> hyphenOpacityAnimation(
    int hyphenIndex,
  ) {
    final begin = 0.25 + (hyphenIndex * 0.05);
    final end = 0.6 + (hyphenIndex * 0.075);

    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
      reverseCurve: const Interval(0, 0.2),
    ));
  }

  Animation<Offset> hyphenSlideAnimation(
    int hyphenIndex,
  ) {
    final begin = 0.25 + (hyphenIndex * 0.05);
    final end = 0.6 + (hyphenIndex * 0.075);

    return Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
      reverseCurve: const Interval(0, 0.2),
    ));
  }

  void reverse() => controller.reverse();

  bool get isCompleted => controller.isCompleted;

  void toggle() {
    if (!controller.isCompleted) controller.reset();
    controller.isDismissed ? controller.forward() : reverse();
  }
}
