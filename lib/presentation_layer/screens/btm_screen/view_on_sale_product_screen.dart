import 'package:flutter/material.dart';
import 'package:lab_store/core/style/color_manager.dart';
import 'package:lab_store/presentation_layer/widgets/back_widget.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/models/product_model.dart';
import '../../controller/product_provider.dart';
import '../../widgets/view_on_sale_product_item.dart';

class ViewAllOnSaleProductsScreen extends StatelessWidget {
  const ViewAllOnSaleProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> onSaleProducts =
        productsProvider.getOnSaleProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackWidget(),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "OnSale Products",
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: onSaleProducts[index],
            child: ViewOnSaleProductItem(),
          );
        },
        itemCount: onSaleProducts.length,
      ),
    );
  }
}
