import 'package:flutter/material.dart';

import 'build_categ_item.dart';

class TabBarViewBody extends StatelessWidget {
  const TabBarViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return BuildCatItem();
        },
        itemCount: 8,
      ),
    );
  }
}
