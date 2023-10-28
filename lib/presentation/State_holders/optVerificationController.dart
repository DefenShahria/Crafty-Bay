import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/State_holders/auth_controller.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController{
  bool _otpVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationinProgress => _otpVerificationInProgress;
  String get message=> _message;

  Future<bool> verifyotp(String email,String otp) async{
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.Verifyotp(email,otp));
    _otpVerificationInProgress =false;
    update();
    if(response.isSucess){
      await AuthController.setAccessToken(response.body?['data']);
      _message = response.body?['data'] ?? '';
      return true;
    }else{
      _message = response.body?['data'] ?? '';
      return false;
    }
  }
}