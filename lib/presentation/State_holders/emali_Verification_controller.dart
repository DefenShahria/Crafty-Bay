import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationInProgress = false;
  String _message = '';

  bool get emailVerificationinProgress => _emailVerificationInProgress;
  String get message=> _message;

  Future<bool> verifyEmail(String email) async{
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.VerifyEmail(email));
    _emailVerificationInProgress =false;
    update();
    if(response.isSucess){
       _message = response.body?['data'] ?? '';
      return true;
    }else{
      _message = response.body?['data'] ?? '';
      return false;
    }
  }
}