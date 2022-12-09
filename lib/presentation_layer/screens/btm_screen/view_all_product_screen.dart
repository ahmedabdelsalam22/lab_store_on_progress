import 'package:flutter/material.dart';
import 'package:lab_store/data_layer/models/product_model.dart';
import 'package:lab_store/presentation_layer/controller/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/style/color_manager.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/view_all_product_item.dart';

class ViewAllProductScreen extends StatelessWidget {
  const ViewAllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getAllProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackWidget(),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "All Products",
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
            value: allProducts[index],
            child: ViewAllProductItem(),
          );
        },
        itemCount: allProducts.length,
      ),
    );
  }
}
