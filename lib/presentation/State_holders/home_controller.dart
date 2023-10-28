import 'package:craftybay/presentation/State_holders/base_state_controller.dart';

class HomeController extends BaseStateController{
  @override
  Future<bool> call(BaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  }


class HomeParams extends BaseParams{
  final String userName;
  final String password;

  HomeParams(this.userName, this.password);
}

main(){
  HomeParams params = HomeParams('name', 'password');
  HomeController homecontroller = HomeController();
  homecontroller.call(params);
}