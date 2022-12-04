import 'package:flutter/material.dart';

import '../../../core/style/color_manager.dart';
import '../../widgets/custom_tapbar_button.dart';
import '../../widgets/tab_bar_view_body.dart';
import '../../widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: TextWidget(
            text: 'Category',
            textSize: 15,
            isTitle: true,
            color: Colors.black,
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // Creates border
                color: ColorManager.primary),
            indicatorWeight: 2.0,
            isScrollable: true,
            tabs: [
              Tab(
                child: CustomTabBarBtn(
                  title: 'Laptop',
                ),
              ),
              Tab(
                child: CustomTabBarBtn(
                  title: 'Monitors',
                ),
              ),
              Tab(
                child: CustomTabBarBtn(
                  title: 'Pc Case',
                ),
              ),
              Tab(
                child: CustomTabBarBtn(
                  title: 'Bags',
                ),
              ),
              Tab(
                child: CustomTabBarBtn(
                  title: 'Mouses',
                ),
              ),
              Tab(
                child: CustomTabBarBtn(
                  title: 'Hard Drives',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Laptop
            TabBarViewBody(),
            //Monitors
            TabBarViewBody(),
            //Pc Case
            TabBarViewBody(),
            //Bags
            TabBarViewBody(),
            //Mouses
            TabBarViewBody(),
            //Hard Drives
            TabBarViewBody(),
          ],
        ),
      ),
    );
  }
}
