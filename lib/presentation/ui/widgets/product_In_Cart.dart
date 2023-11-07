import 'package:craftybay/data/models/ProductDetails.dart';
import 'package:craftybay/data/models/cart_list_model.dart';
import 'package:craftybay/presentation/State_holders/cart_listController.dart';
import 'package:craftybay/presentation/ui/Screens/productDetailsScreen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:craftybay/presentation/ui/widgets/custom_Stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardProductCart extends StatefulWidget {
  final CartData cartdata;
  const cardProductCart({
    super.key, required this.cartdata,
  });

  @override
  State<cardProductCart> createState() => _cardProductCartState();
}

class _cardProductCartState extends State<cardProductCart> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen( productID: widget.cartdata.product!.id!,));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 90,
              decoration:  BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(widget.cartdata.product?.image ?? ''))),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
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
                               Text(widget.cartdata.product?.title?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              RichText(
                                  text:  TextSpan(
                                      style: TextStyle(color: Colors.black54),
                                      children: [
                                        TextSpan(text: 'Color: ${widget.cartdata.color ?? ''}'),
                                        TextSpan(text: 'Size: ${widget.cartdata.size ?? ''}'),
                                      ]))
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.find<CartListController>().removeFromCart(widget.cartdata.productId!);
                            }, icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.cartdata.product?.price?? ''}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor),
                        ),
                        CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue:  1,
                            value: widget.cartdata.quantity ?? 3,
                            onChange: (int value) {
                              Get.find<CartListController>().changeItem(widget.cartdata.id!, value);
                            })
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}