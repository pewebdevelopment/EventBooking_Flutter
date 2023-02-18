
import 'package:event/controllers/category_controller.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_font_style.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {


  // CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: GetBuilder<CategoryController>(
        init: CategoryController(),
    id:'category',
    builder: (controller) {


          return  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 90),
                width:290,
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Choose Categories that represent what you want to see '.tr,

                  textAlign: TextAlign.center,

                  style:  TextStyle(
                      fontSize: 15,
                      color: AppColors.textGrey25,
                      fontFamily: AppFontStyle.semiBold
                  ),
                ),
              ),
              // Container(
              //     margin: EdgeInsets.only(left: 15,top: 50,right: 15),
              //     height: 90,
              //     width: 240,
              //
              //
              //     child: Center(child: Text( "Choose Categories that represent  \n what you want to see ",style: TextStyle(fontSize: 15),))),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 15,right: 15,top: 40),
                    // height: double.infinity,
                    child: GridView.builder(gridDelegate: SliverQuiltedGridDelegate(

                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 6,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        // QuiltedGridTile(1, 2),
                        QuiltedGridTile(1, 1),

                        QuiltedGridTile(1, 1),
                        // QuiltedGridTile(1, 2),



                        // QuiltedGridTile(2, 2),
                        // QuiltedGridTile(1, 1),
                        // QuiltedGridTile(1, 1),
                        // QuiltedGridTile(1, 2),
                      ],
                    ),
                      itemCount: controller.categoryList.length,
                      itemBuilder:



                          (context, index) => Container(


                        child: GestureDetector(
                          onTap: (){

                            controller.select(index);
                            // setState(() {
                            //   indexSelect=index;
                            // });
                          },
                          child: Container(

                              height: 60,
                              // width: 60,
                              decoration: BoxDecoration(
                                  color: controller. isRecommended.contains(index)?AppColors.primary:AppColors.textGrey29,
                                  ///--- below code for single selection
                                  // color: controller.indexSelect==index?AppColors.primary:AppColors.textGrey29,
                                  shape: BoxShape.circle
                              ),
                              child: Container(
                                  margin: EdgeInsets.only(top: index % 3 == 0?30:15),
                                  alignment: Alignment.center,


                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(controller.categoryList[index]['image'],scale: index%3 == 0?2:3.8,
                                        color:controller. isRecommended.contains(index)?AppColors.white:AppColors.textGrey28,
                                        ///--- below code for single silection --
                                        // color:controller. indexSelect==index?AppColors.white:AppColors.textGrey28,

                                      ),
                                      SizedBox(height: 3,),

                                      // Text( 'index${index}',   style: TextStyle(fontSize: 15, color: AppColors.textGrey23, fontFamily: AppFontStyle.semiBold)),
                                      Container(

                                          margin: EdgeInsets.only(top: index % 3 == 0?8:0),
                                          child: Text( controller.categoryList[index]['name'],
                                              style: TextStyle(fontSize: index % 3 == 0?15:11,
                                                  color:controller. isRecommended.contains(index)?AppColors.white:AppColors.textGrey28,
                                                  ///--- below code for single silection --
                                                  // color: controller.indexSelect==index?AppColors.white:AppColors.textGrey28,

                                                  fontFamily: AppFontStyle.semiBold))),
                                    ],
                                  ))
                          ),
                        ),
                      ),

                    )


                  // GridView.custom(
                  //
                  //   gridDelegate: SliverQuiltedGridDelegate(
                  //
                  //     crossAxisCount: 4,
                  //     mainAxisSpacing: 4,
                  //     crossAxisSpacing: 6,
                  //     repeatPattern: QuiltedGridRepeatPattern.inverted,
                  //     pattern: [
                  //      QuiltedGridTile(2, 2),
                  //      // QuiltedGridTile(1, 2),
                  //       QuiltedGridTile(1, 1),
                  //       QuiltedGridTile(1, 1),
                  //       // QuiltedGridTile(1, 2),
                  //
                  //
                  //
                  //       // QuiltedGridTile(2, 2),
                  //       // QuiltedGridTile(1, 1),
                  //       // QuiltedGridTile(1, 1),
                  //       // QuiltedGridTile(1, 2),
                  //     ],
                  //   ),
                  //   childrenDelegate: SliverChildBuilderDelegate(
                  //
                  //
                  //         (context, index) => Container(
                  //
                  //
                  //           child: GestureDetector(
                  //             onTap: (){
                  //               setState(() {
                  //                 indexSelect=index;
                  //               });
                  //             },
                  //             child: Container(
                  //
                  //               height: 60,
                  //               // width: 60,
                  //               decoration: BoxDecoration(
                  //                   color: indexSelect==index?Colors.pink:Colors.green,
                  //                   shape: BoxShape.circle
                  //               ),
                  //               child: Container(
                  //                 margin: EdgeInsets.only(top: 15),
                  //                   alignment: Alignment.center,
                  //
                  //
                  //                   child: Column(
                  //                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Image.asset('assets/icons/category/ball.png',scale: 3.8,),
                  //                       SizedBox(height: 3,),
                  //
                  //                       Text( "Sports",),
                  //                     ],
                  //                   ))
                  //             ),
                  //           ),
                  //         ),
                  //
                  //   ),
                  // ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.offAll(BottomNavigationScreen());
                  // Get.to(BottomNavigationScreen());
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 15),


                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                    // color: AppColors.white,
                  ),
                  child:  Center(child: Text("Continue".tr,
                    style: TextStyle(fontSize: 15, color: AppColors.white, fontFamily: AppFontStyle.bold),),),
                ),
              ),
              SizedBox(height: 15,)
            ],
          );
    })



      // MasonryGridView.count(
      //   crossAxisCount: 4,
      //   mainAxisSpacing: 4,
      //   crossAxisSpacing: 4,
      //
      //   itemBuilder: (context, index) {
      //     return Container(
      //       margin: EdgeInsets.only(left: 15,right: 15,top: 50),
      //
      //       child: GestureDetector(
      //         onTap: (){
      //           setState(() {
      //             indexSelect=index;
      //           });
      //         },
      //         child: Container(
      //
      //           height: 60,
      //           width: 60,
      //           decoration: BoxDecoration(
      //               color: indexSelect==index?Colors.pink:Colors.green,
      //               shape: BoxShape.circle
      //           ),
      //           // child: Text( "index ${index}",)
      //         ),
      //     ));
      //
      //   },
      // ),
      ///---------


      // GridView.custom(
      //   gridDelegate: SliverQuiltedGridDelegate(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 0,
      //     crossAxisSpacing: 0,
      //
      //     // crossAxisCount: 4,
      //     // mainAxisSpacing: 4,
      //     // crossAxisSpacing: 4,
      //     repeatPattern: QuiltedGridRepeatPattern.inverted,
      //     pattern: [
      //       QuiltedGridTile(1, 2),
      //       QuiltedGridTile(1, 1),
      //       QuiltedGridTile(1, 1),
      //       QuiltedGridTile(1, 2),
      //
      //       QuiltedGridTile(1, 1),
      //       QuiltedGridTile(2, 1),
      //       QuiltedGridTile(2, 1),
      //
      //
      //     ],
      //   ),
      //   childrenDelegate: SliverChildBuilderDelegate(
      //         (context, index) => Container(
      //           margin: EdgeInsets.only(left: 15,right: 15,top: 50),
      //
      //           child: GestureDetector(
      //             onTap: (){
      //               setState(() {
      //                 indexSelect=index;
      //               });
      //             },
      //             child: Container(
      //
      //               height: 60,
      //               width: 60,
      //               decoration: BoxDecoration(
      //                   color: indexSelect==index?Colors.pink:Colors.green,
      //                   shape: BoxShape.circle
      //               ),
      //               // child: Text( "index ${index}",)
      //             ),
      //           ),
      //         ),
      //   ),
      // ),

