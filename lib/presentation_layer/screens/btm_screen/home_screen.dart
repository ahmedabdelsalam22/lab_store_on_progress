import 'package:flutter/material.dart';
import 'package:lab_store/presentation_layer/widgets/view_all_widget.dart';

import '../../widgets/home_swiper.dart';
import '../../widgets/new_products_list.dart';
import '../../widgets/on_sale_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => debugPrint('view all btn'),
            ),
            const SizedBox(
              height: 20,
            ),
            SaleItemList(),
            const SizedBox(
              height: 5,
            ),
            ViewAllWidget(
              title: 'All Products',
              subtitle: 'You\'ve never seen it before!',
              onPressed: () => debugPrint('view all btn'),
            ),
            const SizedBox(
              height: 20,
            ),
            NewProductList(),
          ],
        ),
      ),
    );
  }
}
