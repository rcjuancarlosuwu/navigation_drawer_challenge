import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/src/core/data/data.dart';

import 'custom_drawer_option.dart';

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = options
        .map((option) => CustomDrawerOption(option: option))
        .toList(growable: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
