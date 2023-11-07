import 'dart:developer';

import 'package:craftybay/data/models/UserInfoModel.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController{
  bool _getUserINforInprogess = false;
  String _message ='';
  UserInfoModel _userInfo = UserInfoModel();

  bool get getUserINforInprogess => _getUserINforInprogess;
  String get message => _message;
  UserInfoModel get userinfo => _userInfo;

  Future<bool>getuserinfo()async{
    _getUserINforInprogess= true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.ReadProfile);
    _getUserINforInprogess =false;
    update();
    log(userinfo.data.toString());
    if(response.isSucess){
      _userInfo = UserInfoModel.fromJson(response.body!);
      update();
      return true;
    }else{
      _message = 'Cart list Loading Failed';
      return false;
    }
  }

}