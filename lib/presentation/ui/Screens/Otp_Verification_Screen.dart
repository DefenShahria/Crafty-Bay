import 'dart:async';
import 'dart:developer';

import 'package:craftybay/presentation/State_holders/optVerificationController.dart';
import 'package:craftybay/presentation/ui/Screens/main_bottom_navBar.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../State_holders/user_info_controller.dart';
import 'CompleateProfileScreen.dart';

class otpVerification extends StatefulWidget {
  final String email;
  const otpVerification({super.key, required this.email});

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {

  final UserInfoController userInfoController = Get.find<UserInfoController>();

  static const maxSeconds = 120;
  int second = maxSeconds;
  int attempt =0;
  final TextEditingController _otpTEController = TextEditingController();
  Timer? timer;

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if(second >0){
          second--;
        }else{

        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImagePath.logoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter your OTP code',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('A 6 digit OTP code has been Sent',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColor.primaryColor,
                    inactiveColor: AppColor.primaryColor,
                    selectedColor: Colors.green,


                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,

                  onCompleted: (v) {

                  },
                  onChanged: (value) {

                  },
                  beforeTextPaste: (text) {
                     return true;
                  }, appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OTPVerificationController>(
                      builder: (controller) {
                        if(controller.otpVerificationinProgress) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () {
                              verifyOTP(controller);
                            }, child: const Text('Next'),);
                      }
                    ),),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                    text:  TextSpan(
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                  children: [
                    const TextSpan(
                      text: 'This code will expire in '
                    ),
                    TextSpan(
                      text: '$second s',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ]
                ),),
                TextButton(onPressed: (){}, child: const Text('Resend'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void>verifyOTP(OTPVerificationController controller) async {
    final response = await controller.verifyotp(widget.email, _otpTEController.text.trim());
    if (response) {
     await userInfoController.getuserinfo();
     log(userInfoController.userinfo.data.toString());
     if(userInfoController.userinfo.data != null ){
       Get.offAll(()=>const BottomNavigationScreen());
     }else{
       Get.offAll(()=>const CompleteProfile());
     }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Verification Failed !')));
      }
    }
  }

}
