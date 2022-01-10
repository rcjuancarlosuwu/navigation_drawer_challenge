import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/animations/animations.dart';
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';
import 'widgets/widgets.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(drawerAnimationControllerProvider);

    return DrawerSlider(
      animation: controller.drawerSliderAnimation,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
          child: Stack(
            children: const [
              TopPanel(),
              BottomPanel(),
              CustomDrawerBody(),
            ],
          ),
        ),
      ),
    );
  }
}