///---
      // GridView.custom(
      //   gridDelegate: SliverWovenGridDelegate.count(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 8,
      //     crossAxisSpacing: 8,
      //     pattern: [
      //       WovenGridTile(1),
      //
      //       WovenGridTile(
      //         5 / 7,
      //         crossAxisRatio: 0.6,
      //         alignment: AlignmentDirectional.centerEnd,
      //       ),
      //     ],
      //   ),
      //   childrenDelegate: SliverChildBuilderDelegate(
      //         (context, index) => Container(
      //           margin: EdgeInsets.only(left: 15,right: 15,top: 50),
      //
      //           child: GestureDetector(
      //             onTap: (){
      //               setState(() {
      //                 indexSelect=index;
      //               });
      //             },
      //             child: Container(
      //
      //               height: 60,
      //               width: 60,
      //               decoration: BoxDecoration(
      //                   color: indexSelect==index?Colors.pink:Colors.green,
      //                   shape: BoxShape.circle
      //               ),
      //               // child: Text( "index ${index}",)
      //             ),
      //           ),
      //         )
      //   ),
      // ),


///---
//       GridView.custom(
//         gridDelegate: SliverStairedGridDelegate(
//           crossAxisSpacing: 0,
//           mainAxisSpacing: 0,
//           // crossAxisSpacing: 48,
//           // mainAxisSpacing: 24,
//           startCrossAxisDirectionReversed: true,
//           pattern: [
//
//
//
//
//             StairedGridTile(0.5, 1),
//             StairedGridTile(0.5, 3 / 4),
//             StairedGridTile(1.0, 10 / 4),
//           ],
//         ),
//         childrenDelegate: SliverChildBuilderDelegate(
//                 (context, index) => Container(
//               margin: EdgeInsets.only(left: 15,right: 15,top: 50),
//
//               child: GestureDetector(
// onTap: (){
//   setState(() {
//     indexSelect=index;
//   });
// },
//                 child: Container(
//
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       color: indexSelect==index?Colors.pink:Colors.green,
//                       shape: BoxShape.circle
//                   ),
//                   // child: Text( "index ${index}",)
//                 ),
//               ),
//             )
//         ),
//       ),
    );
  }
}


