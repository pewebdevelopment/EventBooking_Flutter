import 'dart:async';

import 'package:event/controllers/splash_controller/splash_screen_controller.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding2_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
          init: SplashScreenController(),
          builder: (controller) {
          return Container(
            child: selectLangugaeDialog(controller.isDialogVisible,controller),
          );
        }
      ),
    );
  }

  selectLangugaeDialog(bool isDialogVisible, SplashScreenController controller) {
    return Visibility(
      visible: isDialogVisible,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.black54,
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
              ),
              //height: 200,
              padding:
              EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("selectlaunguage".tr,style: AppFontStyle.blackSemiBold16,),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.languageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.languageList[index].laung,style: AppFontStyle.blackSemiBold16,),

                                SizedBox(
                                  height: 20,
                                  child: Checkbox(
                                      activeColor: AppColors.primary,
                                      value: controller.selectedIndex == index
                                          ? true
                                          : false,
                                      onChanged: (val) {
                                        controller.changeLanguage(index);
                                      }),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      controller.selectedIndex == 0 ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ar', 'AE'));
                      controller.selectedIndex == 0 ? pref.setBool("isArabic", false) : pref.setBool("isArabic", true);
                      pref.setBool("is_first", false);
                      Timer(Duration(seconds: 2), () {
                          Get.offAll(OnBoardingScreens());
                          // Get.offAll(BottomNavigationScreen());
                        });
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary,
                      ),
                      child:  Center(child: Text("Submit".tr,
                        style: const TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
