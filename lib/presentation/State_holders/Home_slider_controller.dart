import 'package:craftybay/data/models/slider_Models.dart';
import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _geTHomeSlidersInProgress = false;
  String _message = '';

  Slider_model _sliderModel = Slider_model();
  Slider_model get slidermodel => _sliderModel;

  bool get geTHomeSlidersinProgress => _geTHomeSlidersInProgress;
  String get message=> _message;

  Future<bool> getHomeSlider() async{
    _geTHomeSlidersInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getHomeSlider);
    _geTHomeSlidersInProgress =false;

    if(response.isSucess){
       _sliderModel = Slider_model.fromJson(response.body??{});
       update();

       return true;
    }else{

      _message = response.body?['data'] ?? '';
      update();
      return false;
    }
  }
}