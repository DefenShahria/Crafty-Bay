import 'package:craftybay/presentation/State_holders/user_info_controller.dart';
import 'package:craftybay/presentation/ui/Screens/CompleateProfileScreen.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final UserInfoController userInfoController = Get.find<UserInfoController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserInfoController>().getuserinfo();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(16.0),
                child: GetBuilder<UserInfoController>(

                  builder: (userInfoController) {
                    if(userInfoController.getUserINforInprogess){
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SvgPicture.asset(
                            ImagePath.logoSVG,
                            width: 70,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                    Text('Complete profile',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20),
                    ),const SizedBox(
                          height: 8,
                        ),
                        Text( userInfoController.userinfo.data?.first.firstName ?? " Baal" , style: TextStyle(color: Colors.black),),
                        Text( userInfoController.userinfo.data?.first.lastName ?? " Baal" , style: TextStyle(color: Colors.black),),
                        Text( userInfoController.userinfo.data?.first.email ?? " Baal" , style: TextStyle(color: Colors.black),),
                        Text( userInfoController.userinfo.data?.first.mobile ?? " Baal" , style: TextStyle(color: Colors.black),),



                        const SizedBox(
                          height: 8,
                        ),
                        Text('Get Start With us With Your Details',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.grey,fontSize: 14)),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(CompleteProfile());
                                }, child: const Text('Complete'),),),
                          ],
                        );
                  }
                ),
                  ),
                ),
              );
        }

  }
