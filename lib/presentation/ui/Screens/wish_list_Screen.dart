import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/ui/Screens/popular_screen.dart';
import 'package:craftybay/presentation/ui/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/productdata.dart';
import '../../State_holders/WishlistContoller.dart';
import '../widgets/Category_cart.dart';

class WishList_Screen extends StatefulWidget {
  const WishList_Screen({super.key});

  @override
  State<WishList_Screen> createState() => _WishList_ScreenState();
}

class _WishList_ScreenState extends State<WishList_Screen> {

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        Get.find<BottomNavCOntroller>().ChangedIndex(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text('Wish List',style: TextStyle(
            color: Colors.black,
          ),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if (wishListController.getWishListIsInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (wishListController.wishListModel.data?.isEmpty ?? true) {
              return const Center(
                child: Text(
                  'Empty wishlist.',
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: wishListController.wishListModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                final ProductData productData = wishListController.wishListModel.data![index].product! as ProductData;
                return FittedBox(

                );
              },
            );
          },
        ),
      ),
    );
  }
}