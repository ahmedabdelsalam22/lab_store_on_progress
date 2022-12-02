import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/style/color_manager.dart';
import '../../data_layer/models/dummy_data.dart';

class SaleItemList extends StatelessWidget {
  const SaleItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return saleItemBuilder(dummyProducts[index], context);
        },
        itemCount: dummyProducts.length,
      ),
    );
  }

  Widget saleItemBuilder(Product dummyProduct, BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool isFav = false;
    /*void changeFavIcon() {
      isFav = !isFav;
    }*/

    return dummyProduct.discountValue != 0
        ? InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      SizedBox(
                        width: 145,
                        height: 210,
                        child: Image(
                          image: AssetImage(dummyProduct.imgUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                              child: Text(
                            '-${dummyProduct.discountValue}%',
                          )),
                        ),
                      ),
                      Positioned(
                        left: size.width * 0.23,
                        bottom: size.height * 0.011,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.5)),
                              child: Icon(
                                isFav ? IconlyBold.heart : IconlyLight.heart,
                                size: 30,
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RatingBarIndicator(
                    itemSize: 25.0,
                    rating: dummyProduct.rate?.toDouble() ?? 4.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    dummyProduct.title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    dummyProduct.category,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('${dummyProduct.oldPrice}\$',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      if (dummyProduct.discountValue != 0)
                        Text(
                          '${dummyProduct.oldPrice * (dummyProduct.discountValue) / 100}\$',
                          style: TextStyle(color: ColorManager.primary),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 0.0,
            width: 0.0,
          );
  }
}
