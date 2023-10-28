import 'package:craftybay/presentation/State_holders/Home_slider_controller.dart';
import 'package:craftybay/presentation/State_holders/New_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/Special_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/category_controller.dart';
import 'package:craftybay/presentation/State_holders/popular_Product_controller.dart';
import 'package:craftybay/presentation/ui/Screens/popular_screen.dart';
import 'package:craftybay/presentation/ui/Screens/userInfo.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:craftybay/presentation/ui/widgets/Category_cart.dart';
import 'package:craftybay/presentation/ui/widgets/Circular_icon_Button.dart';
import 'package:craftybay/presentation/ui/widgets/HomeSlider.dart';
import 'package:craftybay/presentation/ui/widgets/ProductCard.dart';
import 'package:craftybay/presentation/ui/widgets/SearchBar.dart';
import 'package:craftybay/presentation/ui/widgets/home_Screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImagePath.logoNavSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {
                Get.to(UserInfo());
              },
            ),
            const SizedBox(width: 8,),
            CircularIconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(width: 8,),
            CircularIconButton(
              icon: Icons.notification_important,
              onTap: () {},
            ),
            const SizedBox(width: 8,),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Search_bar(),
              const SizedBox(height: 16,),
             GetBuilder<HomeSliderController>(
                builder: (homeSliderContoller) {
                  if(homeSliderContoller.geTHomeSlidersinProgress) {
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return  HomeSlider(
                    sliders: homeSliderContoller.slidermodel.data ?? [],);
                }
              ),
              const SizedBox(height: 8,),
              HomeScreen_Titles(
                title: 'Category',
                title2: 'See All',
                onTap: () {
                  Get.find<BottomNavCOntroller>().ChangedIndex(1);
                },
              ),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {

                    if(categoryController.getCategoryinProgress) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: categoryController.categorymodel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Category_cart(
                            categorydata: categoryController.categorymodel.data![index], onTap: () {
                            Get.to(ProductListScreenByCategory(catrgoryId:categoryController.categorymodel.data![index].id!));
                          },
                          );
                        });
                  }
                ),
              ),
              const SizedBox(height: 16,),
              HomeScreen_Titles(title: 'Populer', title2: 'See All', onTap: () {
                Get.to(ProductListScreenByCategory(productModel: Get.find<Popular_ProductController>().popularProductModel));
              }),
              const SizedBox(height: 8,),
              SizedBox(
                height: 150,
                child: GetBuilder<Popular_ProductController>(
                  builder: (PopularproductController) {
                    if(PopularproductController.getPopularProductInProgress) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: PopularproductController.popularProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return  ProductCard(
                            product: PopularproductController.popularProductModel.data![index],
                          );
                        });
                  }
                ),
              ),
              const SizedBox(height: 16,),
              HomeScreen_Titles(
                  title: 'Special', title2: 'See All', onTap: () {
                Get.to(ProductListScreenByCategory(productModel: Get.find<Special_ProductController>().specialProductModel));
              }),
              const SizedBox(height: 8,),
              SizedBox(
                height: 150,
                child: GetBuilder<Special_ProductController>(
                  builder: (SpecialProductController) {
                    if(SpecialProductController.getSpecialProductInProgress) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SpecialProductController.specialProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product:  SpecialProductController.specialProductModel.data![index],
                          );
                        });
                  }
                ),
              ),
              const SizedBox(height: 16,),
              HomeScreen_Titles(title: 'New', title2: 'See All', onTap: () {
                Get.to(ProductListScreenByCategory(productModel: Get.find<New_ProductController>().newProductModel));
              }),
              const SizedBox(height: 8,),
              SizedBox(
                height: 150,
                child: GetBuilder<New_ProductController>(
                  builder: (newProductController) {
                    if(newProductController.getPNewProductInProgress) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductController.newProductModel.data?.length?? 0,
                        itemBuilder: (context, index) {
                          return  ProductCard(
                            product: newProductController.newProductModel.data![index],
                          );
                        });
                  }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}










