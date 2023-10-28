import 'package:craftybay/data/models/ProductModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class Popular_ProductController extends GetxController{
  bool _getPopularProductInProgress = false;

  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';

  bool get getPopularProductInProgress => _getPopularProductInProgress;

  ProductModel get popularProductModel => _popularProductModel;

  String get errorMessage => _errorMessage;


  Future<bool> getPopularProduct() async {
    _getPopularProductInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.GetProduct('popular'));
    if(response.isSucess){
      _getPopularProductInProgress = false;

      _popularProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage ='Popular product fetch failed';
      update();
      return false;
    }
  }



}