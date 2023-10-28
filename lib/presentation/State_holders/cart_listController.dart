import 'package:craftybay/data/models/cart_list_model.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController{
  bool _getCartListINProgress = false;
  String _message= '';
  CartListModel _cartListModel = CartListModel();

  bool get getCartListINProgress => _getCartListINProgress;
  String get message => _message;
  CartListModel get cartListModel => _cartListModel;

  Future<bool>getcartList()async{
    _getCartListINProgress= true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getCartlist);
    _getCartListINProgress =false;
    if(response.isSucess){
      _cartListModel = CartListModel.fromJson(response.body!);
      update();
      return true;
    }else{
      _message = 'Cart list Loading Failed';
      return false;
    }
  }

}