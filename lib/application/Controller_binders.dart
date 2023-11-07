import 'package:craftybay/presentation/State_holders/Home_slider_controller.dart';
import 'package:craftybay/presentation/State_holders/New_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/Special_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/add_ToCart_Controller.dart';
import 'package:craftybay/presentation/State_holders/bottom_Nav_controller.dart';
import 'package:craftybay/presentation/State_holders/cart_listController.dart';
import 'package:craftybay/presentation/State_holders/category_controller.dart';
import 'package:craftybay/presentation/State_holders/emali_Verification_controller.dart';
import 'package:craftybay/presentation/State_holders/optVerificationController.dart';
import 'package:craftybay/presentation/State_holders/popular_Product_controller.dart';
import 'package:craftybay/presentation/State_holders/productList_controller.dart';
import 'package:craftybay/presentation/State_holders/product_details_Controller.dart';
import 'package:craftybay/presentation/State_holders/profile_update_Controller.dart';
import 'package:craftybay/presentation/State_holders/reviewController.dart';
import 'package:craftybay/presentation/State_holders/user_info_controller.dart';
import 'package:get/get.dart';

class Controller_binder extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavCOntroller());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(Popular_ProductController());
    Get.put(Special_ProductController());
    Get.put(New_ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddtoCartController());
    Get.put(ProductListController());
    Get.put(ProfileUpdateController());
    Get.put(CartListController());
    Get.put(UserInfoController());
    Get.put(ReviewController());
  }
}