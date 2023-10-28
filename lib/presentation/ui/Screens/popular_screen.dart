import 'package:craftybay/data/models/ProductModel.dart';
import 'package:craftybay/presentation/State_holders/productList_controller.dart';
import 'package:craftybay/presentation/ui/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreenByCategory extends StatefulWidget {
  final int? catrgoryId;
  final ProductModel? productModel;
  const ProductListScreenByCategory({super.key, this.catrgoryId, this.productModel});

  @override
  State<ProductListScreenByCategory> createState() => _ProductListScreenByCategoryState();
}

class _ProductListScreenByCategoryState extends State<ProductListScreenByCategory> {
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.catrgoryId != null ) {
        Get.find<ProductListController>()
            .getProductsByCatagory(widget.catrgoryId!);
      }else if(widget.productModel != null) {
        Get.find<ProductListController>().setProducts(widget.productModel!);
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: const Text('Product List',style: TextStyle(
          color: Colors.black,
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if(productListController.getProductInProgress){
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              itemCount: productListController.productmodel.data?.length?? 0,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
            ), itemBuilder: (context,index){
               return FittedBox(child: ProductCard(
                 product: productListController.productmodel.data![index] ));
            }),
          );
        }
      ),
    );
  }
}
