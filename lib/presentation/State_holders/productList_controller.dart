import 'package:craftybay/data/models/ProductModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{
  bool _getProductInProgress = false;
  String _message = '';

  ProductModel _productModel = ProductModel();
  ProductModel get productmodel => _productModel;

  bool get getProductInProgress => _getProductInProgress;
  String get message=> _message;

  Future<bool> getProductsByCatagory(int category_id) async{
    _getProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByCategory(category_id));
    _getProductInProgress =false;

    if(response.isSucess){
       _productModel = ProductModel.fromJson(response.body??{});
       update();

       return true;
    }else{

      _message = response.body?['data'] ?? '';
      update();
      return false;
    }
  }

  void setProducts(ProductModel productModel){
    _productModel = productModel;
    update();
  }
}