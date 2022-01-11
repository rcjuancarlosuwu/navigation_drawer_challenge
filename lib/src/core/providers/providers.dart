import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navigation_drawer_challenge/src/core/constants/constants.dart';
import 'package:navigation_drawer_challenge/src/core/data/models/models.dart';
import 'package:navigation_drawer_challenge/src/core/data/data.dart';

import 'category_animation_controller.dart';
import 'drawer_animation_controller.dart';
export 'drawer_animation_controller.dart';
export 'category_animation_controller.dart';

part 'state_notifiers/top_panel_height.dart';

final drawerAnimationControllerProvider = Provider<DrawerAnimationController>(
  (_) => throw UnimplementedError(),
);

final categoryAnimationControllerProvider =
    Provider<CategoryAnimationController>(
  (_) => throw UnimplementedError(),
);

final productCategoryOptionProvider = StateProvider((_) => options.first);

final offsetOnTapProvider = StateProvider((_) => const Offset(0, 0));

final topPanelHeightProvider = StateNotifierProvider<TopPanelHeight, double>(
  (_) => TopPanelHeight(),
);

final bottomPanelHeightProvider =
    Provider.family<double, double>((ref, height) {
  final topContainerHeight = ref.watch(topPanelHeightProvider);
  return height - topContainerHeight + kHyphenHeight;
});

final childAspectRatioProvider = Provider.family<double, double>((ref, height) {
  final d = height <= 760 ? 2.2 : 2;
  return 1 / d;
});

final filteredProductsProvider = StateProvider<List<Product>>((ref) {
  final category = ref.watch(
    productCategoryOptionProvider.select((e) => e.productCategory),
  );
  final filteredProducts =
      products.where((e) => e.productCategory == category).toList();
  return filteredProducts;
});
