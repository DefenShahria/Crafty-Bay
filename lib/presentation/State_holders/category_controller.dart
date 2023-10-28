import 'package:craftybay/data/models/categoryModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _getCategorysInProgress = false;
  String _message = '';

  CategoryProductModel _categoryModel = CategoryProductModel();
  CategoryProductModel get categorymodel => _categoryModel;

  bool get getCategoryinProgress => _getCategorysInProgress;
  String get message=> _message;

  Future<bool> getCategory() async{
    _getCategorysInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getCategory);
    _getCategorysInProgress =false;

    if(response.isSucess){
       _categoryModel = CategoryProductModel.fromJson(response.body??{});
       update();

       return true;
    }else{

      _message = response.body?['data'] ?? '';
      update();
      return false;
    }
  }
}