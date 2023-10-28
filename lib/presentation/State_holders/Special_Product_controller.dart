import 'package:craftybay/data/models/ProductModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class Special_ProductController extends GetxController{
  bool _getSpecialProductInProgress = false;

  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = '';

  bool get getSpecialProductInProgress => _getSpecialProductInProgress;

  ProductModel get specialProductModel =>_specialProductModel;

  String get errorMessage => _errorMessage;


  Future<bool> getSpecialProduct() async {
    _getSpecialProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.GetProduct('special'));
    if(response.isSucess){
      _getSpecialProductInProgress = false;
      _specialProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage ='Special product fetch failed';
      update();
      return false;
    }
  }

}