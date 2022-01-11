import 'package:flutter/material.dart';

class DrawerAnimationController {
  final AnimationController controller;
  final Animation<double> drawerIconButtonAnimation;
  final Animation<double> drawerButtonSplash;
  final Animation<Offset> drawerSliderAnimation;

  DrawerAnimationController(this.controller)
      : drawerButtonSplash = Tween<double>(begin: 0, end: .5).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, .2),
            reverseCurve: const Interval(.8, 1),
          ),
        ),
        drawerIconButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(.15, 1),
            reverseCurve: const Interval(.05, .6),
          ),
        ),
        drawerSliderAnimation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(.185, .35),
            reverseCurve: const Interval(0, .05),
          ),
        );

  Animation<Offset> textUpAnimation(
    int charIndex,
    int length,
    int optionIndex,
  ) {
    final wordBegin = .4 + (optionIndex * .05);
    final charEnd = .6 + (optionIndex * .075) + (charIndex * .01);
    final charSection = ((charEnd - wordBegin) / length) * charIndex;
    final charBegin = wordBegin + charSection;

    return Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(charBegin, charEnd),
      reverseCurve: const Interval(.075, .2),
    ));
  }

  Animation<double> hyphenOpacityAnimation(
    int hyphenIndex,
  ) {
    final begin = .25 + (hyphenIndex * .05);
    final end = .6 + (hyphenIndex * .075);

    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
      reverseCurve: const Interval(0, .2),
    ));
  }

  Animation<Offset> hyphenSlideAnimation(
    int hyphenIndex,
  ) {
    final begin = .25 + (hyphenIndex * .05);
    final end = .6 + (hyphenIndex * .075);

    return Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
      reverseCurve: const Interval(0, .2),
    ));
  }

  void reverse() => controller.reverse();

  bool get isCompleted => controller.isCompleted;

  void toggle() {
    if (!controller.isCompleted) controller.reset();
    controller.isDismissed ? controller.forward() : reverse();
  }
}
