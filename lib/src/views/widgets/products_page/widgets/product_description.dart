import 'package:flutter/material.dart';

import 'like_button.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /**
         * Image
         */
        Positioned.fill(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(image),
            ),
          ),
        ),
        /**
         * Like button
         */
        const Positioned(
          bottom: 8,
          right: 10,
          child: LikeButton(),
        ),
      ],
    );
  }
}