// class categoryPage extends StatelessWidget {
//    categoryPage({
//     Key? key,
//   }) : super(key: key);
//   int indexSelect;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: GridView.custom(
//         gridDelegate: SliverStairedGridDelegate(
//           crossAxisSpacing: 0,
//           mainAxisSpacing: 0,
//           // crossAxisSpacing: 48,
//           // mainAxisSpacing: 24,
//           startCrossAxisDirectionReversed: true,
//           pattern: [
//             StairedGridTile(0.5, 1),
//
//             StairedGridTile(0.5, 3 / 4),
//
//             StairedGridTile(1.0, 8 / 4),
//             StairedGridTile(0.5, 1),
//             StairedGridTile(0.5, 3 / 4),
//             StairedGridTile(1.0, 10 / 4),
//           ],
//         ),
//         childrenDelegate: SliverChildBuilderDelegate(
//               (context, index) => Container(
//                 margin: EdgeInsets.only(left: 15,right: 15,top: 50),
//
//                 child: GestureDetector(
//
//                   child: Container(
//
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           shape: BoxShape.circle
//                       ),
//                       // child: Text( "index ${index}",)
//                       ),
//                 ),
//               )
//         ),
//       ),
//     );
//   }
// }
//
// class MenuEntry extends StatelessWidget {
//   const MenuEntry({
//     Key? key,
//     required this.title,
//     required this.imageName,
//     required this.destination,
//   }) : super(key: key);
//
//   final String title;
//   final Widget destination;
//   final String imageName;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute<void>(
//               builder: (context) => destination,
//             ),
//           );
//         },
//         child: Stack(
//           children: [
//             Image.asset(
//               'assets/$imageName.png',
//               fit: BoxFit.cover,
//             ),
//             Positioned.fill(
//               child: FractionallySizedBox(
//                 heightFactor: 0.25,
//                 alignment: Alignment.bottomCenter,
//                 child: ColoredBox(
//                   color: Colors.black.withOpacity(0.75),
//                   child: Center(
//                     child: Text(
//                       title,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline6!
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }