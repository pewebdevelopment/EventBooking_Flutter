import 'package:event/screens/ticket_screen.dart';
import 'package:event/utils/common_imports.dart';

import '../controllers/add_card_controller.dart';
import '../controllers/paymentmethod_controller.dart';
import 'add_card_screen.dart';

class PaymentMethodScreen extends StatelessWidget {



  AddCardController addCardController =Get.put(AddCardController());

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
                addCardController.isArabic==true?AppImages.rightArrow: '${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<PaymentController>(
    init: PaymentController(),
    id:'paymentscreen',
    builder: (controller) {

      return  SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Saved cards'.tr,style: AppFontStyle.blackBold18,),
                    GestureDetector(
                      onTap: (){
                         addCardController.cardNumber = '';
                         addCardController.expiryDate = '';
                         addCardController.cardHolderName = '';
                         addCardController.cvvCode = '';
                        Get.to(AddCardScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              '${AppImages.addIcon}',
                              height: 22,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('Add Card'.tr,style: AppFontStyle.primarySemiBold16,)
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 15,top: 15),
                height: 200,
                width: double.infinity,
                // color: Colors.green,
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // itemCount: 2,
                        itemCount: controller.userCardList.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 290,
                          decoration: BoxDecoration(
                            // color: controller.colors[index % controller.colors.length],
                            // .colors[index % controller.colors.length],

                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,

                              colors: <Color>[
                                Color(0xff3A5BF6),
                                Color(0xff7A55D4),
                              ],
                              stops: const <double>[
                                0.35,
                                0.8,
                              ],
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),

                          child:Container(
                            margin: EdgeInsets.only(top: 15,left: 15,right: 15),
                            child:   Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.masterCard,width: 33,),
                                SizedBox(height: 20,),
                                Container(

                                  //   Text("**** **** **** "
                                  //       //   paymentController.number==null?'1234567891234567':
                                  //       // paymentController.number.substring(0,paymentController.number.length - 4).replaceRange(0, 14, "**** **** ****")
                                  //       +
                                  //       paymentController.number.substring(paymentController.number.length -4 ),style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.bold,fontSize:29 ),),
                                  //
                                  // ),
                                  child: Text("**** **** **** ${controller.userCardList[index].cardNumber.substring(controller.userCardList[index].cardNumber.length -4 )}",
                                    style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.bold,fontSize:29 ),),
                                  // child: Text("**** **** **** "
                                  //     //   paymentController.number==null?'1234567891234567':
                                  //     // paymentController.number.substring(0,paymentController.number.length - 4).replaceRange(0, 14, "**** **** ****")
                                  //     +
                                  //     controller.number.substring(controller.number.length -4 ),style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.bold,fontSize:29 ),),

                                ),
                                SizedBox(height: 25,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('EXPIRY DATE'.tr,style: TextStyle(color: AppColors.lightPrimary,fontFamily: AppFontStyle.semiBold,fontSize:11 ),),
                                          SizedBox(height: 5,),
                                          Text(controller.userCardList[index].expiredDate==null?'':controller.userCardList[index].expiredDate.toString(),style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.semiBold,fontSize:12 ),),
                                          // Text('05/2025',style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.semiBold,fontSize:12 ),),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('CARD HOLDER NAME'.tr,style: TextStyle(color: AppColors.lightPrimary,fontFamily: AppFontStyle.semiBold,fontSize:11 ),),
                                          SizedBox(height: 5,),
                                          Text(controller.userCardList[index].name==null?'':controller.userCardList[index].name.toString(),style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.semiBold,fontSize:13 ),),
                                          // Text('John Wilamson',style: TextStyle(color: AppColors.white,fontFamily: AppFontStyle.semiBold,fontSize:13 ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                // color: Colors.red,
              ),
              SizedBox(height: 10,),
              Container(
                  margin:  controller.isArabic==true?EdgeInsets.only(right: 15,):
                  EdgeInsets.only(left: 15,),
                  // margin: EdgeInsets.only(left: controller.isArabic==true?0:15,right: controller.isArabic==true?0:15),
                  child: Text('Other Ways to Pay'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.bold,))),
              SizedBox(height: 15,),
              ///--- google pay ---
              GestureDetector(
                onTap: (){


                },
                child: Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.textGrey10,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                            EdgeInsets.only(left: 10,),
                            // margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?0:10),
                            // margin: EdgeInsets.only(left: 10),
                            child:
                            SvgPicture.asset(AppImages.google,width: 30,),


                          ),
                          Container(
                              // margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?0:10),
                              margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                               EdgeInsets.only(left: 10,),
                              child: Text('Google Pay'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.bold,))),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.google();
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: controller.isArabic==true?10:0,right: controller.isArabic==true?0:10),
                            // margin: EdgeInsets.only(right: 10),

                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(10),

                              child: Container(
                                height: 20,width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color:AppColors.textGrey23 ,width: 1.3),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white,
                                ),

                                child: controller.selectedGoogle==true?Icon(Icons.circle,size: 17,color: AppColors.primary,):Container(),
                              ),
                            )


                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///--- apple pay ----
              SizedBox(height: 15,),
              Container(

                margin: EdgeInsets.only(left: 15,right: 15),
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.textGrey10,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                          EdgeInsets.only(left: 15,),
                          // margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?0:10),
                          // margin: EdgeInsets.only(left: 10),
                          child:
                          SvgPicture.asset(AppImages.apple,width: 23,),


                        ),
                        Container(
                            margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                            EdgeInsets.only(left: 10,),
                            // margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?0:10),
                            // margin: EdgeInsets.only(left: 10,),
                            child: Text('Apple Pay'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.bold,))),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.apple();
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: controller.isArabic==true?10:0,right: controller.isArabic==true?0:10),
                          // margin: EdgeInsets.only(right: 10),

                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Container(
                              height: 20,width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color:AppColors.textGrey23 ,width: 1.3),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),

                              child: controller.selectedApple==true?Icon(Icons.circle,size: 17,color: AppColors.primary,):Container(),
                            ),
                          )


                      ),
                    ),
                  ],
                ),
              ),
              ///--- paybale pay ----
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.textGrey10,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                          EdgeInsets.only(left: 15,),
                          // margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?0:10),
                          // margin: EdgeInsets.only(left: 10),
                          child:
                          SvgPicture.asset(AppImages.payable,width: 23,),


                        ),
                        Container(
                            margin:  controller.isArabic==true?EdgeInsets.only(right: 10,):
                            EdgeInsets.only(left: 10,),
                            // margin: EdgeInsets.only(left: controller.isArabic==true?0:12,right: controller.isArabic==true?0:12),
                            // margin: EdgeInsets.only(left: 12,),
                            child: Text('Paypal'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.bold,))),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.paypal();
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: controller.isArabic==true?10:0,right: controller.isArabic==true?0:10),
                          // margin: EdgeInsets.only(right: 10),

                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Container(
                              height: 20,width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color:AppColors.textGrey23 ,width: 1.3),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),

                              child: controller.selectedPaypal==true?Icon(Icons.circle,size: 17,color: AppColors.primary,):Container(),
                            ),
                          )


                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                  // margin: EdgeInsets.only(top: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Amount to Pay: '.tr,style: TextStyle(fontSize: 17, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold,)),
                      Text('\$ 100'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.bold,)),
                    ],
                  )),
              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Get.to(TicketScreen());

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
                      style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    })




    );
  }

 getDetails(){

 }
}
