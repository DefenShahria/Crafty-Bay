import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/category_controller.dart';
import 'package:craftybay/presentation/ui/Screens/popular_screen.dart';
import 'package:craftybay/presentation/ui/widgets/Category_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavCOntroller>().ChangedIndex(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavCOntroller>().ChangedIndex(0);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            'Category',
          ),
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CategoryController>().getCategory();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                if(categoryController.getCategoryinProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  itemCount: categoryController.categorymodel.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return  FittedBox(
                          child: Category_cart(categorydata: categoryController.categorymodel.data![index],
                          onTap:(){
                        Get.to(ProductListScreenByCategory(catrgoryId:categoryController.categorymodel.data![index].id!));
                          }
                      )
                      );
                    });
              }
            ),
          ),
        ),
      ),
    );
  }
}
