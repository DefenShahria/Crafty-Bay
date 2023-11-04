import 'package:craftybay/data/models/ProductDetails.dart';
import 'package:craftybay/data/models/productDetailsModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _getProductdetailsInprogess = false;
  ProductDetails _productDetails = ProductDetails();

  List<String>_availabeSize= [];
  List<String> get availabeSize => _availabeSize;

  List<String> _availabeColors = [];

  String _errorMessage = '';

  bool get getProductDetailsInprogess =>_getProductdetailsInprogess;
  ProductDetails get productDetails =>_productDetails;
  List<String> get availableColors => _availabeColors;

  Future<bool> getProductdetails(int id)async{
    _getProductdetailsInprogess = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.GetPproductDetails(id));
    if(response.isSucess){
      _productDetails  = ProductDetailsModel.fromJson(response.body ?? {}).data!.first;
      _getProductdetailsInprogess = false;
      _ConvertStringToColor(_productDetails.color ?? '');
      _ConvertStringtoSize(_productDetails.size ?? '');
      update();
      return true;
    }else{
      _errorMessage = 'Fetch Product Details Failed';
      update();
      return false;
    }
  }


  void _ConvertStringToColor(String color){
    _availabeColors = color.split(',');
  }

  void _ConvertStringtoSize(String size){
    _availabeSize = size.split(',');
    update();
  }

}