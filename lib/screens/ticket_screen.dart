import 'package:event/screens/view_tickets_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);
// 70 = 0.08
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.09,),
              Center(
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(AppImages.doneWithCircle),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text("Tickets Purchased Successfully".tr,style: AppFontStyle.titleTextBold,textAlign: TextAlign.center),
              SizedBox(height: height * 0.05),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                    boxShadow:  [
                      BoxShadow(
                          color: Color(0xFFBBC0C0).withOpacity(0.5),
                          blurRadius: 5.0,spreadRadius: 3
                      ),
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.04,bottom: height * 0.04,left: width * 0.07,right: width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Transaction ID".tr,style: AppFontStyle.blackSemiBold16,),
                              SizedBox(height: height * 0.015,),
                              Text("EVNT4783929".tr,style: AppFontStyle.blackBold16,)
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
                      SizedBox(height: height * 0.030,),
                      Text("Tickets".tr,style: AppFontStyle.blackSemiBold16,),
                      SizedBox(height: height * 0.020,),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.textGrey10,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.textGrey18,width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: width * 0.02,),
                              Image.asset(AppImages.silverTicket1,width: 40,height: 40,),
                              SizedBox(width: width * 0.04,),
                              Text("Silver Tickets".tr,style: AppFontStyle.greySemiBold17,),
                              Expanded(child: Container()),
                              Text("01".tr,style: AppFontStyle.greySemiBold17,),
                              SizedBox(width: width * 0.02,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.04,),
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
                          Expanded(child: Text("Ottawa, Canada".tr,style: AppFontStyle.grey19SemiBold14,maxLines: 1,)),
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
              ),
              SizedBox(height: height * 0.05,),

              GestureDetector(
                onTap: (){
                  Get.to(ViewTicketsScreen());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.black3,
                  ),
                  child: Center(child: Text("View Tickets".tr,
                    style: const TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                ),
              ),
              SizedBox(height: height * 0.020,),
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
                  child:  Center(child: Text("Done".tr,
                    style: const TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
