import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab_store/presentation_layer/widgets/text_widget.dart';

import '../../core/style/color_manager.dart';

class BuildCatItem extends StatelessWidget {
  const BuildCatItem({Key? key}) : super(key: key);

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
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.yjSbZJfj8V3T6Nub4Cv97wHaEy?pid=ImgDet&rs=1'),
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
                    text: 'category',
                    color: Colors.grey,
                    textSize: 15,
                  ),
                  RatingBarIndicator(
                    itemSize: 20.0,

                    /// dummyProduct.rate?.toDouble() ?? 4.0
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
                  TextWidget(
                    text: '50\$',
                    color: ColorManager.primary,
                    textSize: 15,
                  ),
                  /*Row(
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
                                '${dummyProduct.oldPrice! * (dummyProduct.discountValue) / 100}\$',
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
                    ),*/
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
