import 'package:event/screens/login_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/onboarding_model.dart';
import '../screens/onboarding2_screen.dart';

class OnBoardingController  extends GetxController{

  int currentIndex = 0;
  late PageController controller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = PageController(initialPage: 0);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 getStartMethod() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('screen', true);
   // bool seen = (prefs.getBool('screen') ?? false);

   // if(seen){

     Get.to(LoginScreen());
   //   update(['onboarding']);
   // }else{
   //   Get.back();
   //   update(['onboarding']);
   // }
   // update(['onboarding']);
 }


 pageChange(int ind){
   currentIndex = ind;
   update(['onboarding']);
 }

  List<OnbordingContent> contents = [
    OnbordingContent(
      title: "Discover Events".tr,
      description: "Explore all type of events and easy event booking".tr,
      image:  AppImages.board1,
    ),
    OnbordingContent(
      title: "Share your Event".tr,
      description: "Share you event experience via post and stories".tr,
      image:  AppImages.board2,
    ),
    OnbordingContent(
      title: "Make a Network".tr,
      description: "Expand your network & stay connect with your event mates".tr,
      image:  AppImages.board3,
    ),
    OnbordingContent(
      title: "Create Event".tr,
      description: "Easily make the event and published your events".tr,
      image:  AppImages.board4,
    ),
  ];

}