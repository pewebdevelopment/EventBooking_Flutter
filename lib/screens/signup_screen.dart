import 'package:event/controllers/login_controller.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/category_controller.dart';
import '../controllers/signup_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_font_style.dart';
import '../utils/app_images.dart';
import 'login_screen.dart';
import 'onboarding2_screen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  SignUpController signUpController=Get.put(SignUpController());
   CategoryController categoryController=Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircularShadow(
              child: SvgPicture.asset(
                signUpController.isArabic==true?AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<SignUpController>(
          init: SignUpController(),
          id:'signup',
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 10,right: 15,left: 15),
                child: Form(
                  key: controller.signupKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppImages.eventLogo,width: 65,),
                      SizedBox(height: 25,),
                      Container(
                        width: 200,
                        // color: Colors.red,
                        child: Text(
                          "Let’s \nGet Started!".tr ,
                          style:  TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontFamily: AppFontStyle.bold
                            // letterSpacing: 0.15,
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      ///--- enter username -----
                      TextFormField(

                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name'.tr;
                          }
                          return null;
                        },
                        controller: controller.nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets
                              .symmetric(
                              vertical: 13.0, horizontal: 10),
                          filled: true,
                          enabledBorder:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          focusedBorder: InputBorder.none,
                          fillColor: AppColors.textGrey10,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),

                          border:InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder:InputBorder.none,

                          hintText: 'User name'.tr,
                          hintStyle: const TextStyle(
                              color: AppColors.textGrey26,
                              fontFamily: AppFontStyle.semiBold,fontSize:14
                          ),

                        ),
                      ),
                      SizedBox(height: 15,),
                      ///--- enter email/phonenumber -----
                      TextFormField(

                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email or phonenumber'.tr;
                          }
                          return null;
                        },
                        controller: controller.emailPhoneController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets
                              .symmetric(
                              vertical: 13.0, horizontal: 10),
                          filled: true,
                          enabledBorder:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          focusedBorder: InputBorder.none,
                          fillColor: AppColors.textGrey10,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),

                          border:InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder:InputBorder.none,

                          hintText: 'Email/Mobile no'.tr,
                          hintStyle: const TextStyle(
                              color: AppColors.textGrey26,
                              fontFamily: AppFontStyle.semiBold,fontSize:14
                          ),

                        ),
                      ),
                      SizedBox(height: 15,),
                      ///---- password ---
                      TextFormField(
                        // obscureText: controller.passWord,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password'.tr;
                          }
                          return null;
                        },
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets
                              .symmetric(
                              vertical: 13.0, horizontal: 10),
                          filled: true,
                          enabledBorder:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          focusedBorder: InputBorder.none,
                          fillColor: AppColors.textGrey10,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          border: InputBorder.none,
                          hintText: 'Password'.tr,
                          hintStyle: const TextStyle(
                              color: AppColors.textGrey26,
                              fontFamily: AppFontStyle.semiBold,fontSize:14
                          ),
                          // suffixIcon: GestureDetector(
                          //   onTap: () {
                          //     controller.passwordEyeClick();
                          //   },
                          //   child:
                          //   Icon(controller.passWord ? Icons.visibility : Icons.visibility_off,color: AppColors.textGrey26,size: 20,),
                          // ),


                        ),
                      ),
                      SizedBox(height: 15,),
                      ///---- confirm password ---
                      TextFormField(
                        // obscureText: controller.passWord,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your  confirm password'.tr;
                          }
                          return null;
                        },
                        controller: controller.confirmPasswordController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets
                              .symmetric(
                              vertical: 13.0, horizontal: 10),
                          filled: true,
                          enabledBorder:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          focusedBorder: InputBorder.none,
                          fillColor: AppColors.textGrey10,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide:  const BorderSide(
                                color: Colors.transparent,
                                // color: lightGrey.withOpacity(0.1),
                              )

                          ),
                          border: InputBorder.none,
                          hintText: 'Confirm Password'.tr,
                          hintStyle: const TextStyle(
                              color: AppColors.textGrey26,
                              fontFamily: AppFontStyle.semiBold,fontSize:14
                          ),
                          // suffixIcon: GestureDetector(
                          //   onTap: () {
                          //     controller.passwordEyeClick();
                          //   },
                          //   child:
                          //   Icon(controller.passWord ? Icons.visibility : Icons.visibility_off,color: AppColors.textGrey26,size: 20,),
                          // ),


                        ),
                      ),

                      SizedBox(height: 80,),
                      GestureDetector(
                        onTap: () async {


                          categoryController.isRecommended.clear();
                          controller.signUpMethod();
                        },
                        child: Container(


                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary,
                          ),
                          child:  Center(child: Text("Sign up".tr,
                            style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          controller.confirmPasswordController.clear();
                          controller.nameController.clear();
                          controller.passwordController.clear();
                          controller.emailPhoneController.clear();
                          controller.isChecked=false;
                          Get.to(LoginScreen());
                        },
                        child: Container(


                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all( color: AppColors.primary,),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child:  Center(child: Text("Log In".tr,
                            style: TextStyle(fontSize: 15, color: AppColors.primary, fontFamily: AppFontStyle.bold),),),
                        ),
                      ),
                      SizedBox(height: 15,),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
