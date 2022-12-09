import 'package:flutter/material.dart';

import '../../data_layer/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getAllProducts {
    return _products;
  }

  List<ProductModel> get getOnSaleProducts {
    return _products.where((element) => element.isOnSale).toList();
  }

  List<ProductModel> _products = [
    ProductModel(
      id: 'Hp 840 G5',
      title: 'Hp 840 G5',
      salePrice: 6000,
      imageUrl: 'assets/images/category/lap.JPEG',
      productCategoryName: 'Laptop',
      price: 7000,
      isOnSale: true,
      isDiscount: true,
    ),
    ProductModel(
      id: 'fujitsu b24-8 te pro',
      title: 'fujitsu b24-8 te pro',
      salePrice: 5000,
      imageUrl: 'assets/images/category/monitor.PNG',
      productCategoryName: 'Monitor',
      price: 7000,
      isOnSale: false,
      isDiscount: true,
    ),
    ProductModel(
      id: 'Opto Mechanical Gaming Keyboard',
      title: 'Opto Mechanical Gaming Keyboard',
      price: 180,
      salePrice: 150,
      imageUrl: 'assets/images/category/keyboard.JPEG',
      productCategoryName: 'Keyboard',
      isOnSale: false,
      isDiscount: true,
    ),
    ProductModel(
      id: 'Apple MacBook Pro',
      title: 'Apple MacBook Pro',
      price: 10000,
      salePrice: 9500,
      imageUrl: 'assets/images/category/mackbook.jpg',
      productCategoryName: 'Laptop',
      isOnSale: true,
      isDiscount: true,
    ),
    ProductModel(
      id: 'Dragon mouse',
      title: 'Dragon mouse',
      price: 170,
      salePrice: 170,
      imageUrl: 'assets/images/category/mouse.jpg',
      productCategoryName: 'Mouses',
      isOnSale: false,
      isDiscount: false,
    ),
    ProductModel(
      id: 'ssd drive 120G',
      title: 'ssd drive 120G',
      price: 500,
      salePrice: 500,
      imageUrl: 'assets/images/category/hard.jpg',
      productCategoryName: 'Hard Drives',
      isOnSale: false,
      isDiscount: false,
    ),
    ProductModel(
      id: 'Gaming Pc Case',
      title: 'Gaming Pc Case',
      price: 14000,
      salePrice: 14000,
      imageUrl: 'assets/images/category/case.jpeg',
      productCategoryName: 'Pc Case',
      isOnSale: true,
      isDiscount: false,
    ),
    ProductModel(
      id: 'LabTop Bag',
      title: 'LabTop Bag',
      price: 800,
      salePrice: 800,
      imageUrl: 'assets/images/category/bag.jpg',
      productCategoryName: 'Bags',
      isOnSale: true,
      isDiscount: false,
    ),
  ];
}
