import 'dart:async';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_images.dart';
import '../../utils/common_imports.dart';

class ProfileController extends GetxController {

  List PostsList = [
    AppImages.posts1,
    AppImages.posts2,
    AppImages.posts3,
    AppImages.posts4,
    AppImages.posts5,
    AppImages.posts6,
    AppImages.posts7,
    AppImages.posts8,
    AppImages.posts9,
    AppImages.posts1,
    AppImages.posts2,
    AppImages.posts3,
    AppImages.posts4,
    AppImages.posts5,
    AppImages.posts6,
    AppImages.posts7,
    AppImages.posts8,
    AppImages.posts9,
    AppImages.posts1,
    AppImages.posts2,
    AppImages.posts3,
    AppImages.posts4,
    AppImages.posts5,
    AppImages.posts6,
    AppImages.posts7,
    AppImages.posts8,
    AppImages.posts9,
  ];

  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update();
  }


  ScrollController scrollController = ScrollController();

  bool get isShrink {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }



  @override
  void onInit() {
    checkLaung();
    lan();
    update(['list']);

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
      update(['list']);
    }
    else{
      Timer(Duration(seconds: 2), () {
        Get.to(BottomNavigationScreen());
        // Navigator.pushNamed(context, '/home');
      });
    }
  }

  void changeLanguage(int val) {
    selectedIndex = val;
    update(['list']);
  }

}