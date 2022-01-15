import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';
import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

class CustomDrawerButton extends ConsumerWidget {
  const CustomDrawerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final drawerAnimationController = ref.watch(
      drawerAnimationControllerProvider,
    );

    return Positioned(
      left: 5,
      top: 35,
      child: IconButton(
        padding: const EdgeInsets.only(),
        onPressed: () async {
          ref.read(categoryAnimationControllerProvider).reset();
          drawerAnimationController.toggle();
        },
        icon: GradientAnimation(
          animation: drawerAnimationController.drawerButtonSplash,
          child: _IconAnimation(
            animation: drawerAnimationController.drawerIconButtonAnimation,
          ),
        ),
      ),
    );
  }
}

class _IconAnimation extends AnimatedWidget {
  const _IconAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return progress.value > 0.1
        ? AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: progress,
            color: Color.lerp(
              Colors.black,
              kPrimaryColor,
              (progress.value * 5).clamp(0, 1),
            ),
          )
        : Image.asset(kMenuIcon);
  }
}
