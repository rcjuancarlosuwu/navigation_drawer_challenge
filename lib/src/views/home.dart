import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart'
    show categoryAnimationDuration, drawerAnimationDuration;
import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

import 'widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController drawerAnimationController;
  late final AnimationController categoryAnimationController;

  @override
  void initState() {
    super.initState();
    drawerAnimationController = AnimationController(
      duration: drawerAnimationDuration,
      vsync: this,
    );
    categoryAnimationController = AnimationController(
      duration: categoryAnimationDuration,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        drawerAnimationControllerProvider.overrideWithValue(
          DrawerAnimationController(drawerAnimationController),
        ),
        categoryAnimationControllerProvider.overrideWithValue(
          CategoryAnimationController(categoryAnimationController),
        ),
      ],
      child: Material(
        child: Stack(
          children: const [
            ProductsPage(),
            CustomDrawer(),
            CustomDrawerButton(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    drawerAnimationController.dispose();
    categoryAnimationController.dispose();
    super.dispose();
  }
}
