import 'package:craftybay/data/models/cart_list_model.dart';
import 'package:craftybay/presentation/State_holders/cart_listController.dart';
import 'package:craftybay/presentation/ui/Screens/productDetailsScreen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:craftybay/presentation/ui/widgets/custom_Stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardProductCart extends StatelessWidget {
  final CartData cartdata;
  const cardProductCart({
    super.key, required this.cartdata,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen( productID: cartdata.product!.id!,));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(cartdata.product?.image ?? ''))),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartdata.product?.title ?? '',
                                style:
                                const TextStyle(fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  children: [
                                    TextSpan(text: 'Color: ${cartdata.color ?? ''} '),
                                    TextSpan(text: 'Size: ${cartdata.size}'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.find<CartListController>().removeFromCart(cartdata.productId!);
                            },
                            icon: const Icon(Icons.delete_outline))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${cartdata.product?.price ?? ''}',
                          style:  TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 85,
                          child: FittedBox(
                            child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 20,
                              stepValue: 1,
                              value: cartdata.quantity ?? 1,
                              onChange: (int value) {
                                Get.find<CartListController>().changeItem(cartdata.id!, value);
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}