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
  /**
   * Wrist Watches
   */
  Product(
    name: 'FRIEND ARTY DIAMONDS',
    price: '2,300',
    image: 'assets/images/wrist_watches/1.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'FLOATING TOURBILLON',
    price: '1,700',
    image: 'assets/images/wrist_watches/2.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'MADEMOISELLE PRIVÉ',
    price: '1,800',
    image: 'assets/images/wrist_watches/3.png',
    productCategory: ProductCategory.wristWatch,
  ),
  Product(
    name: 'PREMIÈRE ROCK',
    price: '1,300',
    image: 'assets/images/wrist_watches/4.png',
    productCategory: ProductCategory.wristWatch,
  ),
  /**
   * Leather Goods
   */
  Product(
    name: 'VANITY WITH CHAIN',
    price: '3,600',
    image: 'assets/images/leather_goods/1.png',
    productCategory: ProductCategory.leatherGoods,
  ),
  Product(
    name: 'AIRPODS PRO CASE',
    price: '2,550',
    image: 'assets/images/leather_goods/2.png',
    productCategory: ProductCategory.leatherGoods,
  ),
  Product(
    name: 'CLASSIC BELT BAG',
    price: '2,675',
    image: 'assets/images/leather_goods/3.png',
    productCategory: ProductCategory.leatherGoods,
  ),
  Product(
    name: 'CLASSIC WALLET ON CHAIN',
    price: '2,950',
    image: 'assets/images/leather_goods/4.png',
    productCategory: ProductCategory.leatherGoods,
  ),
  /**
   * Perfumes
   */
  Product(
    name: 'EAU DE TOILETTE SPRAY',
    price: '120',
    image: 'assets/images/perfumes/1.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'EAU DE PARFUM SPRAY',
    price: '105',
    image: 'assets/images/perfumes/2.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'PARIS BIARRITZ PARFUM',
    price: '350',
    image: 'assets/images/perfumes/3.png',
    productCategory: ProductCategory.perfume,
  ),
  Product(
    name: 'BLEU DE CHANEL DEODORANT',
    price: '260',
    image: 'assets/images/perfumes/4.png',
    productCategory: ProductCategory.perfume,
  ),
  /**
   * Jewellery
   */
  Product(
    name: 'CAMÉLIA PRÉCIEUX',
    price: '18,550',
    image: 'assets/images/jewellery/1.png',
    productCategory: ProductCategory.jewellery,
  ),
  Product(
    name: 'COCO CRUSH BRACELET',
    price: '7,550',
    image: 'assets/images/jewellery/2.png',
    productCategory: ProductCategory.jewellery,
  ),
  Product(
    name: 'BOUTON DE CAMÉLIA',
    price: '6,300',
    image: 'assets/images/jewellery/3.png',
    productCategory: ProductCategory.jewellery,
  ),
  Product(
    name: 'COCO CRUSH RING',
    price: '3,600',
    image: 'assets/images/jewellery/4.png',
    productCategory: ProductCategory.jewellery,
  ),
  /**
   * Skincare
   */
  Product(
    name: 'L’HUILE DÉMAQUILLANTE',
    price: '50',
    image: 'assets/images/skincare/1.png',
    productCategory: ProductCategory.skincare,
  ),
  Product(
    name: 'SUBLIMAGE LA CRÈME YEUX',
    price: '260',
    image: 'assets/images/skincare/2.png',
    productCategory: ProductCategory.skincare,
  ),
  Product(
    name: 'LE LIFT CONCENTRÉ',
    price: '130',
    image: 'assets/images/skincare/3.png',
    productCategory: ProductCategory.skincare,
  ),
  Product(
    name: 'N°1 DE CHANEL L’EAU ROUGE',
    price: '110',
    image: 'assets/images/skincare/4.png',
    productCategory: ProductCategory.skincare,
  ),
];
