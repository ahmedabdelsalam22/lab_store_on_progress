import 'package:flutter/material.dart';
import 'package:lab_store/presentation_layer/controller/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/empty_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList = cartProvider.getCartItems.values.toList();

    return cartItemsList.isEmpty
        ? Center(
            child: EmptyScreen(
              imPath: 'assets/images/cart.png',
              title: 'Your cart is empty!',
              buttonText: 'shop now!',
            ),
          )
        : Scaffold(
            body: Center(
              child: Text('cart'),
            ),
          );
  }
}
