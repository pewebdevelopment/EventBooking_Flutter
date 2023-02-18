import 'package:event/controllers/detailpageController.dart';
import 'package:event/controllers/profile_controller/profile_controller.dart';
import 'package:event/controllers/tickets_type_controller.dart';
import 'package:event/screens/payment_method_screen.dart';
import 'package:event/utils/common_imports.dart';



class TicketsTypeScreen extends StatelessWidget {
  TicketsTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<TicketsTypeController>(
        init: TicketsTypeController(),
    id:     'ticType',

    builder: (controller) {

          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.ticketsBg),
                      fit: BoxFit.cover,
                    )
                ),
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.4),

                  decoration: const BoxDecoration(
                      // color: AppColors.red,
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                  ),
                  child: Container(

                    margin: EdgeInsets.only(top: height * 0.05,left: width * 0.04,right: width * 0.04),
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ticket type".tr,style: TextStyle(fontSize: 19, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),

                        SizedBox(height: 10,),
                        ///----- ticktes type button ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///--- silver ----
                            GestureDetector(
                              onTap: (){

controller.silver(); controller.price=int.parse('100');

                              },
                              child: Center(
                                child: Container(
                                  height: height * 0.11,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: controller.selectedSilver==false?AppColors.textGrey18:AppColors.primary,
                                  ),
                                  child: Center(child: Column(
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children:  [
                                      Text("Silver".tr,
                                        style: TextStyle(fontSize: 15, color:controller.selectedSilver==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                      Text("\$ 100".tr,
                                        style: TextStyle(fontSize: 15, color: controller.selectedSilver==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                    ],
                                  ),),
                                ),
                              ),
                            ),
                            ///------ gold ----

                            GestureDetector(
                              onTap: (){
                                controller.gold();
                                controller.price=int.parse('250');
                              },
                              child: Container(
                                margin: EdgeInsets.only(left:controller.isArabic==true?0: 10,right: controller.isArabic==true?10:0),
                                height: height * 0.11,
                                width: width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: controller.selectedGold==false?AppColors.textGrey18:AppColors.primary,
                                ),
                                child:  Center(child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.center,
                                  children:  [
                                    Text("Gold".tr,
                                      style: TextStyle(fontSize: 15, color: controller.selectedGold==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                    Text("\$ 250".tr,
                                      style: TextStyle(fontSize: 15, color:controller.selectedGold==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                  ],
                                ),),
                              ),
                            ),
                            ///----- platinum  ----
                            GestureDetector(
                              onTap: (){
                                controller.platinum();
                                controller.price=int.parse('300');

                              },
                              child: Container(
                                margin: EdgeInsets.only(left:controller.isArabic==true?0: 10,right: controller.isArabic==true?10:0),
                                height: height * 0.11,
                                width: width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: controller.selectedPlatinum==false?AppColors.textGrey18:AppColors.primary,
                                ),
                                child: Center(child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.center,
                                  children:  [
                                    Text("Platinum".tr,
                                      style: TextStyle(fontSize: 15, color: controller.selectedPlatinum==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                    Text("\$ 300".tr,
                                      style: TextStyle(fontSize: 15, color:controller.selectedPlatinum==false?AppColors.textGrey15: AppColors.white, fontFamily: AppFontStyle.semiBold),),
                                  ],
                                ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Quantity".tr,style: TextStyle(fontSize: 18, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),

                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///--- minus ----
                            GestureDetector(
                              onTap: (){

                                controller.decrement();

                              },
                              child: Container(
                                  height: height * 0.04,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(

                                    color: AppColors.textGrey18,
                                  ),
                                  // alignment: Alignment.center,
                                  child: Row(
                                    children: [

                                      Container(

                                          margin: EdgeInsets.only(left:controller.isArabic==true?0: 8,right: controller.isArabic==true?8:0),
                                          child: Center(child: Icon(Icons.remove,color: AppColors.textGrey16,size: 20,))),
                                      Container(
                                        margin: EdgeInsets.only(left:controller.isArabic==true?0: 6,right: controller.isArabic==true?6:0),
                                        color: AppColors.textGrey16,
                                        height: 18,
                                        width: 1,
                                      ),
                                    ],
                                  ) ),
                            ),

                            ///------ count text ----

                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.1,

                                decoration: const BoxDecoration(
                                  // color: Colors.red,
                                  color: AppColors.textGrey18,
                                ),
                                child:   Center(child: Text(controller.index.toString(),
                                 style: TextStyle(fontSize: 15, color:AppColors.primary, fontFamily: AppFontStyle.bold),),),
                              ),
                            ),
                            ///----- add  ----
                            GestureDetector(
                              onTap: (){

controller.increment();

                              },
                              child: Container(
                                  height: height * 0.04,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(

                                    color: AppColors.textGrey18,
                                  ),
                                  // alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Container(

                                        color: AppColors.textGrey16,
                                        height: 18,
                                        width: 1,
                                      ),
                                      Container(

                                          margin: EdgeInsets.only(left:controller.isArabic==true?0: 8,right: controller.isArabic==true?8:0),
                                          child: Center(child: Icon(Icons.add,color: AppColors.textGrey16,size: 20,))),
                                    ],
                                  ) ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Total Price".tr,style: TextStyle(fontSize: 18, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),

                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.04,right: width * 0.04),
                          color: AppColors.textGrey17,
                          height: 1,
                          width: width * 0.76,
                        ),
                        SizedBox(height: 20,),
                        Text('\$ ${(controller.index * controller.price.toInt()) }',style: TextStyle(fontSize: 18, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                        SizedBox(height: controller.isArabic==true?10:20,),

                        GestureDetector(
                          onTap: (){
                            Get.to(PaymentMethodScreen());

// Get.back();
                          },
                          child: Container(

                            height: height * 0.06,
                            width: width * 0.85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primary,
                            ),
                            child:  Center(child: Text("Proceed to pay".tr,
                              style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
                          ),
                        ),
                        controller.isArabic==true? SizedBox(height: 5,):Container(),
                      ],
                    ),
                  ),
                ),
              ),
              ///---- i icon -----
              controller.isArabic==true? Positioned(
                top: height * 0.32,

                left: width * 0.01,
                child: Container(
                  margin: EdgeInsets.only(top: 1.0,right: 1.0,bottom: 1.0,left: 1.0),

                  // padding: const EdgeInsets.all(1.0),
                  // child: Image.asset(AppImages.shareIcon2,height: 15)
                  child:SvgPicture.asset(AppImages.iIcon2,height: 55,),
                ),
              ): Positioned(
                top: height * 0.32,
                right: width * 0.01,

                child: Container(
                  margin: EdgeInsets.only(top: 1.0,right: 1.0,bottom: 1.0,left: 1.0),

                  // padding: const EdgeInsets.all(1.0),
                  // child: Image.asset(AppImages.shareIcon2,height: 15)
                  child:SvgPicture.asset(AppImages.iIcon2,height: 55,),
                ),
              ),


            ],
          );
    }),




    );
  }
}
