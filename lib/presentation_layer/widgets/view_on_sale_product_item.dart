import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab_store/presentation_layer/widgets/text_widget.dart';

import '../../core/style/color_manager.dart';

class ViewOnSaleProductItem extends StatelessWidget {
  const ViewOnSaleProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                image: AssetImage('assets/images/category/case.jpeg'),
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
                  TextWidget(
                    text: 'title',
                    color: Colors.black,
                    textSize: 20,
                  ),
                  TextWidget(
                    text: 'productCategoryName',
                    color: Colors.grey,
                    textSize: 15,
                  ),
                  RatingBarIndicator(
                    itemSize: 20.0,
                    rating: 4.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('old_price\$',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      TextWidget(
                        text: 'price\$',
                        color: ColorManager.primary,
                        textSize: 15,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      IconlyLight.heart,
                      size: 30,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
