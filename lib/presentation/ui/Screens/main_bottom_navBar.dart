import 'package:craftybay/presentation/State_holders/Home_slider_controller.dart';
import 'package:craftybay/presentation/State_holders/New_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/Special_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/category_controller.dart';
import 'package:craftybay/presentation/State_holders/popular_Product_controller.dart';
import 'package:craftybay/presentation/ui/Screens/HomePage.dart';
import 'package:craftybay/presentation/ui/Screens/cartScreen.dart';
import 'package:craftybay/presentation/ui/Screens/category_screen.dart';
import 'package:craftybay/presentation/ui/Screens/wish_list_Screen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  BottomNavCOntroller bottomNavCOntroller = Get.put(BottomNavCOntroller());
   final List<Widget> _screen = [
    const HomePage(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishList_Screen(),
  ];


  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategory();
      Get.find<Popular_ProductController>().getPopularProduct();
      Get.find<Special_ProductController>().getSpecialProduct();
      Get.find<New_ProductController>().getNewProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavCOntroller>(
        builder: (controller) {
        return Scaffold(
          body: _screen[controller.Current_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.Current_index,
            onTap:controller.ChangedIndex,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: Colors.blueGrey,
            showUnselectedLabels: true,
            elevation: 4,
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard,),label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border,),label: 'Wish'),
          ],),
        );
      }
    );
  }
}
