import 'package:flutter/material.dart';
import 'package:navigation_drawer_challenge/src/core/theme/app_theme.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        padding: const EdgeInsets.only(),
        onPressed: () {},
        icon: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kAccentColor.withOpacity(.2),
                  offset: const Offset(0, 5),
                  blurRadius: 4,
                ),
              ]),
          child: Image.asset('assets/icons/search.png'),
        ),
      ),
    );
  }
}
