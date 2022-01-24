import 'package:flutter/material.dart';

import 'package:navigation_drawer_challenge/src/core/theme/theme.dart'
    show filterByTitleStyle;

class FilterByTitle extends StatelessWidget {
  const FilterByTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ALL PRODUCTS',
            style: filterByTitleStyle,
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
