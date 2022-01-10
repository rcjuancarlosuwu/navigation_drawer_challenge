import 'product_category_enum.dart';

class Product {
  final String name;
  final String subname;
  final String price;
  final String image;
  final ProductCategory productCategory;

  const Product({
    required this.name,
    required this.subname,
    required this.price,
    required this.image,
    required this.productCategory,
  });
}
