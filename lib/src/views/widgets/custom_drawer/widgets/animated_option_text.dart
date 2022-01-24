import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';
import 'package:navigation_drawer_challenge/src/core/theme/theme.dart';

class AnimatedOptionText extends ConsumerWidget {
  const AnimatedOptionText({
    Key? key,
    required this.index,
    required this.canAnimate,
    required this.text,
  }) : super(key: key);

  final int index;
  final bool canAnimate;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerAnimationController = ref.watch(
      drawerAnimationControllerProvider,
    );

    final categoryAnimationController = ref.watch(
      categoryAnimationControllerProvider,
    );

    final chars = text.split('');
    final length = chars.length;

    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 30, bottom: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int charIndex = 0; charIndex < length; charIndex++)
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: SlideTransition(
                position: drawerAnimationController.textUpAnimation(
                  charIndex,
                  length,
                  index,
                ),
                child: canAnimate
                    ? AnimatedBuilder(
                        animation: categoryAnimationController.controller,
                        builder: (_, __) {
                          return Text(
                            chars[charIndex],
                            style: categoryOptionStyle.copyWith(
                              color: Color.lerp(
                                optionTextColor,
                                primaryColor,
                                categoryAnimationController
                                    .optionColorAnimation(charIndex, length)
                                    .value,
                              ),
                            ),
                          );
                        },
                      )
                    : Text(
                        chars[charIndex],
                        style: categoryOptionStyle,
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
