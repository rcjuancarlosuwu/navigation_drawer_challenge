import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';
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

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5),
        child: IconButton(
          padding: const EdgeInsets.only(),
          onPressed: () {
            ref.read(categoryAnimationControllerProvider).reset();
            drawerAnimationController.toggle();
          },
          icon: SplashAnimation(
            animation: drawerAnimationController.drawerButtonSplashAnimation,
            child: MenuCloseIconAnimation(
              animation: drawerAnimationController.drawerIconButtonAnimation,
            ),
          ),
        ),
      ),
    );
  }
}
