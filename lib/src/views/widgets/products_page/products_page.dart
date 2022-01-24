import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

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
