import 'package:event/controllers/detailpageController.dart';
import 'package:event/controllers/profile_controller/profile_controller.dart';
import 'package:event/screens/tickets_type_screen.dart';
import 'package:event/utils/common_imports.dart';


import 'edit_profile_screen.dart';

class DetailPageScreen extends StatelessWidget {
  DetailPageScreen({Key? key}) : super(key: key);
  BottomNavigationController bottomNavigationController=Get.put(BottomNavigationController());
  DetailPageController detailPageController=Get.put(DetailPageController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.detailPageBg),
                    fit: BoxFit.cover,
                  )
              ),
//               child: Padding(
//                 padding: EdgeInsets.only(top: height * 0.3),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       )
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.only(top: height * 0.03,left: width * 0.04,right: width * 0.04),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children:  [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children:  [
//                                 Text("Christina Perri Live In Concert",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                 Container(
//                                   margin: EdgeInsets.only(top: height * 0.005),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text("Hollywood",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                       Container(
// margin: EdgeInsets.only(left: width * 0.015),
//                                         color: Colors.black,
//                                         height: 18,
//                                         width: 1,
//                                       ),
//                                       Container(
//                                           margin: EdgeInsets.only(left: width * 0.015),
//                                           child: Text("Hindi",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
//                                       Container(
//                                         margin: EdgeInsets.only(left: width * 0.015),
//                                         color: Colors.black,
//                                         height: 18,
//                                         width: 1,
//                                       ),
//                                       Container(
//                                           margin: EdgeInsets.only(left: width * 0.015),
//                                           child: Text("2hrs 30mins",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               // crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text("\$999",style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: AppFontStyle.bold),),
//                                 Text("onwords",style: TextStyle(fontSize: 10, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                               ],
//                             ),
//                           ],
//                         ),
//                         ///----- address location view ----------
//                         Container(
//                           margin: EdgeInsets.only(top: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             // crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Icon(Icons.access_time_filled,color: AppColors.textGrey11,size: 12,),
//                                         SizedBox(width: 5,),
//                                         Text("Sat Jun 29,6pm-9pm",style: TextStyle(fontSize: 12, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//
//                                       ],
//                                     ),
//                                     SizedBox(height: 10,),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Icon(Icons.location_on,color: AppColors.textGrey11,size: 15,),
//                                         SizedBox(width: 5,),
//                                         Container(
//                                           width: width * 0.55,
//
//                                             child: Text("4746 MacLaren Stree, Ottawa, Ontario Canada-K1P 5M7",style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),)),
//
//
//                                       ],
//                                     )
//                                   ],
//
//                                 ),
//                               ),
//
//
//                               Container(
//                                 margin: EdgeInsets.only(left: 25),
//                                     width: 80,
//                                     child: Image.asset(AppImages.mapIcon,fit: BoxFit.fill,))
//                               // Expanded(child: Container(
//                               //     width: 60,
//                               //     child: Image.asset(AppImages.mapIcon,))),
//                             ],
//                           ),
//                         ),
//                         ///------ join button view -------
//     //                     Container(
//     //                       height: 60,
//     //                       child: ListView.builder(
//     // padding: EdgeInsets.zero,
//     // scrollDirection: Axis.horizontal,
//     // itemCount: 5,
//     // physics: NeverScrollableScrollPhysics(),
//     // itemBuilder:
//     // (BuildContext context, int index) {
//     //   return Stack(
//     //     children: [
//     //       ClipRRect(
//     //         borderRadius: BorderRadius.circular(50),
//     //         child: Container(
//     //           height: 60,
//     //           width: 60,
//     //           color: Colors.red,
//     //           child: Text(
//     //               'hello'
//     //           ),
//     //         ),
//     //       ),
//     //       ClipRRect(
//     //         borderRadius: BorderRadius.circular(50),
//     //         child: Container(
//     //           height: 30,
//     //           width: 30,
//     //           color: Colors.green,
//     //
//     //         ),
//     //       ),
//     //     ],
//     //   );
//     //
//     // },
//     //                     )),
//
//
//
//                         Row(
//                           children: [
//                             Stack(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(50),
//                                   child: Container(
//                                     height: 30,
//                                     width: 30,
//                                     color: Colors.red,
//                                     child: Image.asset(
//                                         AppImages.user1,fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 20),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(50),
//                                     child: Container(
//                                       // margin: EdgeInsets.only(left: 20),
//                                       height: 30,
//                                       width: 30,
//                                       color: Colors.green,
//                                       child: Image.asset(
//                                         AppImages.user2,fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 40),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(50),
//                                     child: Container(
//                                       // margin: EdgeInsets.only(left: 20),
//                                       height: 30,
//                                       width: 30,
//                                       color: Colors.pink,
//                                       child: Image.asset(
//                                         AppImages.user3,fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 60),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(50),
//                                     child: Container(
//                                       // margin: EdgeInsets.only(left: 20),
//                                       height: 30,
//                                       width: 30,
//                                       color: Colors.black,
//                                       child: Image.asset(
//                                         AppImages.user4,fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 80),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(50),
//                                     child: Container(
//                                       // margin: EdgeInsets.only(left: 20),
//                                       height: 30,
//                                       width: 30,
//                                       color: Colors.blue,
//                                       child: Image.asset(
//                                         AppImages.user5,fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(width: 10,),
//                             Container(
//                               child: Column(
//                                 children: [
//
//                                   GestureDetector(
//                                     onTap: (){
//                                       bottomNavigationController.isEdit=true;
//                                       Get.to(EditProfileScreen());
//                                     },
//                                     child: Center(
//                                       child: Container(
//                                         height: height * 0.03,
//                                         width: width * 0.15,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(5),
//                                           color: AppColors.primary,
//                                         ),
//                                         child: Center(child: Text("+ Join".tr,style: AppFontStyle.whiteSemiBold14,)),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5,),
//                                   Text("320+ interested",style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 90,),
//                             Container(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text("4.8",style: TextStyle(fontSize: 15, color: AppColors.yellow, fontFamily: AppFontStyle.semiBold),),
//                                       Icon(Icons.star,color: AppColors.yellow,size: 15,)
//                                     ],
//                                   ),
//
//
//                                   SizedBox(height: 5,),
//                                   Text("320+ reviews",style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//
//
//
//                         Expanded(
//                           child: GetBuilder<DetailPageController>(
//                               init: DetailPageController(),
//
//                               builder: (controller) {
//                                 return SingleChildScrollView(
//                                   child: Container(
//                                     margin: EdgeInsets.only(top: 15),
//                                     child:  Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         ///------ about -----
//                                         Text("About",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                         Container(
//                                           margin: EdgeInsets.only(top: 10),
//                                           child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accum "
//                                               "san etiam diam nunc proin. Sit lorem magna sit nisi, viverra crasvar "
//                                               "us. Nec vitae ac sit tristique. Lectus in augue aliquam neque luctus "
//                                               "nunc, duis urna tellus. Sit lorem magna sit nisi, viverra crasvarss us. "
//                                               "Nec vitae ac sit tristique.Lectus in augue aliquam neque luctus nun "
//                                               ",duis urna tellus. Sit lorem magna sit nisi, viverra crasvar us. Nec vi "
//                                               "tae ac sit tristique gas dhjkd augue sit nisi elit magna.",
//                                             style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                                         ),
//                                         ///---- artists ----
//                                         Container(
//                                             margin: EdgeInsets.only(top: 10),
//                                             child: Text("Artists",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
//                                         Container(
//                                           margin: EdgeInsets.only(top: 10),
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Column(
//
//                                                 children: [
//                                                   ClipRRect(
//                                                     borderRadius: BorderRadius.circular(50),
//                                                     child: Container(
//                                                       height: 40,
//                                                       width: 40,
//                                                       color: Colors.red,
//                                                       child: Image.asset(
//                                                         AppImages.art1,fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text("Christina Perri",style: TextStyle(fontSize: 11, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                                   Text("Playback singer",
//                                                     style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                                                 ],
//                                               ),
//                                               SizedBox(width: 10,),
//                                               Column(
//
//                                                 children: [
//                                                   ClipRRect(
//                                                     borderRadius: BorderRadius.circular(50),
//                                                     child: Container(
//                                                       height: 40,
//                                                       width: 40,
//                                                       color: Colors.red,
//                                                       child: Image.asset(
//                                                         AppImages.art2,fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text("Ewa Farna",style: TextStyle(fontSize: 11, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                                   Text("Playback singer",
//                                                     style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         ///-----Contacts---
//                                         Container(
//                                             margin: EdgeInsets.only(top: 10),
//                                             child: Text("Contacts",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
//                                         Container(
//                                           margin: EdgeInsets.only(top: 10),
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Expanded(
//                                                 child: Row(
//
//                                                   children: [
//                                                     ClipRRect(
//                                                       borderRadius: BorderRadius.circular(50),
//                                                       child: Container(
//                                                         height: 45,
//                                                         width: 45,
//                                                         color: Colors.red,
//                                                         child: Image.asset(
//                                                           AppImages.contact1,fit: BoxFit.fill,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 10,),
//                                                     Column(
//                                                       mainAxisAlignment: MainAxisAlignment.center,
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         Text("Casandra Johnstone",style: TextStyle(fontSize: 9, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                                         Text("Event Organizer",
//                                                           style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                                                         Text("+91 12345 67890",
//                                                           style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//                                                       ],
//                                                     ),
//                                                           ],
//                                                 ),
//                                               ),
//                                               SizedBox(width: 10,),
//                                               Expanded(
//                                                 child: Row(
//
//                                                   children: [
//                                                     ClipRRect(
//                                                       borderRadius: BorderRadius.circular(50),
//                                                       child: Container(
//                                                         height: 45,
//                                                         width: 45,
//                                                         color: Colors.red,
//                                                         child: Image.asset(
//                                                           AppImages.contact1,fit: BoxFit.fill,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 10,),
//                                                     Column(
//                                                       mainAxisAlignment: MainAxisAlignment.center,
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         Text("Casandra Johnstone",style: TextStyle(fontSize: 9, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                                         Text("Event Organizer",
//                                                           style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                                                         Text("+91 12345 67890",
//                                                           style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         ///---- terms and condition ------
//                                         SizedBox(height:15),
//                                         Text("Terms & Conditions",style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
//                                         Container(
//                                           margin: EdgeInsets.only(top: 10),
//                                           child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accum "
//                                               "san etiam diam nunc proin. Sit lorem magna sit nisi, viverra crasvar "
//                                               "us. Nec vitae ac sit tristique. Lectus in augue aliquam neque luctus "
//                                               "nunc, duis urna tellus. Sit lorem magna sit nisi.",
//                                             style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
//                                         ),
//                                         ///--- rating / invite / get tickets  button view ------
//                                         SizedBox(height:15),
//                                         Row(
//                                           children: [
//                                             ///--- rating ----
//                                             GestureDetector(
//                                               onTap: (){
//
//                                               },
//                                               child: Center(
//                                                 child: Container(
//                                                   height: height * 0.055,
//                                                   width: width * 0.12,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(8),
//                                                     color: AppColors.black3,
//                                                   ),
//                                                   child: Center(child: Icon(Icons.star,size: 20,color: AppColors.yellow,)),
//                                                 ),
//                                               ),
//                                             ),
//                                             ///------ invite ----
//
//                                             GestureDetector(
//                                               onTap: (){
//
//                                               },
//                                               child: Container(
//                                                 margin: EdgeInsets.only(left: 10),
//                                                 height: height * 0.055,
//                                                 width: width * 0.32,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(8),
//                                                   color: AppColors.black3,
//                                                 ),
//                                                 child: const Center(child: Text("Invite",
//                                                   style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
//                                               ),
//                                             ),
//                                             ///----- get tickets ----
//                                             GestureDetector(
//                                               onTap: (){
// Get.to(TicketsTypeScreen());
//                                               },
//                                               child: Container(
//                                                 margin: EdgeInsets.only(left: 10),
//                                                 height: height * 0.055,
//                                                 width: width * 0.4,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(8),
//                                                   color: AppColors.primary,
//                                                 ),
//                                                 child: const Center(child: Text("Get Tickets",
//                                                   style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height:15),
//                                       ],
//                                     ),
//
//                                   ),
//                                 );
//                               }
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
            ),
            ///---- share- calendare - like icon -----
            detailPageController.isArabic==true? Positioned(
              top: height * 0.24,
              left: width * 0.045,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AppImages.shareIcon2,height: 15)
                        // SvgPicture.asset(AppImages.shareIcon,height: 20,),
                      ),
                    ),
                    SizedBox(width: width * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.asset(AppImages.detailCalender2,height: 15)
                        // SvgPicture.asset(AppImages.detailCalender,height: 20,),
                      ),
                    ),
                    SizedBox(width: width * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.asset(AppImages.detailLike2,height: 15)
                        // child: SvgPicture.asset(AppImages.detailLike,height: 20,),
                      ),
                    ),
                  ],
                ),
              ),
            ):Positioned(
              top: height * 0.24,
              right: width * 0.045,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AppImages.shareIcon2,height: 15)
                        // SvgPicture.asset(AppImages.shareIcon,height: 20,),
                      ),
                    ),
                    SizedBox(width: width * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.asset(AppImages.detailCalender2,height: 15)
                        // SvgPicture.asset(AppImages.detailCalender,height: 20,),
                      ),
                    ),
                    SizedBox(width: width * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.asset(AppImages.detailLike2,height: 15)
                        // child: SvgPicture.asset(AppImages.detailLike,height: 20,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
                GetBuilder<DetailPageController>(
    init: DetailPageController(),
    id: "detail",
    builder: (controller) {
      return  DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.7,
        maxChildSize: 0.95,
        builder: (_, controller) {
          return Container(

            decoration: BoxDecoration(
              // color: Colors.red,
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                // Icon(
                //   Icons.remove,
                //   color: Colors.grey[600],
                // ),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(top: height * 0.0,left: width * 0.04,right: width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text("Christina Perri Live In Concert".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                    Container(
                                      margin: EdgeInsets.only(top: height * 0.005),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Hollywood".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                          Container(
                                            margin: EdgeInsets.only(left: width * 0.015),
                                            color: Colors.black,
                                            height: 18,
                                            width: 1,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: width * 0.015),
                                              child: Text("Hindi".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
                                          Container(
                                            margin: EdgeInsets.only(left: width * 0.015),
                                            color: Colors.black,
                                            height: 18,
                                            width: 1,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: width * 0.015),
                                              child: Text("2hrs 30mins".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text("\$999".tr,style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: AppFontStyle.bold),),
                                    Text("onwords".tr,style: TextStyle(fontSize: 10, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                  ],
                                ),
                              ],
                            ),
                            ///----- address location view ----------
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.access_time_filled,color: AppColors.textGrey11,size: 12,),
                                            SizedBox(width: 5,),
                                            Text("Sat Jun 29,6pm-9pm".tr,style: TextStyle(fontSize: 12, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),


                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on,color: AppColors.textGrey11,size: 15,),
                                            SizedBox(width: 5,),
                                            Container(
                                                width: width * 0.55,

                                                child: Text("4746 MacLaren Stree, Ottawa, Ontario Canada-K1P 5M7".tr,style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),)),


                                          ],
                                        )
                                      ],

                                    ),
                                  ),


                                  Container(
                                      margin: EdgeInsets.only(left: 25),
                                      width: 80,
                                      child: Image.asset(AppImages.mapIcon,fit: BoxFit.fill,))
                                  // Expanded(child: Container(
                                  //     width: 60,
                                  //     child: Image.asset(AppImages.mapIcon,))),
                                ],
                              ),
                            ),
                            ///------ join button view -------




                            Row(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        color: Colors.red,
                                        child: Image.asset(
                                          AppImages.user1,fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 20),
                                          height: 30,
                                          width: 30,
                                          color: Colors.green,
                                          child: Image.asset(
                                            AppImages.user2,fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 20),
                                          height: 30,
                                          width: 30,
                                          color: Colors.pink,
                                          child: Image.asset(
                                            AppImages.user3,fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 60),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 20),
                                          height: 30,
                                          width: 30,
                                          color: Colors.black,
                                          child: Image.asset(
                                            AppImages.user4,fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 80),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          // margin: EdgeInsets.only(left: 20),
                                          height: 30,
                                          width: 30,
                                          color: Colors.blue,
                                          child: Image.asset(
                                            AppImages.user5,fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    children: [

                                      GestureDetector(
                                        onTap: (){
                                          bottomNavigationController.isEdit=true;
                                          Get.to(EditProfileScreen());
                                        },
                                        child: Center(
                                          child: Container(
                                            height: height * 0.03,
                                            width: width * 0.15,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.primary,
                                            ),
                                            child: Center(child: Text("+ Join".tr,style: AppFontStyle.whiteSemiBold14,)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("320+ interested".tr,style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),

                                    ],
                                  ),
                                ),
                                SizedBox(width: 90,),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("4.8".tr,style: TextStyle(fontSize: 15, color: AppColors.yellow, fontFamily: AppFontStyle.semiBold),),
                                          Icon(Icons.star,color: AppColors.yellow,size: 15,)
                                        ],
                                      ),


                                      SizedBox(height: 5,),
                                      Text("320+ reviews".tr,style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GetBuilder<DetailPageController>(
                                init: DetailPageController(),

                                builder: (controller) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ///------ about -----
                                          Text("About".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accum "
                                                "san etiam diam nunc proin. Sit lorem magna sit nisi, viverra crasvar "
                                                "us. Nec vitae ac sit tristique. Lectus in augue aliquam neque luctus "
                                                "nunc, duis urna tellus. Sit lorem magna sit nisi, viverra crasvarss us. "
                                                "Nec vitae ac sit tristique.Lectus in augue aliquam neque luctus nun "
                                                ",duis urna tellus. Sit lorem magna sit nisi, viverra crasvar us. Nec vi "
                                                "tae ac sit tristique gas dhjkd augue sit nisi elit magna.".tr,
                                              style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                          ),
                                          ///---- artists ----
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("Artists".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(

                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        color: Colors.red,
                                                        child: Image.asset(
                                                          AppImages.art1,fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Text("Christina Perri".tr,style: TextStyle(fontSize: 11, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                                    Text("Playback singer".tr,
                                                      style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(

                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        color: Colors.red,
                                                        child: Image.asset(
                                                          AppImages.art2,fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Text("Ewa Farna".tr,style: TextStyle(fontSize: 11, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                                    Text("Playback singer".tr,
                                                      style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          ///-----Contacts---
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("Contacts".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),)),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(

                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(50),
                                                        child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          color: Colors.red,
                                                          child: Image.asset(
                                                            AppImages.contact1,fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Casandra Johnstone".tr,style: TextStyle(fontSize: 9, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                                          Text("Event Organizer".tr,
                                                            style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                                          Text("+91 12345 67890".tr,
                                                            style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),

                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Expanded(
                                                  child: Row(

                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(50),
                                                        child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          color: Colors.red,
                                                          child: Image.asset(
                                                            AppImages.contact1,fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Casandra Johnstone".tr,style: TextStyle(fontSize: 9, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                                          Text("Event Organizer".tr,
                                                            style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                                          Text("+91 12345 67890".tr,
                                                            style: TextStyle(fontSize: 8, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),

                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ///---- terms and condition ------
                                          SizedBox(height:15),
                                          Text("Terms & Conditions".tr,style: TextStyle(fontSize: 16, color: AppColors.black2, fontFamily: AppFontStyle.semiBold),),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accum "
                                                "san etiam diam nunc proin. Sit lorem magna sit nisi, viverra crasvar "
                                                "us. Nec vitae ac sit tristique. Lectus in augue aliquam neque luctus "
                                                "nunc, duis urna tellus. Sit lorem magna sit nisi.".tr,
                                              style: TextStyle(fontSize: 11, color: AppColors.textGrey11, fontFamily: AppFontStyle.semiBold),),
                                          ),
                                          ///--- rating / invite / get tickets  button view ------
                                          SizedBox(height:15),
                                          Row(
                                            children: [
                                              ///--- rating ----
                                              GestureDetector(
                                                onTap: (){

                                                },
                                                child: Center(
                                                  child: Container(
                                                    height: height * 0.055,
                                                    width: width * 0.12,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: AppColors.black3,
                                                    ),
                                                    child: Center(child: Icon(Icons.star,size: 20,color: AppColors.yellow,)),
                                                  ),
                                                ),
                                              ),
                                              ///------ invite ----

                                              GestureDetector(
                                                onTap: (){

                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(left: controller.isArabic==true?0:10,right: controller.isArabic==true?10:0),
                                                  height: height * 0.055,
                                                  width: width * 0.32,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: AppColors.black3,
                                                  ),
                                                  child:  Center(child: Text("Invite".tr,
                                                    style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
                                                ),
                                              ),
                                              ///----- get tickets ----
                                              GestureDetector(
                                                onTap: (){
                                                  Get.to(TicketsTypeScreen());
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(right: controller.isArabic==true?10:0,left: controller.isArabic==true?0:10,),
                                                  height: height * 0.055,
                                                  width: width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: AppColors.primary,
                                                  ),
                                                  child:  Center(child: Text("Get Tickets".tr,
                                                    style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.semiBold),),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          controller.isArabic==true?SizedBox(height:15):Container(),
                                        ],
                                      ),

                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }


)
          ],
        ),
      ),
    );
  }

}