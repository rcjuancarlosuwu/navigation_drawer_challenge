import 'models/models.dart';

const options = [
  ProductCategoryOption(
    name: 'WRIST WATCH',
    productCategory: ProductCategory.wristWatch,
  ),
  ProductCategoryOption(
    name: 'LEATHER GOODS',
    productCategory: ProductCategory.leatherGoods,
  ),
  ProductCategoryOption(
    name: 'PERFUME',
    productCategory: ProductCategory.perfume,
  ),
  ProductCategoryOption(
    name: 'JEWELLERY',
    productCategory: ProductCategory.jewellery,
  ),
  ProductCategoryOption(
    name: 'SKINCARE',
    productCategory: ProductCategory.skincare,
  ),
];

const products = [
  Product(
    name: 'FRIEND ARTY',
    subname: 'DIAMONDS',
    price: '2,300',
    image: 'assets/images/wrist_watches/1.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'FLOATING',
    subname: 'TOURBILLON',
    price: '1,700',
    image: 'assets/images/wrist_watches/2.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'MADEMOISELLE',
    subname: 'PRIVÉ',
    price: '1,800',
    image: 'assets/images/wrist_watches/3.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'PREMIÈRE',
    subname: 'ROCK',
    price: '1,300',
    image: 'assets/images/wrist_watches/4.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'EAU DE TOILETTE',
    subname: 'SPRAY',
    price: '120',
    image: 'assets/images/perfumes/1.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'EAU DE PARFUM',
    subname: 'SPRAY',
    price: '105',
    image: 'assets/images/perfumes/2.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'BODY SHOWER',
    subname: 'GEL',
    price: '350',
    image: 'assets/images/perfumes/3.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'DEODORANT',
    subname: 'STICK',
    price: '260',
    image: 'assets/images/perfumes/4.png',
    productCategory: ProductCategory.perfume,
  ),
];
