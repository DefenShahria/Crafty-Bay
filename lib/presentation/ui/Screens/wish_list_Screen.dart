import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/ui/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList_Screen extends StatefulWidget {
  const WishList_Screen({super.key});

  @override
  State<WishList_Screen> createState() => _WishList_ScreenState();
}

class _WishList_ScreenState extends State<WishList_Screen> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        Get.find<BottomNavCOntroller>().ChangedIndex(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text('Wish List',style: TextStyle(
            color: Colors.black,
          ),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 8,
          ), itemBuilder: (context,index){
           // return  const FittedBox(child: ProductCard(product: '',));
          }),
        ),
      ),
    );
  }
}
