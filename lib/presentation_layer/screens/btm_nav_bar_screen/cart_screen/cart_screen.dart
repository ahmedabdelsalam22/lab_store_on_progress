import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/color_manager.dart';
import '../../../provider/cart_provider.dart';
import '../../../widgets/check_out_widget.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/global_methode.dart';
import '../../../widgets/text_widget.dart';
import 'cart_list_item_widget.dart';

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
            backgroundColor: ColorManager.backGround,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: ColorManager.backGround,
              title: TextWidget(
                text: 'Cart(${cartItemsList.length})',
                color: ColorManager.primary,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethode.warningDialog(
                      title: 'Empty your cart',
                      subtitle: 'Are you sure?',
                      fct: () async {
                        cartProvider.clearCart();
                      },
                      context: context,
                    );
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                CheckOutWidget(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: cartItemsList[index],
                        child: CartListItemWidget(),
                      );
                    },
                    itemCount: cartItemsList.length,
                  ),
                ),
              ],
            ),
          );
  }
}
