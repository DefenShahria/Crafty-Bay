import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/cart_listController.dart';
import 'package:craftybay/presentation/ui/widgets/product_In_Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/btm_btn_dtl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.find<BottomNavCOntroller>().ChangedIndex(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'Product Details',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          leading: const BackButton(
            color: Colors.black54,
          ),
        ),
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.getCartListInProgress){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartListController.cartListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                    return  cardProductCart(
                      cartdata: cartListController.cartListModel.data![index],);
                  }),
                ),
                 Bottmom_Btn_dtls(tag: 'Total Price', price: '${cartListController.totalPrice}', btnName: 'Check Out', produc_ID: 0, productSize: '', productColor: '', quantity: 0,)
              ],
            );
          }
        ),
      ),
    );
  }
}


