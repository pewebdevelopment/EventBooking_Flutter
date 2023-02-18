import 'package:event/controllers/home_controller/homecontroller.dart';
import 'package:event/screens/testing_screen.dart';
import 'package:event/screens/ticket_screen.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/common_imports.dart';
import 'comments_screen.dart';
import 'detail_page_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,


        title: Container(
          // margin: EdgeInsets.only(right:  90),
          child: Text(
            'home'.tr,
            style: AppFontStyle.appBarTitle,
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Fluttertoast.showToast(
                  msg: "Search",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  fontSize: 16.0
              );
            },
            child: CircularShadow(
              child: SvgPicture.asset(
                AppImages.search,
                height: 16,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Add List",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  fontSize: 16.0
              );
              // Get.to(() => TestingScreen());
            },
            child: SvgPicture.asset(
              AppImages.addIcon,
              height: 33,
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
            height: 70,
            child:
              GetBuilder<HomeController>(
              init: HomeController(),
              id: "header",
              builder: (controller) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.headerList.length,
                  itemBuilder: (context, index) {
                    double imageHeightWidth = 70;
                    return Padding(
                      padding: EdgeInsets.only(right: 8, left: index == 0 ? 12 : 0),
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
                          height: imageHeightWidth,
                          width: imageHeightWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primary, width: 2)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              controller.headerList[index].toString(),
                            ),
                            // child: CachedNetworkImage(
                            //   height: imageHeightWidth,
                            //   width: imageHeightWidth,
                            //   fit: BoxFit.cover,
                            //   imageUrl: controller.headerList[index],
                            //   placeholder: (context, url) => Container(
                            //     height: imageHeightWidth,
                            //     width: imageHeightWidth,
                            //     color: AppColors.grey.shade400,
                            //   ),
                            //   errorWidget: (context, url, error) =>
                            //       const Icon(Icons.error),
                            // ),
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
            height: 10,
          ),
          GetBuilder<HomeController>(
              init: HomeController(),
              id: "list",
              builder: (controller) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.subList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(DetailPageScreen());
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      margin:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  controller.subList[index]['image'].toString(),
                                  height: 50,
                                ),
                                // child: CachedNetworkImage(
                                //   height: 50,
                                //   width: 50,
                                //   fit: BoxFit.cover,
                                //   imageUrl: "https://picsum.photos/200/300",
                                //   placeholder: (context, url) => Container(
                                //     height: 50,
                                //     width: 50,
                                //     color: AppColors.grey.shade400,
                                //   ),
                                //   errorWidget: (context, url, error) =>
                                //       const Icon(Icons.error),
                                // ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.subList[index]['name'].toString(),
                                      style: AppFontStyle.greySemiBold14,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      controller.subList[index]['min'],
                                      style: AppFontStyle.greyLight12,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Fluttertoast.showToast(
                                      msg: "Follow".tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColors.primary,
                                      textColor: AppColors.white,
                                      fontSize: 16.0
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primary, width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child:  Text(
                                    'Follow'.tr,
                                    style: AppFontStyle.primarySemiBold14,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              controller.subList[index]['subImage'].toString(),
                              // height: 50,
                            ),
                            // child: CachedNetworkImage(
                            //   width: double.infinity,
                            //   fit: BoxFit.cover,
                            //   imageUrl: "https://picsum.photos/200/300",
                            //   placeholder: (context, url) => Container(
                            //     height: 200,
                            //     width: double.infinity,
                            //     color: AppColors.grey.shade400,
                            //   ),
                            //   errorWidget: (context, url, error) =>
                            //       Container(
                            //           height: 200,
                            //           width: double.infinity,
                            //           color: AppColors.grey.shade400,
                            //           child: const Icon(Icons.error)),
                            // ),
                            // Image.network(
                            //   'https://picsum.photos/200/200',
                            //   fit: BoxFit.cover,
                            //   width: double.infinity,
                            // )
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.favIcon(index);
                                },
                                child: CircularShadow(
                                  child: SvgPicture.asset(
                                    controller.subList[index]['fav'] == true ? AppImages.heart : AppImages.heartUnFill,
                                    height: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(CommentsScreen());
                                },
                                child: CircularShadow(
                                  child: SvgPicture.asset(
                                    AppImages.message,
                                    height: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: ()async{
                                  await FlutterShare.share(
                                      title: controller.subList[index]['name'].toString(),
                                      text: controller.subList[index]['name'].toString(),
                                  );
                                },
                                child: CircularShadow(
                                  child: SvgPicture.asset(
                                    AppImages.share,
                                    height: 16,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  _buildPopupMenuItem('Unfollow'.tr, AppImages.unfollowIcon,0),
                                  _buildPopupMenuItem('Hide'.tr, AppImages.hideIcon,1),
                                  _buildPopupMenuItem('Report '.tr, AppImages.reportIcon,2),
                                ],
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, String imageData, int i) {
    return PopupMenuItem(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(width: 20,child: SvgPicture.asset(imageData,width: 20,)),
          const SizedBox(width: 15,),
          Text(title,style: i == 2 ? AppFontStyle.redRegular14 : AppFontStyle.blackRegular14,),
        ],
      ),
    );
  }
}
