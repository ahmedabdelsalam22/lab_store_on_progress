import 'package:flutter/material.dart';
import 'package:lab_store/data_layer/models/product_model.dart';
import 'package:lab_store/presentation_layer/controller/product_provider.dart';
import 'package:provider/provider.dart';

import 'build_categ_item.dart';

class TabBarViewBody extends StatelessWidget {
  final String categoryName;

  const TabBarViewBody({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> getByCategoryName =
        productProvider.findByCategory(categoryName);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: getByCategoryName[index],
            child: BuildCatItem(),
          );
        },
        itemCount: getByCategoryName.length,
      ),
    );
  }
}
