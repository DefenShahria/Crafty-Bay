import 'package:craftybay/data/models/ProductModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class New_ProductController extends GetxController{

  bool _getNewProductInProgress = false;

  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  bool get getPNewProductInProgress => _getNewProductInProgress;


  ProductModel get newProductModel => _newProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getNewProduct() async {
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.GetProduct('new'));
    if(response.isSucess){
      _getNewProductInProgress = false;
      _newProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage ='New product fetch failed';
      update();
      return false;
    }
  }

}