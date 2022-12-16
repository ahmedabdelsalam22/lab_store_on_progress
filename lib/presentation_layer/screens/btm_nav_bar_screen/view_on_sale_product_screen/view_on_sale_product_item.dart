import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab_store/presentation_layer/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/route_manager/app_routes.dart';
import '../../../../core/style/color_manager.dart';
import '../../../../data_layer/models/product_model.dart';
import '../../../provider/cart_provider.dart';

class ViewOnSaleProductItem extends StatelessWidget {
  const ViewOnSaleProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);

    final cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          AppRoutes.productDetailsScreenRoute,
          arguments: productModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          elevation: 5,
          shadowColor: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(productModel.imageUrl),
                  height: 80,
                  width: 80,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextWidget(
                        text: productModel.title,
                        color: Colors.black,
                        textSize: 20,
                      ),
                    ),
                    TextWidget(
                      text: productModel.productCategoryName,
                      color: Colors.grey,
                      textSize: 15,
                    ),
                    RatingBarIndicator(
                      itemSize: 20.0,
                      rating: productModel.rate!.toDouble(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (productModel.isDiscount!)
                      Row(
                        children: [
                          Text('${productModel.price}\$',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${productModel.salePrice}\$',
                            style: TextStyle(color: ColorManager.primary),
                          ),
                        ],
                      ),
                    if (!productModel.isDiscount!)
                      Text(
                        '${productModel.salePrice}\$',
                        style: TextStyle(color: ColorManager.primary),
                      ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    //TODO add product to favorites screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        IconlyLight.heart,
                        size: 28,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    cartProvider.addProductToCart(productId: productModel.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        IconlyLight.buy,
                        size: 28,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
