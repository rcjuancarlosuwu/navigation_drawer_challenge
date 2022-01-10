import 'package:flutter/material.dart';

class RevealAnimation extends AnimatedWidget {
  const RevealAnimation({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get height => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF2C48B8),
      height: height.value,
    );
  }
}
