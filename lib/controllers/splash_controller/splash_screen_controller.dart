import 'dart:async';

import 'package:event/utils/common_imports.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/bottom_navigation_screen.dart';
import '../../screens/onboarding2_screen.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    checkLaung();

  }

  bool isDialogVisible = false;
  int selectedIndex = 0;

  List<LanguageModel> languageList = [
    LanguageModel(laung: 'English', id: 0),
    LanguageModel(laung: 'Arabic', id: 1),
  ];

  void checkLaung() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("is_first") == null) {
      isDialogVisible = true;
      update();
    }
    else{
      Timer(Duration(seconds: 2), () {
        Get.to(OnBoardingScreens());
        // Get.to(BottomNavigationScreen());
        // Navigator.pushNamed(context, '/home');
      });
    }
  }


  void changeLanguage(int val) {
    selectedIndex = val;
    update();
  }
}