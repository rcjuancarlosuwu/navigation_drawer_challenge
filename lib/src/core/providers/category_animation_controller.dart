import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';

class CategoryAnimationController {
  final AnimationController controller;
  final Animation<double> onTapAnimation;
  final Animation<double> hyphenMarginLeft;

  CategoryAnimationController(this.controller)
      : onTapAnimation = Tween<double>(begin: 0, end: 0.6).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2),
          ),
        ),
        hyphenMarginLeft =
            Tween<double>(begin: kHyphenMarginLeft, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.45),
          ),
        );

  Animation<double> hyphenWidth(double width) {
    return Tween<double>(
      begin: kHyphenWidth,
      end: width,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.25, 0.45),
    ));
  }

  Animation<double> textColorAnimation(
    int charIndex,
    int length,
  ) {
    const wordBegin = 0.25;
    final charEnd = 0.35 + (charIndex * 0.0175);
    final charSection = ((charEnd - wordBegin) / length) * charIndex;
    final charBegin = wordBegin + charSection;

    return Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(charBegin, charEnd),
    ));
  }

  Animation<double> revealAnimation(double height) {
    return Tween<double>(
      begin: height,
      end: 0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.56, 0.79),
    ));
  }

  Animation<Offset> textUpAnimation(int index) {
    final begin = 0.77 + (index * 0.02);
    final end = 0.9 + (index * 0.033);

    return Tween<Offset>(
      begin: const Offset(0, 40),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
    ));
  }

  Animation<double> rotateAnimation(int index) {
    final begin = 0.75 + (index * 0.05);
    final end = 0.85 + (index * 0.05);

    return Tween<double>(
      begin: -0.5,
      end: 0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end),
    ));
  }

  void forward() => controller.forward();

  void reset() => controller.reset();

  bool get isAnimating => controller.isAnimating;
}
