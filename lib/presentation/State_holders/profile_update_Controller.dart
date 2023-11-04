import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class ProfileUpdateController extends GetxController{
  bool _profileUpdateInProgess =false;
  String _message = '';

  bool get profileUpdateInProgress =>_profileUpdateInProgess;
  String get message => _message;

  Future<bool> createProfile(String name1,String name2,String name3,String name4,String postcode,String name5,String number,String number2,String name6,String city,String city2,String city3,String postcode2, String address,String number3) async {
    _profileUpdateInProgess = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.CreateProfile,{
      "cus_name": name1,
      "cus_add": name2,
      "cus_city": name3,
      "cus_state": name4,
      "cus_postcode": postcode,
      "cus_country": name5,
      "cus_phone": number,
      "cus_fax": number2,
      "ship_name": name6,
      "ship_add": city,
      "ship_city": city2,
      "ship_state": city3,
      "ship_postcode": postcode2,
      "ship_country": address,
      "ship_phone": number3
    });
    _profileUpdateInProgess = false;
    update();
    if(response.isSucess) {
      _profileUpdateInProgess = false;
      return true;
    }else {
      _profileUpdateInProgess = false;

      _message = 'Create Profile failed';
      return false;
    }
  }
}
