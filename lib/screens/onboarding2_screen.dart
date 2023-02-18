import 'package:event/controllers/onboarding_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../utils/app_colors.dart';
import '../utils/app_font_style.dart';


class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GetBuilder<OnBoardingController>(
            init: OnBoardingController(),
            id:'onboarding',
            builder: (controller) {
              return   SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                    color: Colors.grey,

                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                        color: Colors.white

                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            // margin: EdgeInsets.only(bottom: 20),
                            height: height * 0.9,
                            // color: Colors.green,
                            child: PageView.builder(



                              controller: controller.controller,
                              itemCount: controller.contents.length,
                              onPageChanged: (int index) {
                                controller.pageChange(index);

                              },
                              itemBuilder: (context, i) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 90,),
                                        child: Image.asset(
                                          controller.contents[i].image,
                                          height: height * 0.55,
                                          // height: height * 0.5,
                                          width: width ,
                                          fit: BoxFit.contain,
                                        ),
                                      ),

                                      SizedBox(height: 30),
                                      Text(
                                        controller.contents[i].title,
                                        style:  TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: AppFontStyle.bold
                                          // letterSpacing: 0.15,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Container(
                                        width:width *0.6,
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Text(
                                          controller.contents[i].description,

                                          textAlign: TextAlign.center,

                                          style:  TextStyle(
                                              fontSize: 13,
                                              color: AppColors.textGrey25,
                                              fontFamily: AppFontStyle.semiBold
                                          ),
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        // padding: const EdgeInsets.fromLTRB(0.0, 26, 0.0, 42.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                            controller.contents.length,
                                                (index) => Container(child: Icon(Icons.circle,size:controller.currentIndex==index? 16:10,
                                                  color: controller.currentIndex==index?AppColors.primary:AppColors.textGrey24,)),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          GestureDetector(
                            onTap: () async {
                              controller.getStartMethod();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              height: height * 0.06,
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primary,
                              ),
                              child:  Center(child: Text("Get started".tr,
                                style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              );
            })


    );
  }


}





