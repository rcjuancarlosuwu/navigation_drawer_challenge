import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

class AnimatedOptionHyphen extends ConsumerWidget {
  const AnimatedOptionHyphen({
    Key? key,
    required this.index,
    required this.canAnimate,
    required this.globalKey,
  }) : super(key: key);

  final int index;
  final bool canAnimate;
  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAnimationController = ref.watch(
      categoryAnimationControllerProvider,
    );

    final drawerAnimationController = ref.watch(
      drawerAnimationControllerProvider,
    );

    final width = MediaQuery.of(context).size.width;

    return SlideTransition(
      position: drawerAnimationController.hyphenSlideAnimation(index),
      child: FadeTransition(
        opacity: drawerAnimationController.hyphenOpacityAnimation(index),
        child: canAnimate
            ? AnimatedBuilder(
                animation: categoryAnimationController.controller,
                builder: (_, __) {
                  return Container(
                    key: globalKey,
                    height: hyphenHeight,
                    width: categoryAnimationController
                        .hyphenWidthAnimation(width)
                        .value,
                    margin: EdgeInsets.only(
                      left: categoryAnimationController
                          .hyphenMarginAnimation.value,
                    ),
                    color: Color.lerp(
                      optionTextColor,
                      primaryColor,
                      categoryAnimationController.onTapAnimation.value,
                    ),
                  );
                })
            : Container(
                key: globalKey,
                height: hyphenHeight,
                width: hyphenWidth,
                margin: const EdgeInsets.only(left: hyphenMarginLeft),
                color: optionTextColor,
              ),
      ),
    );
  }
}
