import 'package:get/get.dart';

class BottomNavCOntroller extends GetxController{
  int Current_index = 0;

  void ChangedIndex (int index){
    Current_index = index;
    update();
  }
}