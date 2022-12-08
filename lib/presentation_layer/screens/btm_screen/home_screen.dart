import 'package:flutter/material.dart';
import 'package:lab_store/core/route_manager/app_routes.dart';
import 'package:lab_store/presentation_layer/controller/product_provider.dart';
import 'package:lab_store/presentation_layer/widgets/view_all_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/home_on_sale_list.dart';
import '../../widgets/home_products_list.dart';
import '../../widgets/home_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSwiper(),
            const SizedBox(
              height: 20,
            ),
            ViewAllWidget(
              title: 'Sale',
              subtitle: 'Super summer sale',
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutes.viewOnSaleProductsScreenRoute,
                    arguments: productProvider);
              },
            ),
            SizedBox(
              height: size.height * 0.40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SaleItemBuilder(
                    productModel: productProvider.getOnSaleProducts[index],
                  );
                },
                itemCount: productProvider.getOnSaleProducts.length < 4
                    ? productProvider.getOnSaleProducts.length
                    : 4,
              ),
            ),
            ViewAllWidget(
              title: 'All Products',
              subtitle: 'You\'ve never seen it before!',
              onPressed: () => debugPrint('view all btn'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return productItemBuilder(
                    productModel: productProvider.getAllProducts[index],
                  );
                },
                itemCount: productProvider.getAllProducts.length < 4
                    ? productProvider.getAllProducts.length
                    : 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
