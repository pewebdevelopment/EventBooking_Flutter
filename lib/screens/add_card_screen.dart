

import 'package:event/controllers/add_card_controller.dart';
import 'package:event/controllers/paymentmethod_controller.dart';
import 'package:event/screens/payment_method_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AddCardScreen extends StatelessWidget {
   AddCardScreen({Key? key}) : super(key: key);
PaymentController paymentController=Get.put(PaymentController());
AddCardController addCardController=Get.put(AddCardController());
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
                addCardController.isArabic==true?AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
      ),
body: GetBuilder<AddCardController>(
        init: AddCardController(),

    builder: (controller) {
          // return SingleChildScrollView(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       SizedBox(
          //         height: 40,
          //       ),
          //       CreditCard(
          //         // frontLayout: Container(
          //         //   margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          //         //   child: Column(
          //         //     children: [
          //         //       Text( controller.cardNumber,style: TextStyle(color: Colors.white),)
          //         //
          //         //     ],
          //         //   ),
          //         // ),
          //         // frontLayout: Container(
          //         //   margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          //         //   child: Column(
          //         //     children: [
          //         //       Text('hello'),
          //         //     ],
          //         //   ),
          //         // ),
          //
          //
          //         cardNumber: controller.cardNumber,
          //         cardExpiry: controller.expiryDate,
          //         cardHolderName:controller. cardHolderName,
          //         cvv: controller.cvv,
          //         cardType: CardType.masterCard,
          //
          //         bankName: 'Axis Bank',
          //         showBackSide: controller.showBack,
          //
          //
          //         // customCardIcons: <CustomCardTypeImage>[
          //         //   CustomCardTypeImage(
          //         //     cardType: CardType.mastercard,
          //         //     cardImage: Image.asset(
          //         //       'assets/mastercard.png',
          //         //       height: 48,
          //         //       width: 48,
          //         //     ),
          //         //   ),
          //         // ],
          //
          //         // frontBackground: GradientCardBackground,
          //         frontBackground:  Container(
          //           decoration: BoxDecoration(
          //
          //             gradient: LinearGradient(
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight,
          //               colors: <Color>[
          //                 Color(0xff3A5BF6),
          //                 Color(0xff7A55D4),
          //               ],
          //               stops: const <double>[
          //                 0.35,
          //                 0.8,
          //               ],
          //             ),
          //           ),
          //         ),
          //         // backBackground: Container(
          //         //   decoration: BoxDecoration(
          //         //
          //         //     gradient: LinearGradient(
          //         //       begin: Alignment.topLeft,
          //         //       end: Alignment.bottomRight,
          //         //       colors: <Color>[
          //         //         Colors.grey.withAlpha(20),
          //         //         Colors.white.withAlpha(20),
          //         //       ],
          //         //       stops: const <double>[
          //         //         0.3,
          //         //         0,
          //         //       ],
          //         //     ),
          //         //   ),
          //         // ),
          //         backBackground: CardBackgrounds.white,
          //         showShadow: false,
          //         // mask: getCardTypeMask(cardType: CardType.americanExpress),
          //       ),
          //       SizedBox(
          //         height: 40,
          //       ),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 20,
          //             ),
          //             child: TextFormField(
          //               controller: controller.cardNumberCtrl,
          //               decoration: InputDecoration(hintText: 'Card Number'),
          //               maxLength: 16,
          //               onChanged: (value) {
          //                 final newCardNumber = value.trim();
          //                 var newStr = '';
          //                 final step = 4;
          //
          //                 for (var i = 0; i < newCardNumber.length; i += step) {
          //                   newStr += newCardNumber.substring(
          //                       i, math.min(i + step, newCardNumber.length));
          //                   if (i + step < newCardNumber.length) newStr += ' ';
          //                 }
          //
          //
          //                   controller.cardNumber = newStr;
          //
          //               },
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 20,
          //             ),
          //             child: TextFormField(
          //               controller: controller.expiryFieldCtrl,
          //               decoration: InputDecoration(hintText: 'Card Expiry'),
          //               maxLength: 5,
          //               onChanged: (value) {
          //                 var newDateValue = value.trim();
          //                 final isPressingBackspace =
          //                     controller.expiryDate.length > newDateValue.length;
          //                 final containsSlash = newDateValue.contains('/');
          //
          //                 if (newDateValue.length >= 2 &&
          //                     !containsSlash &&
          //                     !isPressingBackspace) {
          //                   newDateValue = newDateValue.substring(0, 2) +
          //                       '/' +
          //                       newDateValue.substring(2);
          //                 }
          //
          //                   controller. expiryFieldCtrl.text = newDateValue;
          //                   controller. expiryFieldCtrl.selection = TextSelection.fromPosition(
          //                       TextPosition(offset: newDateValue.length));
          //                   controller. expiryDate = newDateValue;
          //
          //               },
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 20,
          //             ),
          //             child: TextFormField(
          //               decoration: InputDecoration(hintText: 'Card Holder Name'),
          //               onChanged: (value) {
          //
          //                   controller.cardHolderName = value;
          //
          //               },
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          //             child: TextFormField(
          //               decoration: InputDecoration(hintText: 'CVV'),
          //               maxLength: 3,
          //               onChanged: (value) {
          //
          //                 controller. cvv = value;
          //
          //               },
          //               focusNode: controller.focusNode,
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );

      return Container(
        decoration: BoxDecoration(
        //   image: controller.useBackgroundImage
        //       ? const DecorationImage(
        //     image: ExactAssetImage('assets/images/ticketsBg.png'),
        //     fit: BoxFit.fill,
        //   )
        //       : null,
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // CreditCardWidget(
              //   width: MediaQuery.of(context).size.width,
              //   height: 190,
              //   onCreditCardWidgetChange: (val){
              //     print(val.toString());
              //   },
              //   cardNumber: cardNumber,
              //   expiryDate: expiryDate,
              //   cardHolderName: cardHolderName,
              //   cvvCode: cvvCode,
              //   showBackView: isCvvFocused,
              // ),
              CreditCardWidget(

                // glassmorphismConfig:
                // controller. useGlassMorphism ?Glassmorphism.defaultConfig() : null,
                cardNumber: controller.cardNumber,
                expiryDate: controller.expiryDate,
                cardHolderName: controller.cardHolderName,
                cvvCode: controller.cvvCode,
                // bankName: 'Axis Bank',
                showBackView: controller.isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: AppColors.primary,
                backgroundImage:
                controller.useBackgroundImage ? 'assets/images/ticketsBg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange:
                    (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/ticketsBg.png',
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: controller.formKey,
                        obscureCvv: false,
                        obscureNumber: false,
                        cardNumber: controller.cardNumber,
                        cvvCode: controller.cvvCode,

                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: controller.cardHolderName,
                        expiryDate: controller.expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.black,

                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number'.tr,
                          // hintText: '**** **** **** ****',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          labelStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          focusedBorder: controller.border,
                          fillColor: AppColors.textGrey10,
                          enabledBorder:controller.border,
                          filled: true,

                        ),
                        expiryDateDecoration: InputDecoration(
                          isDense: true,

                          hintStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          labelStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          focusedBorder: controller. border,
                          fillColor: AppColors.textGrey10,
                          enabledBorder:controller. border,
                          filled: true,
                          labelText: 'Expired Date'.tr,
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          labelStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          focusedBorder: controller. border,
                          fillColor: AppColors.textGrey10,
                          enabledBorder:controller. border,
                          filled: true,
                          labelText: 'CVV'.tr,
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          labelStyle: const TextStyle(color: AppColors.textGrey9,fontFamily: AppFontStyle.semiBold),
                          focusedBorder: controller. border,
                          fillColor: AppColors.textGrey10,
                          enabledBorder:controller. border,
                          filled: true,
                          labelText: 'Card Holder'.tr,
                        ),
                        onCreditCardModelChange: controller.onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      GestureDetector(
                        onTap: () async {
                          if (controller.formKey.currentState!.validate()) {
                            print('card number----${controller.cardNumber}');
                            print('card number----${controller.cardHolderName}');
                            print('card number----${controller.cvvCode}');
                            print('card number----${controller.expiryDate}');
                            print('valid!');
                            SharedPreferences sp=await SharedPreferences.getInstance();
                            String number=controller.cardNumber.substring(controller.cardNumber.length -4 );
                            sp.setString('cNumber',controller.cardNumber.toString());
                            // sp.setString('cNumber',number.toString());
                            sp.setString('cName',controller.cardHolderName.toString());
                            sp.setString('cDate',controller.expiryDate.toString());
                            controller.formKey.currentState!.save();
                            paymentController.addUserToList(
                             sp.getString('cName'),
                             sp.getString('cNumber'),
                             sp.getString('cDate'),

                            );

                            // form.currentState!.save();
                            // controller.updateLanguageInformation();
                            Get.to(PaymentMethodScreen());

                            // print('card------${controller.cardNumber.substring(0,controller.cardNumber.length - 4).replaceRange(0, 14, "**** **** ****")+controller.cardNumber.substring(controller.cardNumber.length -4 )}');
                          } else {
                            print('invalid!');
                          }

                        },
                        child: Container(

                          height: height * 0.06,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary,
                          ),
                          child:  Center(child: Text("Add Card".tr,
                            style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8.0),
                      //     ),
                      //     backgroundColor: const Color(0xff1b447b),
                      //   ),
                      //   child: Container(
                      //     margin: const EdgeInsets.all(12),
                      //     child: const Text(
                      //       'Validate',
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontFamily: 'halter',
                      //         fontSize: 14,
                      //         package: 'flutter_credit_card',
                      //       ),
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     if (controller.formKey.currentState!.validate()) {
                      //       print('card number----${controller.cardNumber}');
                      //       print('card number----${controller.cardHolderName}');
                      //       print('card number----${controller.cvvCode}');
                      //       print('card number----${controller.expiryDate}');
                      //       print('valid!');
                      //     } else {
                      //       print('invalid!');
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }),
    );
  }


}
