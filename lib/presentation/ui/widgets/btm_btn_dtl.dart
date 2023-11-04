import 'dart:developer';

import 'package:craftybay/presentation/State_holders/add_ToCart_Controller.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottmom_Btn_dtls extends StatelessWidget {
  const Bottmom_Btn_dtls({
    super.key, required this.tag, required this.price, required this.btnName, required this.produc_ID, required this.productSize, required this.productColor, required this.quantity,
  });
final String tag;
final String price;
final String btnName;
final int produc_ID;
final String productSize;
final String productColor;
final int quantity;

  @override
  Widget build(BuildContext context) {
    log(productColor);
    log(produc_ID.toString());
    log(productSize);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration:
      BoxDecoration(color: AppColor.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(tag,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
              SizedBox(
                height: 4,
              ),
              Text('\$ $price',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.primaryColor)),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddtoCartController>(
              builder: (addToCartController) {
                if(addToCartController.addtoCartInProgess){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    addToCartController.addToCart(produc_ID.toString(), productColor.toString(), productSize.toString(),quantity).then((result){
                      if(result){
                        Get.snackbar('Cart msg', 'Successfully Added on cart',snackPosition: SnackPosition.BOTTOM);
                      }else {
                      Get.snackbar('Cart msg', 'Unsuccessful To added on Cart',snackPosition: SnackPosition.BOTTOM);
                    }
                  });
                  }, child: Text(btnName,style: const TextStyle(fontSize: 14),),);
              }
            ),),
        ],
      ),
    );
  }
}
