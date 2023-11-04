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
  final TextEditingController _cus_namTEController = TextEditingController();
  final TextEditingController _cus_addTEController = TextEditingController();
  final TextEditingController _cus_cityTEController = TextEditingController();
  final TextEditingController _cus_stateTEController = TextEditingController();
  final TextEditingController _cus_postcodeTEController = TextEditingController();
  final TextEditingController _cus_countryTEController = TextEditingController();
  final TextEditingController _cus_phoneTEController = TextEditingController();
  final TextEditingController _cus_faxTEController = TextEditingController();
  final TextEditingController _ship_nameTEController = TextEditingController();
  final TextEditingController _ship_addTEController = TextEditingController();
  final TextEditingController _ship_cityTEController = TextEditingController();
  final TextEditingController _ship_stateTEController = TextEditingController();
  final TextEditingController _ship_postcodeTEController = TextEditingController();
  final TextEditingController _ship_countryTEController = TextEditingController();
  final TextEditingController _ship_phoneTEController = TextEditingController();
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
                  controller: _cus_namTEController,
                  decoration: const InputDecoration(hintText: 'Name',),
                  validator:(String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Name';
                    }
                    return null;
                    },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cus_addTEController,
                  decoration: const InputDecoration(hintText: 'Address',

                    ),validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter Your Address';
                  }
                },

                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _cus_cityTEController,
                    decoration: const InputDecoration(hintText: 'City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your Phone City';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _cus_stateTEController,
                    decoration: const InputDecoration(hintText: 'State',

                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your State Name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(

                    controller: _cus_postcodeTEController,
                    decoration: const InputDecoration(hintText: 'Post Code',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,)

                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter Your Post Code';
                      }
                    },
                  ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _cus_countryTEController,
                  decoration: const InputDecoration(hintText: 'Country',),
                  validator:(String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Country Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cus_phoneTEController,
                  decoration: const InputDecoration(hintText: 'Phone Number',

                  ),validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter Your Phone Number';
                  }
                },

                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cus_faxTEController,
                  decoration: const InputDecoration(hintText: 'Fax Number',
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Phone Fax Number';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _ship_nameTEController,
                  decoration: const InputDecoration(hintText: 'Ship name',

                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Ship Name';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: _ship_addTEController,
                  decoration: const InputDecoration(hintText: 'Ship Address',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,)

                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Ship Address';
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _ship_cityTEController,
                  decoration: const InputDecoration(hintText: 'Ship City',),
                  validator:(String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Ship City';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _ship_stateTEController,
                  decoration: const InputDecoration(hintText: 'State Name ',

                  ),validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter Your State Name ';
                  }
                },

                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _ship_postcodeTEController,
                  decoration: const InputDecoration(hintText: 'Ship Post-Code ',
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Ship Post-Code';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _ship_countryTEController,
                  decoration: const InputDecoration(hintText: 'Country Name ',

                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Country Name';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _ship_phoneTEController,
                  decoration: const InputDecoration(hintText: 'Ship Phone',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,)

                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Ship Phone Number';
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
                                 _cus_namTEController.text,
                                 _cus_addTEController.text,
                                 _cus_cityTEController.text,
                                _cus_stateTEController.text,
                                 _cus_postcodeTEController.text,
                                 _cus_countryTEController.text,
                                 _cus_phoneTEController.text,
                                 _cus_faxTEController.text,
                                _ship_nameTEController.text,
                                 _ship_addTEController.text,
                                 _ship_cityTEController.text,
                                 _ship_stateTEController.text,
                                _ship_postcodeTEController.text,
                                 _ship_countryTEController.text,
                                 _ship_phoneTEController.text,
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
