import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../controllers/liveController/live_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';


class LiveScreen extends StatelessWidget  {
  String liveTotal;
   LiveScreen(this.liveTotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LiveController>(
        init: LiveController(),
    id: "live",
    builder: (controller) {
          return  Stack(
            children: [


              Container(
                height: double.infinity,
                width: double.infinity,
                child:  Image.asset(
                  AppImages.liveBgImage,
                  fit: BoxFit.cover,
                  // height: 33,
                ),
              ),
              Container(
                margin:controller.isArabic==true? EdgeInsets.only(top: 50,left: 15,right: 15):EdgeInsets.only(bottom: 600,left: 15,right: 15),
                //
                // width: 45,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.isArabic==true?GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        AppImages.liveRightArrow,
                        height: 33,
                      ),
                    ):GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        AppImages.liveBackArrowImage,
                        height: 33,
                      ),
                    ),

                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.pink,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Live".tr,
                                  style: AppFontStyle.whiteSemiBold12,
                                ),
                                const SizedBox(width: 5,),
                                SvgPicture.asset(
                                  AppImages.circle,
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        controller.isArabic==true?SizedBox(width: 8,):Container(),
                        Container(
                          margin:controller.isArabic==true?EdgeInsets.zero: EdgeInsets.only(left: 10),
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImages.eye,
                                  height: 10,
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  liveTotal+"K".tr,
                                  style: AppFontStyle.whiteSemiBold10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GetBuilder<LiveController>(
                id: 'liveScreen',
                builder: (controller) =>Container(
                  margin:controller.isArabic==true?EdgeInsets.only(left: 50,right: 0,top: 470): EdgeInsets.only(left: 0,right: 50,top: 470),
                  height: 200,
                  // color: Colors.red,
                  // margin: EdgeInsets.only(),
                  child: TransformableListView.builder(
                    controller: controller.scrollController1,
                    padding: EdgeInsets.zero,
                    getTransformMatrix: controller.getScaleDownMatrix,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          // Get.to(MyHomeDemo());
                        },

                        child: Container(

                          margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                          height: 48,
                          width: 200,
                          // margin: const EdgeInsets.symmetric(
                          //   horizontal: 16,
                          //   vertical: 4,
                          // ),
                          decoration: BoxDecoration(
                            // border: Border.all(color: ),
                            // color: index.isEven ?AppColors.black.withOpacity(0.6):
                            color:  AppColors.black.withOpacity(0.5),
                            // color: controller.colors[index % controller.colors.length],
                            borderRadius: new BorderRadius.circular(9.0),
                          ),
                          // decoration: BoxDecoration(
                          //   color:index.isEven ?Colors.blue:index==controller.secondIndex?Colors.white:Colors.green,
                          //   // color: index.isEven ? Colors.grey : Colors.blueAccent,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          // alignment: Alignment.center,
                          child:  Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  controller.img[index % controller.img.length],
                                  height: 30,

                                ),
                                SizedBox(width: 10,),
                                Text(controller.userList[index].cmt,style: TextStyle(
                                    color: AppColors.white,
                                    // color: AppColors.textGrey7,
                                    fontFamily: AppFontStyle.bold,fontSize:14
                                ),),
                              ],
                            ),
                          ),
                          // child: Text(index.toString()),
                        ),
                      );
                    },
                    itemCount: controller.userList.length,
                    // itemCount: 30,
                  ),
                ),
              ),
              Container(
                margin: controller.isArabic==true?EdgeInsets.only(left: 5,right: 15,bottom: 10):EdgeInsets.only(left: 15,right: 5,bottom: 10),
                alignment: Alignment.bottomCenter,
                child:  ///-------- search text field --------------

                Row(
                  children: [
                    Expanded(
                      // flex:6,
                      child: Form(
                        key: controller.formKey,
                        child: Container(

                          // margin: EdgeInsets.only(
                          //     top: height * 0.01, bottom: height * 0.02),
                            height: 48,
                            width: 200,
                            decoration: BoxDecoration(
                              // border: Border.all(color: ),
                              color: AppColors.black.withOpacity(0.8),
                              borderRadius: new BorderRadius.circular(9.0),
                            ),
                            child: TextFormField(
                                controller: controller.commentController,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    color: AppColors.textGrey7,
                                    fontFamily: AppFontStyle.bold,fontSize:14
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },

                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 15),

                                    border: InputBorder.none,
                                    hintText: 'Type Your Message',
                                    hintStyle: const TextStyle(
                                        color: AppColors.textGrey7,
                                        fontFamily: AppFontStyle.bold,fontSize:14
                                    ),
                                    suffixIcon:  GestureDetector(
                                      onTap: (){
                                        // Get.to(ExampleScreen());
                                        ScrollController();
                                        // controller.formKey.currentState!.save();
                                        if(controller.commentController.text.isNotEmpty){
                                        // if(controller.formKey.currentState!.validate()){
                                          controller.addUserToList(
                                            controller.commentController.text,

                                          );

                                          controller.updateTabIndex(ind:controller.userList.length+1);
                                          controller.refresh();
                                          print('length====${controller.userList.length + 1}');

                                        }
                                        controller.commentController.clear();

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          AppImages.sendIcon,
                                          // fit: BoxFit.fill,
                                          height: 10,
                                        ),
                                      ),
                                    ),

                                  // suffixIconConstraints:
                                ))),
                      ),
                    ),

      GetBuilder<LiveController>(
      id: 'live',
      builder: (controller) {
        return Stack(
          children: [
            // TransformableListView.builder(
            //   controller: controller.scrollController1,
            //   padding: EdgeInsets.zero,
            //   getTransformMatrix: controller.getScaleDownMatrix,
            //   itemBuilder: (context, index) {
            //     return   FadeTransition(
            //       opacity: Tween<double>(begin: 1.0,end: 0.0).animate(CurvedAnimation(
            //
            //           parent: controller.animationController!,
            //           curve: Curves.fastLinearToSlowEaseIn
            //       )
            //       ),
            //       child: SlideTransition(
            //
            //         position: Tween<Offset>(begin: Offset(0.0,0.0),end: Offset(0.0,-1.0)).animate(CurvedAnimation(
            //
            //           curve: Curves.fastLinearToSlowEaseIn,
            //           parent: controller.animationController!,
            //
            //         )
            //         ),
            //         child: Container(
            //           margin: EdgeInsets.only(left: 15,top: 10),
            //           child: Icon(Icons.favorite,color: Colors.red,size: 30,),
            //
            //           // SvgPicture.asset(
            //           //   AppImages.storyLikeIcon,
            //           //   height: 60,
            //           // ),
            //         ),
            //
            //         // Container(
            //         //   width: 100,
            //         //   height: 100,
            //         //   alignment: Alignment.center,
            //         //   child: Icon(Icons.favorite,color: Colors.red,size: 40*controller.ratio,),
            //         // ),
            //       ),
            //     );
            //   },
            //   itemCount: 1,
            //   // itemCount: 30,
            // ),

            FadeTransition(
              opacity: Tween<double>(begin: 1.0,end: 0.0).animate(CurvedAnimation(
                  parent: controller.animationController!,
                  curve: Curves.fastLinearToSlowEaseIn
              )
              ),
              child: SlideTransition(

                position: Tween<Offset>(begin: Offset(0.0,0.0),end: Offset(0.0,-1.0)).animate(CurvedAnimation(

                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: controller.animationController!,

                )
                ),
                child: Container(
                  margin: controller.isArabic==true?EdgeInsets.only(right: 15,top: 10):EdgeInsets.only(left: 15,top: 10),
                  child: Icon(Icons.favorite,color: Colors.red,size: 30,),

                  // SvgPicture.asset(
                  //   AppImages.storyLikeIcon,
                  //   height: 60,
                  // ),
                ),

                // Container(
                //   width: 100,
                //   height: 100,
                //   alignment: Alignment.center,
                //   child: Icon(Icons.favorite,color: Colors.red,size: 40*controller.ratio,),
                // ),
              ),
            ),

            GestureDetector(

              // onTap: (){
              //
              //   // Get.to(LikeButtonScreen());
              //   Get.to(aniScreen());
              // },
              onTapDown: (d){
                // setState(() {
                controller.ratio = 0.9;
                controller. animationController!.reset();
                // });
              },

              onTapUp: (d){
                // setState(() {
                controller. ratio = 1.0;
                // });
                controller.animationController!.forward();
                // controller. animationController!.reset();
              },
              child: Container(
                // margin: EdgeInsets.only(top: 90),
                child: SvgPicture.asset(
                  AppImages.storyLikeIcon,
                  height: 60,
                ),
              ),
            )
            // FadeTransition(
            //   opacity: Tween<double>(begin: 1.0,end: 0.0).animate(CurvedAnimation(
            //
            //       parent: controller.animationController!,
            //       curve: Curves.fastLinearToSlowEaseIn
            //   )
            //   ),
            //   child: SlideTransition(
            //
            //     position: Tween<Offset>(begin: Offset(0.0,0.0),end: Offset(0.0,-1.0)).animate(CurvedAnimation(
            //
            //       curve: Curves.fastLinearToSlowEaseIn,
            //       parent: controller.animationController!,
            //
            //     )
            //     ),
            //     child: Container(
            //       width: 100,
            //       height: 100,
            //       alignment: Alignment.center,
            //       child: Icon(Icons.favorite,color: Colors.red,size: 40*controller.ratio,),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTapDown: (d){
            //     // setState(() {
            //     controller.ratio = 0.9;
            //     // });
            //   },
            //   onTapUp: (d){
            //     // setState(() {
            //     controller. ratio = 1.0;
            //     // });
            //     controller.animationController!.forward();
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(left: 10),
            //     width: 60,
            //     height: 60,
            //     color: Colors.green,
            //     alignment: Alignment.center,
            //     child:  SvgPicture.asset(
            //       AppImages.storyLikeIcon,
            //       height: 60* controller.ratio,
            //     ),
            //     // Icon(Icons.favorite,color: Colors.red,size: 35 * controller.ratio,),
            //   ),
            // )
          ],
        );
      })


                  ],
                ),
              ),

            ],
          );
    }));





  }
}
