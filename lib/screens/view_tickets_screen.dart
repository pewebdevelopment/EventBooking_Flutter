import 'package:dotted_border/dotted_border.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/detailpageController.dart';

class ViewTicketsScreen extends StatelessWidget {
   ViewTicketsScreen({Key? key}) : super(key: key);
  DetailPageController detailPageController=Get.put(DetailPageController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircularShadow(
              child: SvgPicture.asset(
                detailPageController.isArabic==true? AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
        title: Text(
          'Tickets'.tr,
          style: AppFontStyle.appBarTitle,
        ),
        actions: [
          CircularShadow(
            child: Row(
              children: [
                SvgPicture.asset(
                  AppImages.vectore,
                  height: 4,
                ),
                SizedBox(width: 2,),
                SvgPicture.asset(
                  AppImages.vectore,
                  height: 4,
                ),
                SizedBox(width: 2,),
                SvgPicture.asset(
                  AppImages.vectore,
                  height: 4,
                )
              ],
            ),
          ),
          const SizedBox(width: 15,),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01,bottom: height * 0.04,left: width * 0.04,right: width * 0.04),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                            color: AppColors.textWhite3,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:  [
                              BoxShadow(
                                  color: Color(0xFFB5B2B2).withOpacity(0.4),
                                  blurRadius: 5.0,spreadRadius: 3
                              ),
                            ]
                        ),
                        // decoration: BoxDecoration(
                        //   color: AppColors.textWhite3,
                        //   borderRadius: BorderRadius.circular(20),
                        //     boxShadow: const [
                        //       BoxShadow(
                        //         color: AppColors.textWhite3,
                        //         blurRadius: 10.0,
                        //       ),
                        //     ]
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04,bottom: height * 0.04,left: width * 0.07,right: width * 0.07),
                              child: Center(
                                child: QrImage(
                                  data: "1234567890",
                                  version: QrVersions.auto,
                                  size: height * 0.2,
                                  backgroundColor: AppColors.white,
                                  padding: const EdgeInsets.all(24),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.025,),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.07,right: width * 0.07),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Ticket Status".tr,style: AppFontStyle.blackSemiBold16,),
                                      SizedBox(height: height * 0.015,),
                                      Text("Not used".tr,style: AppFontStyle.blackBold16,)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Total Paid".tr,style: AppFontStyle.blackSemiBold16,),
                                      SizedBox(height: height * 0.015,),
                                      Text("\$ 100".tr,style: AppFontStyle.blackBold16,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01,),
                            DottedBorder(
                              customPath: (size) {
                                return Path()
                                  ..moveTo(0, 20)
                                  ..lineTo(size.width, 20);
                              },
                              radius: Radius.circular(0),
                              strokeWidth: 2,
                              dashPattern: [7, 8],
                              color: AppColors.textGrey20,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(),
                              ),
                            ),
                            SizedBox(height: height * 0.04,),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.07,right: width * 0.07),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Event Details".tr,style: AppFontStyle.blackSemiBold16,),
                                        SizedBox(height: height * 0.02,),
                                        Text("Christina Perri Live In Concert ".tr,style: AppFontStyle.blackBold16,maxLines: 1,),
                                        SizedBox(height: height * 0.015,),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppImages.cal,height: 15),
                                            SizedBox(width: 12,),
                                            Text("31 December, Sunday".tr,style: AppFontStyle.grey19SemiBold14,),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.015,),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppImages.location,height: 15),
                                            SizedBox(width: 12,),
                                            Text("Ottawa, Canada".tr,style: AppFontStyle.grey19SemiBold14,maxLines: 1,),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.015,),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppImages.time,height: 15),
                                            SizedBox(width: 12,),
                                            Text("6pm-9pm".tr,style: AppFontStyle.grey19SemiBold14,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(AppImages.silverTicket1,width: 40,height: 40,),
                                      SizedBox(height: height * 0.01,),
                                      Text("Silver".tr,style: AppFontStyle.grey21SemiBold15,),
                                      SizedBox(height: height * 0.005,),
                                      Text("Tickets".tr,style: AppFontStyle.grey21SemiBold15,),
                                      SizedBox(height: height * 0.005,),
                                      Text("1".tr,style: AppFontStyle.grey21SemiBold15,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.04,),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.07,right: width * 0.07),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Terms & Conditions".tr,style: AppFontStyle.blackSemiBold16,),
                                  SizedBox(height: height * 0.015,),
                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accum "
                                      "san etiam diam nunc proin. Sit lorem magna sit nisi, viverra crasvar "
                                      "us. Nec vitae ac sit tristique. Lectus in augue aliquam neque luctus "
                                      "nunc, duis urna tellus. Sit lorem magna sit nisi.".tr,
                                    style: AppFontStyle.black22SemiBold14,
                                    maxLines: 4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.04,),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.382,
                      left: -10,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.382,
                      right: -10,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary,
                    ),
                    child:  Center(child: Text("Back to Home".tr,
                      style: const TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                  ),
                ),
                SizedBox(height: height * 0.05,),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
