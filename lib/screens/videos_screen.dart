import 'dart:ui';

import 'package:event/controllers/explore_controller/explore_controller.dart';
import 'package:event/controllers/videos_controller/videos_controller.dart';
import 'package:event/screens/live_screen.dart';
import 'package:event/screens/video_player_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Videos'.tr,
          style: AppFontStyle.appBarTitle,
        ),
        actions: [
          CircularShadow(
            child: SvgPicture.asset(
              AppImages.videos,
              height: 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircularShadow(
            child: SvgPicture.asset(
              AppImages.search,
              height: 16,
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
            GetBuilder<VideosController>(
              init: VideosController(),
              id: "header",
              builder: (controller) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return VideosLiveList(
                      personName: controller.list[index].personName,
                      image: controller.list[index].image,
                      category: controller.list[index].category,
                      liveTotal: controller.list[index].liveTotal,
                      personImage: controller.list[index].personImage,
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
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Highlights'.tr,
              style: AppFontStyle.titleText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<VideosController>(
              init: VideosController(),
              id: "highlights",
              builder: (controller) {
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: controller.highlitesList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HighlitesList(
                      personName: controller.highlitesList[index].personName,
                      image: controller.highlitesList[index].image,
                      category: controller.highlitesList[index].category,
                      liveTotal: controller.highlitesList[index].liveTotal,
                      personImage: controller.highlitesList[index].personImage,
                      time: controller.highlitesList[index].time,
                    );
                  });
            }
          ),
        ],
      ),
    );
  }
}

class VideosLiveList extends StatelessWidget {
  String personName;
  String category;
  String image;
  String liveTotal;
  String personImage;
  VideosLiveList({Key? key, required this.personName, required this.category, required this.image, required this.liveTotal, required this.personImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(right: 9, left: 8),
      child: InkWell(
        onTap: (){
          Get.to(LiveScreen(liveTotal));
          // Fluttertoast.showToast(
          //     msg: "Header ${index + 1}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: AppColors.primary,
          //     textColor: AppColors.white,
          //     fontSize: 16.0
          // );
        },
        child: Container(
          width: 150,
          child: Stack(
            children: [
              Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          image.toString(),
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.pink,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Live".tr,
                                        style: AppFontStyle.whiteSemiBold12,
                                      ),
                                      const SizedBox(width: 5,),
                                      SvgPicture.asset(
                                        AppImages.circle,
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 27,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.eye,
                                        height: 10,
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(
                                        liveTotal+"K".tr,
                                        style: AppFontStyle.whiteSemiBold10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              category,
                              // style: AppFontStyle.whiteSemiBold14,
                              style: AppFontStyle.whiteBold14,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    personImage,
                                    height: 20,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Text(
                                    personName,
                                    style: AppFontStyle.whiteRegular12,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HighlitesList extends StatelessWidget {
  String personName;
  String category;
  String image;
  String liveTotal;
  String personImage;
  String time;
  HighlitesList({Key? key, required this.personName, required this.category, required this.image, required this.liveTotal, required this.personImage, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> VideoPlayerScreen(image: personImage,personName: personName,videoTotal: liveTotal,));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 27,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.eye,
                                    height: 10,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    liveTotal+"K".tr,
                                    style: AppFontStyle.whiteSemiBold10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white.withOpacity(0.4),
                          image: const DecorationImage(
                            image: AssetImage(
                              AppImages.bg,
                            ),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8,right: 8),
                          child: SvgPicture.asset(
                            AppImages.play,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              category,
                              // style: AppFontStyle.whiteSemiBold14,
                              style: AppFontStyle.whiteBold14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(
                                          personImage,
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(
                                        personName,
                                        style: AppFontStyle.whiteRegular12,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  time,
                                  style: AppFontStyle.whiteRegular10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

