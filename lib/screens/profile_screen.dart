// import 'package:event/controllers/profile_controller/profile_controller.dart';
// import 'package:event/utils/common_imports.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration:const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(AppImages.profileBg),
//                     fit: BoxFit.cover,
//                   )
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(top: height * 0.2),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       )
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(height: height * 0.05,),
//                       Center(child: Text("Liza Scott",style: AppFontStyle.appBarTitle,)),
//                       SizedBox(height: height * 0.01,),
//                       Center(child: Text("Ux/Ui designer",style: AppFontStyle.greyRegular17,)),
//                       SizedBox(height: height * 0.02,),
//                       Center(
//                         child: Container(
//                           height: height * 0.05,
//                           width: width * 0.3,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: AppColors.primary,
//                           ),
//                           child: Center(child: Text("Edit profile".tr,style: AppFontStyle.whiteSemiBold14,)),
//                         ),
//                       ),
//                       SizedBox(height: height * 0.02,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width * 0.25,
//                             child: Card(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
//                                 child: Column(
//                                   children: [
//                                     Text("2",style: AppFontStyle.blackBold12,),
//                                     SizedBox(height: width * 0.01,),
//                                     Text("Posts".tr,style: AppFontStyle.blackBold12,)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: width * 0.01,),
//                           Container(
//                             width: width * 0.25,
//                             child: Card(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
//                                 child: Column(
//                                   children: [
//                                     Text("234",style: AppFontStyle.blackBold12,),
//                                     SizedBox(height: width * 0.01,),
//                                     Text("Followers".tr,style: AppFontStyle.blackBold12,)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: width * 0.01,),
//                           Container(
//                             width: width * 0.25,
//                             child: Card(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
//                                 child: Column(
//                                   children: [
//                                     Text("342",style: AppFontStyle.blackBold12,),
//                                     SizedBox(height: width * 0.01,),
//                                     Text("Following".tr,style: AppFontStyle.blackBold12,)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: height * 0.02,),
//                       Container(
//                         height: height * 0.045,
//                         width: width * 0.7,
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: const TabBar(
//                           indicatorSize: TabBarIndicatorSize.label,
//                           indicatorWeight: 3,
//                           indicatorPadding: EdgeInsets.zero,
//                           tabs: [
//                             Tab(
//                                 icon: Text(
//                                   'Posts',
//                                   style: AppFontStyle.blackSemiBold16,
//                                 )),
//                             Tab(
//                                 icon: Text(
//                                   'Stories',
//                                   style: AppFontStyle.blackSemiBold16,
//                                 )),
//                             Tab(
//                                 icon: Text(
//                                   'Videos',
//                                   style: AppFontStyle.blackSemiBold16,
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: GetBuilder<ProfileController>(
//                             init: ProfileController(),
//                             id: "list",
//                             builder: (controller) {
//                               return TabBarView(
//                                 physics: ScrollPhysics(),
//                                 children: [
//                                   GridView.builder(
//                                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 3,
//                                       crossAxisSpacing: 5,
//                                       mainAxisSpacing: 3,
//                                     ),
//                                     padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
//                                     shrinkWrap: true,
//                                     physics: const ScrollPhysics(),
//                                     itemCount: controller.PostsList.length,
//                                     itemBuilder: (context,index){
//                                       return Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             image: DecorationImage(
//                                                 image: AssetImage(
//                                                     controller.PostsList[index]
//                                                 )
//                                             )
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   Text(''),
//                                   Text(''),
//                                 ],
//                               );
//                             }
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: height * 0.14,
//               left: width * 0.045,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 3),
//                 child: Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: AppColors.white.withOpacity(0.2),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: SvgPicture.asset(AppImages.setting,height: 20,),
//                       ),
//                     ),
//                     SizedBox(width: width * 0.03,),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: AppColors.white.withOpacity(0.2),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: SvgPicture.asset(AppImages.menu,height: 20,),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: height * 0.115,
//               left: width * 0.38,
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: AppColors.white,
//                     ),
//                     child: const Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: AssetImage('${AppImages.comm1}'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: height * 0.14,
//               right: width * 0.045,
//               child: Row(
//                 children: [
//                   Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 3),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: AppColors.white.withOpacity(0.2),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(6.0),
//                             child: SvgPicture.asset(AppImages.Message,height: 20,),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         right: 0,
//                         child: Container(
//                           height: 13,
//                           width: 13,
//                           decoration: BoxDecoration(
//                             color: AppColors.primary,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: Center(child: Text("1",style: AppFontStyle.whiteSemiBold10)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: width * 0.03,),
//                   Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 3),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: AppColors.white.withOpacity(0.2),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(6.0),
//                             child: SvgPicture.asset(AppImages.notification,height: 20,),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         right: 0,
//                         child: Container(
//                           height: 13,
//                           width: 13,
//                           decoration: BoxDecoration(
//                             color: AppColors.primary,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: Center(child: Text("1",style: AppFontStyle.whiteSemiBold10)),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:event/controllers/login_controller.dart';
import 'package:event/controllers/profile_controller/profile_controller.dart';
import 'package:event/screens/edit_profile_screen.dart';
import 'package:event/screens/login_screen.dart';
import 'package:event/screens/message/message_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo/bubblescreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: Scaffold(
          body: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller) {
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        toolbarHeight: height * 0.05,
                        elevation: 0.5,
                        snap: false,
                        pinned: true,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: EdgeInsets.only(
                              top: controller.isShrink
                                  ? height * 0.03
                                  : height * 0.2,
                              left: controller.isShrink
                                  ? width * 0.0
                                  : height * 0.03),
                          centerTitle: controller.isShrink ? true : false,
                          ///---- background detail ----
                          background: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(AppImages.profileBg),
                                  fit: BoxFit.cover,
                                )),
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * 0.2),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                         Center(
                                            child: Text(
                                          "Liza Scott".tr,
                                          style: AppFontStyle.appBarTitle,
                                        )),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                         Center(
                                            child: Text(
                                          "Ux/Ui designer".tr,
                                          style: AppFontStyle.greyRegular17,
                                        )),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Get.to(EditProfileScreen());
                                          },
                                          child: Center(
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppColors.primary,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Edit profile".tr,
                                                style: AppFontStyle.whiteSemiBold14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 0.25,
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Color(0xFFBBC0C0),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.015),
                                                  child: Column(
                                                    children: [
                                                     const Text(
                                                        "2",
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      ),
                                                      SizedBox(
                                                        height: width * 0.01,
                                                      ),
                                                      Text(
                                                        "Posts".tr,
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.25,
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Color(0xFFBBC0C0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02,
                                                      vertical: height * 0.015),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "234",
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      ),
                                                      SizedBox(
                                                        height: width * 0.01,
                                                      ),
                                                      Text(
                                                        "Followers".tr,
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.25,
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Color(0xFFBBC0C0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02,
                                                      vertical: height * 0.015),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "342",
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      ),
                                                      SizedBox(
                                                        height: width * 0.01,
                                                      ),
                                                      Text(
                                                        "Following".tr,
                                                        style: AppFontStyle
                                                            .blackBold12,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.14,
                                left: width * 0.045,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
// Get.to(lanPage());

                                          buildLanguageDialog(context,controller,controller.isDialogVisible);
                                          // dilog(context,controller,controller.isDialogVisible);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppColors.white.withOpacity(0.2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(
                                              AppImages.setting,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          logoutDialog(context,controller);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppColors.white.withOpacity(0.2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(
                                              AppImages.menu,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.115,
                                left: width * 0.38,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.white,
                                      ),
                                      child: const Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              AssetImage('${AppImages.comm1}'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: height * 0.14,
                                right: width * 0.045,
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Get.to(MessageScreen());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 3),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: AppColors.white
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: SvgPicture.asset(
                                                  AppImages.Message,
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 13,
                                            width: 13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Center(
                                                child: Text("1",
                                                    style: AppFontStyle
                                                        .whiteSemiBold10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.white
                                                  .withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset(
                                                AppImages.notification,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 13,
                                            width: 13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Center(
                                                child: Text("1",
                                                    style: AppFontStyle
                                                        .whiteSemiBold10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ), //Text
                        ),

                        ///---FlexibleSpaceBar--- icon ----
                        // expandedHeight: height * 0.42,
                        expandedHeight: controller.isArabic==true?height * 0.53:height * 0.52,
                        // expandedHeight:controller.isArabic==true?0.55: height * 0.52,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(10.0),
                          child: Container(
                            height: height * 0.045,
                            width: width * 0.75,
                            color: AppColors.white,
                            padding:
                            const EdgeInsets.only(bottom: 10),
                            child:  TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 3,
                              indicatorPadding: EdgeInsets.zero,
                              tabs: [
                                Tab(
                                    icon: Text(
                                      'Posts'.tr,
                                      style:
                                      AppFontStyle.blackSemiBold16,
                                    )),
                                Tab(
                                    icon: Text(
                                      'Stories'.tr,
                                      style:
                                      AppFontStyle.blackSemiBold16,
                                    )),
                                Tab(
                                    icon: Text(
                                      'Videos'.tr,
                                      style:
                                      AppFontStyle.blackSemiBold16,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: GetBuilder<ProfileController>(
                      init: ProfileController(),
                      id: "list",
                      builder: (controller) {
                        return TabBarView(
                          physics: ScrollPhysics(),
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 3,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: controller.PostsList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              controller.PostsList[index]))),
                                );
                              },
                            ),
                            Text(''),
                            Text(''),
                          ],
                        );
                      }),
                );
              }),
        ),
      ),
    );


  }



  buildLanguageDialog(BuildContext context,ProfileController controller,bool isDialogVisible){


    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      title: "selectlaunguage".tr,


titleStyle: TextStyle(fontSize: 20, color: AppColors.primary, fontFamily: AppFontStyle.semiBold,overflow: TextOverflow.ellipsis),
// titleStyle: AppFontStyle.blackSemiBold16,
      contentPadding: EdgeInsets.zero,
        // title: "GeeksforGeeks",
        // middleText: "Hello world!",
        // backgroundColor: Colors.green,
        // titleStyle: TextStyle(color: Colors.white),
        // middleTextStyle: TextStyle(color: Colors.white),
        // textConfirm: "Confirm",
        // textCancel: "Cancel",
        // cancelTextColor: Colors.white,
        // confirmTextColor: Colors.white,
        // buttonColor: Colors.red,
        // barrierDismissible: false,
        radius: 50,
        content:GetBuilder<ProfileController>(
        init: ProfileController(),
    id: "list",
    builder: (controller) {return  GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.all(20),
            // width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: AppColors.pink,
              color: AppColors.white,
            ),
            //height: 200,
            // padding:
            // EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
              height: 100,
              // color: Colors.red,
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

                                  print('val---====${val}');
                                }),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          GestureDetector(
            onTap: ()async{
              SharedPreferences pref = await SharedPreferences.getInstance();
              controller.selectedIndex == 0 ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ar', 'AE'));
              controller.selectedIndex == 0 ? pref.setBool("isArabic", false) : pref.setBool("isArabic", true);
              pref.setBool("is_first", false);
              Timer(Duration(seconds: 2), () {
                Get.offAll(BottomNavigationScreen());
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
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
    );}),




    );

  }
  logoutDialog(BuildContext context,ProfileController controller,){
    LoginController loginController=Get.put(LoginController());


    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      title: "Log Out".tr,


titleStyle: TextStyle(fontSize: 20, color: AppColors.primary, fontFamily: AppFontStyle.semiBold,overflow: TextOverflow.ellipsis),
      contentPadding: EdgeInsets.zero,
        // title: "GeeksforGeeks",
        // middleText: "Hello world!",
        // backgroundColor: Colors.green,
        // titleStyle: TextStyle(color: Colors.white),
        // middleTextStyle: TextStyle(color: Colors.white),
        // textConfirm: "Confirm",
        // textCancel: "Cancel",
        // cancelTextColor: Colors.white,
        // confirmTextColor: Colors.white,
        // buttonColor: Colors.red,
        // barrierDismissible: false,
        radius: 20,
        content:GetBuilder<ProfileController>(
        init: ProfileController(),
    id: "list",
    builder: (controller) {return  GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
              width: 240,
              // color: Colors.pink,

              child: Text('Are You sure you want to logout?'.tr,maxLines:2,style: TextStyle(fontSize: 18, color: AppColors.textGrey28, fontFamily: AppFontStyle.regular,))),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()async{
                      loginController.nameController.clear();
                      loginController.passwordController.clear();
                      loginController.isChcek(false);

                      Get.to(LoginScreen());
                    },
                    child: Container(
                      // margin: EdgeInsets.only(top: 10, bottom: 0, left: 30, right: 30),
                      height: 35,
                      // width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary,
                      ),
                      child:  Center(child: Text("Yes".tr,
                        style: const TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()async{
                      Get.back();
                    },
                    child: Container(
                      // margin: EdgeInsets.only(top: 8, bottom: 0, left: 30, right: 30),
                      height: 35,
                      // width: 300,
                      decoration: BoxDecoration(
                        border: Border.all( color: AppColors.primary, ),
                        borderRadius: BorderRadius.circular(8),
                        // color: AppColors.primary,
                      ),
                      child:  Center(child: Text("No".tr,
                        style: const TextStyle(fontSize: 15, color: AppColors.primary, fontFamily: AppFontStyle.bold),),),
                    ),
                  ),
                ),
              ],
            ),
          )



        ],
      ),
    );}),




    );

  }

}
