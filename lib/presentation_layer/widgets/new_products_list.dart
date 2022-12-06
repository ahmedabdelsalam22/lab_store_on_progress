import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab_store/data_layer/models/dummy_data.dart';

import '../../core/route_manager/app_routes.dart';
import '../../core/style/color_manager.dart';

class NewProductList extends StatelessWidget {
  const NewProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return productItemBuilder(dummyProducts[index], context);
        },
        itemCount: dummyProducts.length,
      ),
    );
  }

  Widget productItemBuilder(Product dummyProduct, BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool isFav = false;
    void changeFavIcon() {
      isFav = !isFav;
    }

    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
            AppRoutes.productDetailsScreenRoute,
            arguments: dummyProduct);
      },
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
                    fit: BoxFit.scaleDown,
                  ),
                ),
                if (dummyProduct.discountValue !=
                    0) //not show items which have not discount
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
            SizedBox(
              width: 145,
              child: Text(
                dummyProduct.title,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
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
                if (dummyProduct.discountValue != 0)
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
                      Text(
                        '${dummyProduct.oldPrice * (dummyProduct.discountValue) / 100}\$',
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                if (dummyProduct.discountValue == 0)
                  Text(
                    '${dummyProduct.oldPrice}\$',
                    style: TextStyle(color: ColorManager.primary),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/* ratingBar(int? rate) {
    return SizedBox(
      child: Row(
        children: [
          RatingBar.builder(
            itemSize: 23,
            initialRating: rate!.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          Text('$rate'),
        ],
      ),
    );
  }*/

}
