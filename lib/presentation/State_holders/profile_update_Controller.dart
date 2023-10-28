import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class ProfileUpdateController extends GetxController{
  bool _profileUpdateInProgess =false;
  String _message = '';

  bool get profileUpdateInProgress =>_profileUpdateInProgess;
  String get message => _message;

  Future<bool> createProfile(String name1,String name2,String number,String city, String address) async {
    _profileUpdateInProgess = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.CreateProfile,{
      "firstName":name1,
      "lastName":name2,
      "mobile":number,
      "city":city,
      "shippingAddress":address
    });
    _profileUpdateInProgess = false;
    update();
    if(response.isSucess) {
      return true;
    }else {

      _message = 'Create Profile failed';
      return false;
    }
  }
}
