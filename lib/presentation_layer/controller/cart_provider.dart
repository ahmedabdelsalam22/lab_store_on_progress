import 'package:flutter/cupertino.dart';
import 'package:lab_store/data_layer/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> get getCartItems => _cartItems;

  Map<String, CartModel> _cartItems = {};

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
  }
}
