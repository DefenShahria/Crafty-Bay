import 'package:craftybay/presentation/State_holders/auth_controller.dart';
import 'package:craftybay/presentation/ui/Screens/emailVerificationScreen.dart';
import 'package:craftybay/presentation/ui/Screens/main_bottom_navBar.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Splash_Screens extends StatefulWidget {
  const Splash_Screens({super.key});

  @override
  State<Splash_Screens> createState() => _Splash_ScreensState();
}

class _Splash_ScreensState extends State<Splash_Screens> {

  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  Future<void> nextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(()=> AuthController.isLoggedIn ? const BottomNavigationScreen() : const EmailVerificationScreen());
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(ImagePath.logoSVG,width: 100,),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 16,),
          const Text('1.0.0'),
          const SizedBox(height: 16,),

        ],
      ),
    );
  }
}
