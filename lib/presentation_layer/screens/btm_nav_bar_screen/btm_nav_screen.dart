import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lab_store/presentation_layer/provider/favorite_provider.dart';
import 'package:lab_store/presentation_layer/screens/btm_nav_bar_screen/setting_screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../core/style/color_manager.dart';
import '../../provider/cart_provider.dart';
import 'cart_screen/cart_screen.dart';
import 'category/category_screen.dart';
import 'fav_screen/favorites_screen.dart';
import 'home_screen/home_screen.dart';

class BtmNavScreen extends StatefulWidget {
  BtmNavScreen({Key? key}) : super(key: key);

  @override
  State<BtmNavScreen> createState() => _BtmNavScreenState();
}

class _BtmNavScreenState extends State<BtmNavScreen> {
  final _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const FavoritesScreen(),
    const SettingScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.home),
        title: "Home",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.category),
        title: "Category",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Consumer<CartProvider>(
          builder: (_, myCart, child) {
            return Badge(
              toAnimate: true,
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              position: BadgePosition.topEnd(top: -7, end: -7),
              badgeContent: Text(
                myCart.getCartItems.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: Icon(IconlyLight.buy),
            );
          },
        ),
        title: "Cart",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Consumer<FavoriteProvider>(
          builder: (_, myFav, child) {
            return Badge(
              toAnimate: true,
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              position: BadgePosition.topEnd(top: -7, end: -7),
              badgeContent: Text(
                myFav.getFavoriteItems.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: Icon(IconlyLight.heart),
            );
          },
          child: Icon(IconlyLight.heart),
        ),
        title: "Favorites",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.setting),
        title: "Setting",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
