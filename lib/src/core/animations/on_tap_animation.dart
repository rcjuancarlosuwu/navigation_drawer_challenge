import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/constants.dart' show tapEffectHalfSize;
import '../providers/providers.dart';

import 'animations.dart';

class OnTapAnimation extends ConsumerWidget {
  const OnTapAnimation({
    Key? key,
    required this.canAnimate,
  }) : super(key: key);

  final bool canAnimate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(offsetOnTapProvider);
    final top = offset.dy - tapEffectHalfSize;
    final left = offset.dx - tapEffectHalfSize;
    final categoryAnimationController = ref.watch(
      categoryAnimationControllerProvider,
    );

    return Positioned(
      top: top,
      left: left,
      child: Visibility(
        visible: canAnimate,
        child: ScaleSplahAnimation(
          animation: categoryAnimationController.onTapAnimation,
        ),
      ),
    );
  }
}
