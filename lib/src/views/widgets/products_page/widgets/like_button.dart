import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(),
      onPressed: () {},
      icon: const _LikeIcon(),
    );
  }
}

class _LikeIcon extends StatelessWidget {
  const _LikeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.favorite_border_outlined, size: 14),
    );
  }
}
