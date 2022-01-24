import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';

import 'package:navigation_drawer_challenge/src/core/data/models/models.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

import 'animated_option_text.dart';
import 'animated_option_hyphen.dart';

class CustomDrawerOption extends ConsumerWidget {
  CustomDrawerOption({
    Key? key,
    required this.option,
  })  : _globalKey = GlobalKey(),
        super(key: key);

  final GlobalKey _globalKey;
  final ProductCategoryOption option;

  @override
  Widget build(BuildContext context, ref) {
    final index = option.productCategory.index;
    final currentIndex = ref.watch(
      productCategoryOptionProvider.select((e) => e.productCategory.index),
    );
    final canAnimate = index == currentIndex;

    return GestureDetector(
      onTapDown: (details) {
        // TopPanel and BottomPanel height
        ref.read(topPanelHeightProvider.notifier).setHeight(_globalKey);
        // OnTapAnimation position
        ref.read(offsetOnTapProvider.notifier).state = details.localPosition;
        // Filter products
        ref.read(productCategoryOptionProvider.notifier).state = option;
        // Animate
        final drawerAnimationController = ref.read(
          drawerAnimationControllerProvider,
        );
        if (drawerAnimationController.isCompleted) {
          ref.read(categoryAnimationControllerProvider).forward();
          drawerAnimationController.reverse();
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          AnimatedOptionHyphen(
            index: index,
            globalKey: _globalKey,
            canAnimate: canAnimate,
          ),
          AnimatedOptionText(
            index: index,
            canAnimate: canAnimate,
            text: option.name,
          ),
          OnTapAnimation(canAnimate: canAnimate)
        ],
      ),
    );
  }
}
