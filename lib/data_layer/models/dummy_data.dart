import '../../core/app_strings_manager/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final int oldPrice;
  final String imgUrl;
  final int discountValue;
  final String category;
  final int? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.imgUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion1,
    category: 'Clothes',
    discountValue: 20,
    oldPrice: 35,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 35,
    imgUrl: AppAssets.fashion2,
    category: 'Clothes',
    oldPrice: 35,
  ),
  Product(
      id: '1',
      title: 'T-shirt',
      price: 35,
      imgUrl: AppAssets.fashion3,
      category: 'Clothes',
      oldPrice: 60,
      discountValue: 15),
];
