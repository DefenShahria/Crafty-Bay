import 'package:craftybay/data/models/product.dart';
import 'package:craftybay/presentation/ui/Screens/productDetailsScreen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to( ProductDetailsScreen(productID: product.id!));
      },
      child: Card(
        shadowColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: SizedBox(
          width: 110,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight:Radius.circular(8) ),
                    image:   DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        product.image ?? '',
                      ),
                    )
                ),
              ),
               Text(product.title ?? '',maxLines: 1,style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price ?? 0}',style: TextStyle(fontSize: 12,color: AppColor.primaryColor)),
                   Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Icon(Icons.star,size: 15,color: Colors.amber,),
                      Text(
                        "${product.star ?? 0}",style: const TextStyle(fontSize: 12,color: Colors.blueGrey),),
                    ],
                  ),
                  Card(
                    color: AppColor.primaryColor,
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.favorite_border,size: 12,color: Colors.white,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
