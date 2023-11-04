import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:craftybay/application/Controller_binders.dart';
import 'package:craftybay/presentation/ui/Screens/splash_screens.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {

  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStates(result);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream = Connectivity().onConnectivityChanged.listen((status) {
      handleConnectivityStates(status);
    });
  }

  void handleConnectivityStates(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile && status != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No internet!',
        message: 'Please check your internet connectivity',
        isDismissible: false,
      ));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
        debugShowCheckedModeBanner: false,
        home: const Splash_Screens(),
        initialBinding: Controller_binder(),
        theme: ThemeData(
          primaryColor: MaterialColor(0xFF07ADAE, AppColor().color),
          primarySwatch: MaterialColor(0xFF07ADAE, AppColor().color),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          elevatedButtonTheme:  ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                )
            ),

          ),

        ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: MaterialColor(0xFF07ADAE, AppColor().color),
      primarySwatch: MaterialColor(0xFF07ADAE, AppColor().color),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        disabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
      elevatedButtonTheme:  ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            )
        ),

      ),

    ),
    themeMode: ThemeMode.system,);
  }
}


