import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

class TopPanel extends ConsumerWidget {
  const TopPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(topPanelHeightProvider);
    final controller = ref.watch(categoryAnimationControllerProvider);

    return Positioned(
      top: 0,
      child: RevealAnimation(
        animation: controller.revealAnimation(height),
      ),
    );
  }
}

class BottomPanel extends ConsumerWidget {
  const BottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(bottomPanelHeightProvider);
    final controller = ref.watch(categoryAnimationControllerProvider);

    return Positioned(
      bottom: 0,
      child: RevealAnimation(
        animation: controller.revealAnimation(height),
      ),
    );
  }
}
