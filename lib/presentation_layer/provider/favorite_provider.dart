import 'package:flutter/material.dart';

import '../../data_layer/models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  Map<String, FavoriteModel> get getFavoriteItems => _favoriteItems;

  Map<String, FavoriteModel> _favoriteItems = {};

  void addProductToFavorite({required String productId}) {
    _favoriteItems.putIfAbsent(
      productId,
      () => FavoriteModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  // remove one item from cart
  Future<void> removeOneItem({
    required String productId,
  }) async {
    _favoriteItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _favoriteItems.clear();
    notifyListeners();
  }
}
