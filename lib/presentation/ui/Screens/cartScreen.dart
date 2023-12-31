import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/cart_listController.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:craftybay/presentation/ui/widgets/product_In_Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/btm_btn_dtl.dart';
import 'checkout_screen.dart';

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
          elevation: 1,
          title: const Text(
            'Product Details',
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$ ${cartListController.totalPrice}',
                            style:  TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            if (Get.find<CartListController>().cartListModel.data?.isNotEmpty ?? false) {
                              Get.to(() => const CheckOutScreen());
                            }
                          },
                          child: const Text('Checkout'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}