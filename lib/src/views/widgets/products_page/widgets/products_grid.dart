import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/providers/providers.dart';
import 'package:navigation_drawer_challenge/src/core/constants/constants.dart'
    show productsSliverGridDelegate;

import 'product_card.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(filteredProductsProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GridView.builder(
        gridDelegate: productsSliverGridDelegate,
        itemCount: products.length,
        itemBuilder: (_, index) {
          return ProductCard(index, products[index]);
        },
      ),
    );
  }
}
