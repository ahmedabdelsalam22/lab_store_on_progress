import 'package:flutter/material.dart';
import 'package:lab_store/core/style/color_manager.dart';
import 'package:lab_store/presentation_layer/widgets/back_widget.dart';

import '../../widgets/view_on_sale_product_item.dart';

class ViewAllOnSaleProductsScreen extends StatelessWidget {
  const ViewAllOnSaleProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackWidget(),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "OnSale Products",
          style: TextStyle(
              color: ColorManager.primary, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, state) {
          return ViewOnSaleProductItem();
        },
        itemCount: 10,
      ),
    );
  }
}
