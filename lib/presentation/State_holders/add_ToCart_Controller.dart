import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class AddtoCartController extends GetxController{
  bool _addTOCartInProgess =false;
  String _message = '';

  bool get addtoCartInProgess =>_addTOCartInProgess;
  String get message => _message;

  Future<bool> addToCart(String productID,String color,String size) async {
    _addTOCartInProgess = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.AddtoCart,{
      "product_id":productID,
      "color":color,
      "size":size
    });
    _addTOCartInProgess = false;
    update();
    if(response.isSucess) {
      return true;
    }else {

      _message = 'Add to cart failed';
      return false;
    }
  }
}
