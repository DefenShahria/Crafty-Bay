import 'package:craftybay/presentation/State_holders/profile_update_Controller.dart';
import 'package:craftybay/presentation/ui/Screens/HomePage.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'userInfo.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProfileUpdateController profileUpdateController = Get.find<ProfileUpdateController>();
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
                Text(
                  'Compete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20),
                ),
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
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name',),
                  validator:(String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your First Name';
                    }
                    return null;
                    },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name',

                    ),validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter Your Last Name';
                  }
                },

                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    decoration: const InputDecoration(hintText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your Phone Number';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _cityNameTEController,
                    decoration: const InputDecoration(hintText: 'City',

                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your City Name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: _addressTEController,
                    decoration: const InputDecoration(hintText: 'Shipping Address',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,)

                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your Shipping Address';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: GetBuilder<ProfileUpdateController>(
                        builder: (profileUpdatecontroller) {
                          if(profileUpdateController.profileUpdateInProgress){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                              onPressed: () {
                                profileUpdateController.createProfile(
                                    _firstNameTEController.text.trim(),
                                    _lastNameTEController.text.trim(),
                                    _phoneNumberTEController.text.trim(),
                                    _cityNameTEController.text.trim(),
                                    _addressTEController.text
                                ).then((result) {
                                  if(result == true){
                                    Get.offAll(HomePage());
                                  }else{
                                    Get.snackbar('Failed', 'Create profile failed');
                                  }
                                });
                                //Get.offAll(const HomePage());
                              }, child: const Text('Complete'),);
                        }
                      ),),
                ],
              ),
            ),
          ),
        ),
    );
  }



}
