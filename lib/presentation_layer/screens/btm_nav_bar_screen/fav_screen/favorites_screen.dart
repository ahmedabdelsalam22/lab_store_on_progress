import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/style/color_manager.dart';
import '../../../widgets/global_methode.dart';
import '../../../widgets/text_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: ColorManager.backGround,
        title: TextWidget(
          text: 'Cart(2)',
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
                  /// TODO delete all favorites items from favoritesScreen
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
    );
  }
}
