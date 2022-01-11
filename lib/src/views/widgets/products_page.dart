import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';

import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';

import 'filter_by_title.dart';
import 'like_button.dart';
import 'search_button.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FilterByTitle(),
        actions: const [SearchButton()],
      ),
      body: const ProductsGrid(),
    );
  }
}

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(filteredProductsProvider);
    final childAspectRatio = ref.watch(
      childAspectRatioProvider(MediaQuery.of(context).size.height),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          mainAxisSpacing: 7.5,
          crossAxisCount: 2,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];

          return Padding(
            padding: EdgeInsets.only(
              left: index.isOdd ? 0 : 20,
              right: index.isEven ? 0 : 20,
            ),
            child: Column(
              children: [
                /**
                 * Image
                 */
                Expanded(
                  flex: 14,
                  child: _ImageRotationAnimation(
                    image: product.image,
                    index: index,
                  ),
                ),
                /**
                 * Name and price text
                 */
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      _TextUpAnimation(
                        child: Text(
                          product.name,
                          style: GoogleFonts.libreBaskerville(
                            fontSize: kNameFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        index: index,
                      ),
                      const SizedBox(height: 5),
                      _TextUpAnimation(
                        child: Text(
                          product.subname,
                          style: GoogleFonts.libreBaskerville(
                            fontSize: kNameFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        index: index,
                      ),
                      const SizedBox(height: 12),
                      _TextUpAnimation(
                        child: Text(
                          '${product.price} USD',
                          style: GoogleFonts.nunito(
                            color: kPriceColor,
                            fontWeight: FontWeight.bold,
                            fontSize: kPriceFontSize,
                          ),
                        ),
                        index: index,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TextUpAnimation extends ConsumerWidget {
  const _TextUpAnimation({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(categoryAnimationControllerProvider);

    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: AnimatedBuilder(
        animation: controller.controller,
        builder: (_, child) {
          return Transform.translate(
            offset: controller.isAnimating
                ? controller.textUpAnimation(index).value
                : const Offset(0, 0),
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class _ImageRotationAnimation extends ConsumerWidget {
  const _ImageRotationAnimation({
    Key? key,
    required this.index,
    required this.image,
  }) : super(key: key);

  final int index;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(categoryAnimationControllerProvider);

    return AnimatedBuilder(
      animation: controller.controller,
      builder: (_, child) {
        final matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi * controller.rotateAnimation(index).value);

        return Transform(
          alignment: Alignment.center,
          transform: controller.isAnimating ? matrix : Matrix4.identity(),
          child: child,
        );
      },
      child: Stack(
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
      ),
    );
  }
}
