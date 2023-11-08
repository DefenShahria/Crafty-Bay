import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/wishListModel.dart';
import '../../data/utility/networkCaller.dart';
import '../../data/utility/networkResponse.dart';
import '../ui/utility/urls/urls.dart';

class WishListController extends GetxController{
  bool _getWishListIsInProgress = false;
  String _message ='';
  WishListModel _wishListModel = WishListModel();

  bool get getWishListIsInProgress => _getWishListIsInProgress;
  String get message => _message;
  WishListModel get wishListModel => _wishListModel;

  Future<bool>getWishList()async{
    _getWishListIsInProgress= true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getWishList);
    _getWishListIsInProgress =false;
    update();
    log(wishListModel.data.toString());
    if(response.isSucess){
      _wishListModel = WishListModel.fromJson(response.body!);
      update();
      return true;
    }else{
      _message = 'Wish list Loading Failed';
      return false;
    }
  }

}