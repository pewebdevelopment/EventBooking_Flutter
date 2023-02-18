import 'package:event/controllers/category_controller.dart';
import 'package:event/controllers/login_controller.dart';
import 'package:event/screens/signup_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../utils/app_colors.dart';
import '../utils/app_font_style.dart';
import '../utils/app_images.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   LoginController loginController=Get.put(LoginController());
   CategoryController categoryController=Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: CircularShadow(
                child: SvgPicture.asset(
                  loginController.isArabic==true?AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                  height: 16,
                ),
              ),
            ),
          ),
        ),
        body: GetBuilder<LoginController>(
          init: LoginController(),
      id:'login',
      builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 10,right: 15),
                child: Form(
                  key:controller. loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppImages.eventLogo,width: 65,),
                            SizedBox(height: 25,),
                            Container(
                              width: 150,
                              child: Text(
                               "Welcome back!".tr ,
                                style:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontFamily: AppFontStyle.bold
                                  // letterSpacing: 0.15,
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            ///--- enter email/phonenumber -----
                            TextFormField(

                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "");
                                if(emailValid == true)
                                {
                                  return null;
                                }
                                else
                                {
                                  return 'Please enter your name or email'.tr;
                                }

                                // if (value!.isEmpty) {
                                //   return 'Please enter your name or email'.tr;
                                // }
                                // return null;
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

                                hintText: 'Email/Mobile no'.tr,
                                hintStyle: const TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),

                              ),
                            ),
                            SizedBox(height: 25,),
                            ///---- password ---
                            TextFormField(
                              obscureText: controller.passWord,
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
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                   controller.passwordEyeClick();
                                  },
                                  child:
                                   Icon(controller.passWord ? Icons.visibility : Icons.visibility_off,color: AppColors.textGrey26,size: 20,),
                                ),


                              ),
                            ),



                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                         Row(
                           children: [
                             Transform.scale(
                               scale: 0.9,
                               child: Checkbox(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),

                                   value: controller.isChecked,
                                   activeColor: AppColors.primary,
                                   onChanged: (v) {
                                     controller.isChcek(v!);
                                   }),
                             ),
                             Text(
                               "Remember me".tr ,
                               style:  TextStyle(
                                   color: AppColors.textGrey27,
                                   fontSize: 12,
                                   fontFamily: AppFontStyle.semiBold
                                 // letterSpacing: 0.15,
                               ),
                             ),
                           ],
                         ),
                          Container(
                            margin: controller.isArabic==true?EdgeInsets.only(left: 15,top: 17):EdgeInsets.only(left: 0,top: 17),
                            child: Text(
                              "Forgot Password?".tr ,
                              style:  TextStyle(
                                  color: AppColors.textGrey27,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.semiBold
                                // letterSpacing: 0.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 150,),
                      GestureDetector(
                        onTap: (){
                          categoryController.isRecommended.clear();
controller.loginMethod();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15,right: 15),

                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary,
                          ),
                          child:  Center(child: Text("Log In".tr,
                            style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          controller.passwordController.clear();
                          controller.nameController.clear();

                          Get.to(SignUpScreen());

                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15,right: 15),

                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all( color: AppColors.primary,),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child:  Center(child: Text("Sign up".tr,
                            style: TextStyle(fontSize: 15, color: AppColors.primary, fontFamily: AppFontStyle.bold),),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
      }),
      ),
    );
  }
}
