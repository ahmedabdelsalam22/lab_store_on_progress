import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/color_manager.dart';
import '../../../provider/favorite_provider.dart';
import '../../../widgets/check_out_widget.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/global_methode.dart';
import '../../../widgets/text_widget.dart';
import 'favorite_list_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favItemsList = favoriteProvider.getFavoriteItems.values.toList();

    return favItemsList.isEmpty
        ? Center(
            child: EmptyScreen(
              imPath: 'assets/images/cart.png',
              title: 'Your Favorites is empty!',
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
                text: 'Favorites(2)',
                color: ColorManager.primary,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethode.warningDialog(
                      title: 'Empty your Favorites',
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
            body: Column(
              children: [
                CheckOutWidget(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: favItemsList[index],
                        child: FavoriteListItemWidget(),
                      );
                    },
                    itemCount: favItemsList.length,
                  ),
                ),
              ],
            ),
          );
  }
}
