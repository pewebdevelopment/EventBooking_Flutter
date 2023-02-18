import 'package:event/controllers/explore_controller/explore_controller.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({Key? key}) : super(key: key);

  ExploreController exploreController =Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Explore'.tr,
          style: AppFontStyle.appBarTitle,
        ),
        actions: [
          CircularShadow(
            child: SvgPicture.asset(
              AppImages.search,
              height: 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircularShadow(
            child: SvgPicture.asset(
              AppImages.shareExplore,
              height: 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
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
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 200,
            child:
            GetBuilder<ExploreController>(
              init: ExploreController(),
              id: "header",
              builder: (controller) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.exploreList.length,
                  itemBuilder: (context, index) {
                    print(controller.exploreList[index]['image']);
                    // double imageHeightWidth = 150;
                    return Padding(
                      padding: controller.isArabic==true?EdgeInsets.only(right: 9,):EdgeInsets.only(right: 8, left: index == 0 ? 12 : 0 ),
                      child: InkWell(
                        onTap: (){
                          Fluttertoast.showToast(
                              msg: "Header ${index + 1}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.white,
                              fontSize: 16.0
                          );
                        },
                        child: Container(
                          width: 150,
                          child: Stack(
                            children: [
                              Container(
                                width: 135,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                  image: DecorationImage(
                                    image: AssetImage(
                                        controller.exploreList[index]['image'].toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                ),
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient:const LinearGradient(
                                      colors: [Colors.black12, Colors.transparent, Colors.transparent, Colors.black54],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0, 0, 0.8, 1],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.exploreList[index]['name'].toString(),
                                          style: AppFontStyle.whiteSemiBold14,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          controller.exploreList[index]['date'],
                                          style: AppFontStyle.primaryLight12,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                              controller.isArabic==true? Positioned(
                                top: 25,
                                right: 77,

                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.pink,
                                  ),
                                  child: Center(
                                    child: Text(
                                        controller.exploreList[index]['label'] == "Free" ? controller.exploreList[index]['label'].toString() : "\$" + controller.exploreList[index]['label'].toString(),
                                      style: AppFontStyle.whiteSemiBold14,
                                    ),
                                  ),
                                ),
                              ): Positioned(
                          top: 25,

                          left: 77,
                          child: Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.pink,
                            ),
                            child: Center(
                              child: Text(
                                controller.exploreList[index]['label'] == "Free" ? controller.exploreList[index]['label'].toString() : "\$" + controller.exploreList[index]['label'].toString(),
                                style: AppFontStyle.whiteSemiBold14,
                              ),
                            ),
                          ),
                        ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories'.tr,
              style: AppFontStyle.titleText,
            ),
          ),

          SizedBox(
            height: 140,
            child: GetBuilder<ExploreController>(
              init: ExploreController(),
              id: "category",
              builder: (controller) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5, left: index == 0 ? 12 : 0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Fluttertoast.showToast(
                                  msg: controller.categoryList[index]['name'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: AppColors.primary,
                                  textColor: AppColors.white,
                                  fontSize: 16.0
                              );
                            },
                            child: Container(
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.2),
                                  shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: SvgPicture.asset(
                                  controller.categoryList[index]['image'].toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              controller.categoryList[index]['name'].toString(),
                              style: AppFontStyle.blackSemiBold12,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nearby'.tr,
              style: AppFontStyle.titleText,
            ),
          ),
          GetBuilder<ExploreController>(
              init: ExploreController(),
              id: "nearby",
              builder: (controller) {
              return Container(
                // color: Colors.black,
                // padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.nearByList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15),
                        // color: Colors.red,
                        // padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 100,

                              decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(controller.nearByList[index]['image']),
                                ),
                              ),
                            ),

                           Expanded(
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: controller.isArabic==true?EdgeInsets.only(right: 10):EdgeInsets.only(left: 10),
                                     height: 100,
                                     // color: Colors.red,
                                     width: MediaQuery.of(context).size.width * 0.4,
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         Text(
                                           controller.nearByList[index]['name'],
                                           style: AppFontStyle.titleTextBold,
                                           maxLines: 1,
                                         ),
                                         Text(
                                           controller.nearByList[index]['date'],
                                           style: AppFontStyle.textGrey6SemiBold14,
                                         ),
                                         Text(
                                           controller.nearByList[index]['state'],
                                           style: AppFontStyle.textGrey6SemiBold12,
                                         ),
                                         RatingBar.builder(
                                           itemSize: 15,
                                           initialRating: 5,
                                           minRating: 1,
                                           direction: Axis.horizontal,
                                           unratedColor: AppColors.white,
                                           allowHalfRating: true,
                                           itemCount: 5,
                                           itemPadding: const EdgeInsets.symmetric(
                                               horizontal: 2.0),
                                           itemBuilder: (context, _) => const Icon(
                                             Icons.star,
                                             color: Colors.amber,
                                           ),
                                           onRatingUpdate: (rating) {
                                             // print(rating);
                                           },
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 // SizedBox(width: 5,),
                                 Expanded(
                                   child: Container(
                                     height: 100,
                                     // color: Colors.green,
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: CircularShadow(
                                             child: SvgPicture.asset(
                                               AppImages.fillBookmark,
                                               height: 16,
                                             ),
                                           ),
                                         ),
                                         Text(
                                           controller.nearByList[index]['interested'] + "+ interested".tr,
                                           style: AppFontStyle.textGrey6SemiBold12,
                                         ),
                                         // Text(
                                         //   controller.nearByList[index]['state'],
                                         //   style: AppFontStyle.textGrey6SemiBold12,
                                         // ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           )

                          ],
                        ),
                      );
                    },
                ),
              );
            }
          ),

        ],
      ),
    );
  }
}
