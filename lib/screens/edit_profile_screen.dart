import 'package:event/controllers/profile_controller/edit_profile_controller.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileScreen extends StatelessWidget {

   EditProfileScreen({Key? key, }) : super(key: key);
   final editKey = GlobalKey<FormState>();
   EditProfileController editProfileController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.pink,
      appBar: AppBar(

        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircularShadow(
              child: SvgPicture.asset(
                editProfileController.isArabic==true? AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                // '${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(width: 0,),
            Text('Edit Profile'.tr,style: TextStyle(fontSize: 19, color: AppColors.black, fontFamily: AppFontStyle.semiBold),),
            SizedBox(width: 0,),
            GestureDetector(
                onTap: (){
                  if(editKey.currentState!.validate()){
                    Get.back();
                  }
                  editProfileController.nameController.clear();
                  editProfileController.emailController.clear();
                  editProfileController.birthDateController.clear();
                  editProfileController.phoneController.clear();
                  editProfileController.bioController.clear();
                },
                child: Text('Done'.tr,style: TextStyle(fontSize: 17, color: AppColors.primary, fontFamily: AppFontStyle.semiBold),)),
            // SizedBox(width: 1,),
          ],
        ),

      ),
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
    builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child:  Form(
                key: editKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                controller.imageFile1==null?Container(
                alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset('${AppImages.comm1}',fit: BoxFit.fill,height: 100,width: 100,)),
                )
                    :Container(
                  alignment: Alignment.center,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.file(controller.imageFile1!,fit: BoxFit.fill,height: 100,width: 100,)),
                    ),

                    SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          controller.choosImage(context);
                        },
                        child: Container(

                            alignment: Alignment.center,
                            child: Text('Change Profile Photo'.tr,style: TextStyle(fontSize: 17, color: AppColors.primary, fontFamily: AppFontStyle.semiBold),))),

                    SizedBox(height: 15,),
                    // Form(
                    //   key: controller.editKey,
                    //   child:
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///----- name ------
                            Text('Name'.tr,style: TextStyle(fontSize: 15, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                            SizedBox(height: 5,),
                            TextFormField(

                              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                border: InputBorder.none,
                                hintText: 'Enter your name'.tr,
                                hintStyle: const TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                // hintText: noteSubText,
                                // hintStyle: const TextStyle(
                                //   color: lightGrey,
                                //   fontFamily: "Regular",
                                // ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            ///------ email ---
                            Text('E-mail'.tr,style: TextStyle(fontSize: 15, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                            SizedBox(height: 5,),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email'.tr;
                                }
                                return null;
                              },
                              controller: controller.emailController,
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
                                hintText: 'Enter your email'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                // hintText: noteSubText,
                                // hintStyle: const TextStyle(
                                //   color: lightGrey,
                                //   fontFamily: "Regular",
                                // ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            ///------ birthdate ---
                            Text('Birthdate'.tr,style: TextStyle(fontSize: 15, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                            SizedBox(height: 5,),

                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your birthdate'.tr;
                                }
                                return null;
                              },
                              controller: controller.birthDateController,
                              // controller: controller.birthDateController,
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
                                hintText: 'Enter your birthdate'.tr,
                                hintStyle: const TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () async {
                                      // controller.selectDate(context);
                                      var datePicked = await DatePicker.showSimpleDatePicker(
                                        context,
                                        initialDate: DateTime(1994),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime(2012),
                                        dateFormat: "dd-MMMM-yyyy".tr,
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      print('date-------${datePicked}');
                                      controller.selectedDate=datePicked!;
                                      print('datattttt----${controller.selectedDate.toString().substring(0,11)}');
                                      controller.birthDateController.text=controller.selectedDate.toString().substring(0,11);


                                    },
                                    child: Icon(Icons.keyboard_arrow_down_rounded))
                                // hintText: noteSubText,
                                // hintStyle: const TextStyle(
                                //   color: lightGrey,
                                //   fontFamily: "Regular",
                                // ),
                              ),
                            ),
///--
//                           Container(
//
//                             // margin: EdgeInsets.only(
//                             //     top: height * 0.01, bottom: height * 0.02),
//                               height: 30,
//
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: ),
//                                 color: AppColors.textGrey10,
//                                 borderRadius: new BorderRadius.circular(9.0),
//                               ),
//                               child: CupertinoDatePicker(
//                                 mode: CupertinoDatePickerMode.date,
//                                 initialDateTime: DateTime(1969, 1, 1),
//                                 onDateTimeChanged: (DateTime newDateTime) {
//                                   print('date----- ${newDateTime}');
//                                   // Do something
//                                 },
//                               ), ),
                            SizedBox(height: 10,),
                            ///------ phone ---
                            Text('Phone'.tr,style: TextStyle(fontSize: 15, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                            SizedBox(height: 5,),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phonenumber'.tr;
                                }
                                return null;
                              },
                              controller: controller.phoneController,
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
                                hintText: 'Enter your phonenumber'.tr,
                                hintStyle: const TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                // hintText: noteSubText,
                                // hintStyle: const TextStyle(
                                //   color: lightGrey,
                                //   fontFamily: "Regular",
                                // ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            ///------ bio ---
                            Text('Bio'.tr,style: TextStyle(fontSize: 15, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                            SizedBox(height: 5,),
                            TextFormField(
                              maxLines: 3,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your bio'.tr;
                                }
                                return null;
                              },
                              controller: controller.bioController,
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
                                hintText: 'Enter your bio'.tr,
                                hintStyle: const TextStyle(
                                    color: AppColors.textGrey9,
                                    fontFamily: AppFontStyle.semiBold,fontSize:14
                                ),
                                // hintText: noteSubText,
                                // hintStyle: const TextStyle(
                                //   color: lightGrey,
                                //   fontFamily: "Regular",
                                // ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            // Container(
                            //
                            //   // margin: EdgeInsets.only(
                            //   //     top: height * 0.01, bottom: height * 0.02),
                            //     height: 90,
                            //
                            //     decoration: BoxDecoration(
                            //       // border: Border.all(color: ),
                            //       color: AppColors.textGrey10,
                            //       borderRadius: new BorderRadius.circular(9.0),
                            //     ),
                            //     child: TextFormField(
                            //         controller: controller.nameController,
                            //         keyboardType: TextInputType.text,
                            //         style: const TextStyle(
                            //             color: AppColors.textGrey9,
                            //             fontFamily: AppFontStyle.semiBold,fontSize:14
                            //         ),
                            //         validator: (value) {
                            //           if (value!.isEmpty) {
                            //             return 'This field is required';
                            //           }
                            //           return null;
                            //         },
                            //
                            //         decoration: const InputDecoration(
                            //           contentPadding: EdgeInsets.symmetric(
                            //               vertical: 13, horizontal: 15),
                            //
                            //           border: InputBorder.none,
                            //           hintText: 'Enter your bio',
                            //           hintStyle: TextStyle(
                            //               color: AppColors.textGrey9,
                            //               fontFamily: AppFontStyle.semiBold,fontSize:14
                            //           ),
                            //
                            //
                            //           // suffixIconConstraints:
                            //         ))),
                          ],
                        ),
                      ),
                    // ),

                  ],
                ),
              ),
            ),
          );

    })




    );
  }
}
