import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';
import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';
import 'package:navigation_drawer_challenge/src/core/data/models/models.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

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
    final canShow = index == currentIndex;

    return GestureDetector(
      onTapDown: (details) {
        ref.read(topPanelHeightProvider.notifier).setHeight(_globalKey);
        ref.read(offsetOnTapProvider.notifier).state = details.localPosition;
        ref.read(productCategoryOptionProvider.notifier).state = option;
        final drawerAnimationController = ref.read(
          drawerAnimationControllerProvider,
        );
        if (drawerAnimationController.isCompleted) {
          ref.read(categoryAnimationControllerProvider).forward();
          ref.read(drawerAnimationControllerProvider).reverse();
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          _SlideFadeHyphen(
            index: index,
            globalKey: _globalKey,
            canShow: canShow,
          ),
          _AnimatedText(
            chars: option.name.split(''),
            index: index,
            canShow: canShow,
          ),
          /**
           * On Tap Effect
           */
          _OnTapDrawerOption(canShow: canShow)
        ],
      ),
    );
  }
}

class _AnimatedText extends ConsumerWidget {
  const _AnimatedText({
    Key? key,
    required this.chars,
    required this.index,
    required this.canShow,
  })  : length = chars.length,
        super(key: key);

  final List<String> chars;
  final int length;
  final int index;
  final bool canShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerAnimationController = ref.watch(
      drawerAnimationControllerProvider,
    );
    final categoryAnimationController = ref.watch(
      categoryAnimationControllerProvider,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 30, bottom: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int charIndex = 0; charIndex < chars.length; charIndex++)
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: SlideTransition(
                position: drawerAnimationController.textUpAnimation(
                  charIndex,
                  length,
                  index,
                ),
                child: canShow
                    ? AnimatedBuilder(
                        animation: categoryAnimationController.controller,
                        builder: (_, __) {
                          final t = categoryAnimationController
                              .textColorAnimation(charIndex, length)
                              .value;
                          return Text(
                            chars[charIndex],
                            style: GoogleFonts.libreBaskerville(
                              color: Color.lerp(
                                fOptionTextColor,
                                kPrimaryColor,
                                t,
                              ),
                              fontSize: kDrawerOptionsFontSize,
                            ),
                          );
                        },
                      )
                    : Text(
                        chars[charIndex],
                        style: GoogleFonts.libreBaskerville(
                          color: fOptionTextColor,
                          fontSize: kDrawerOptionsFontSize,
                        ),
                      ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SlideFadeHyphen extends ConsumerWidget {
  const _SlideFadeHyphen({
    Key? key,
    required this.index,
    required this.canShow,
    required this.globalKey,
  }) : super(key: key);

  final int index;
  final bool canShow;
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
        child: canShow
            ? AnimatedBuilder(
                animation: categoryAnimationController.controller,
                builder: (_, __) {
                  return Container(
                    key: globalKey,
                    height: kHyphenHeight,
                    width: categoryAnimationController.hyphenWidth(width).value,
                    margin: EdgeInsets.only(
                      left: categoryAnimationController.hyphenMarginLeft.value,
                    ),
                    color: Color.lerp(
                      fOptionTextColor,
                      kPrimaryColor,
                      categoryAnimationController.onTapAnimation.value,
                    ),
                  );
                })
            : Container(
                key: globalKey,
                height: kHyphenHeight,
                width: kHyphenWidth,
                margin: const EdgeInsets.only(left: kHyphenMarginLeft),
                color: fOptionTextColor,
              ),
      ),
    );
  }
}

class _OnTapDrawerOption extends ConsumerWidget {
  const _OnTapDrawerOption({
    Key? key,
    required this.canShow,
  }) : super(key: key);

  final bool canShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(offsetOnTapProvider);
    final categoryAnimationController = ref.watch(
      categoryAnimationControllerProvider,
    );

    return Positioned(
      top: offset.dy - kTapEffectSize / 2,
      left: offset.dx - kTapEffectSize / 2,
      child: canShow
          ? OnTapAnimation(
              animation: categoryAnimationController.onTapAnimation,
            )
          : const SizedBox.shrink(),
    );
  }
}
