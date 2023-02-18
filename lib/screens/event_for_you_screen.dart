import 'package:event/screens/payment_method_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../controllers/detailpageController.dart';
import '../controllers/event_for_you_controller.dart';

class EventForYouScreen extends StatelessWidget {
  EventForYouScreen({Key? key}) : super(key: key);

  List<EventCardModel> list = [
    EventCardModel(title: 'Car exhibition'.tr,image: '${AppImages.imagePath}car.png'),
    EventCardModel(title: 'Music Party'.tr,image: '${AppImages.imagePath}list3.png'),
    EventCardModel(title: 'Christina Perri Live In Concert'.tr,image: '${AppImages.imagePath}musicParty.png'),
  ];
  EventForYouController eventForYouController =Get.put(EventForYouController());

  Widget _individualTab(String imagePath,BuildContext context) {
    return Container(
      height: 50 + MediaQuery
          .of(context)
          .padding
          .bottom,
      padding: EdgeInsets.all(0),
      width: double.infinity,
      decoration:BoxDecoration(border:Border(right:BorderSide(color: AppColors.red, width: 1, style: BorderStyle.solid))),
      child: Tab(
        icon: ImageIcon(AssetImage(imagePath)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            indicatorColor: AppColors.primary,padding: EdgeInsets.only(left: 75,right: 75),
            tabs: [
              Tab(
                 icon: Text(
                'Upcoming'.tr,
                // style: AppFontStyle.blackSemiBold16,
                style: AppFontStyle.blackBold16,
              )),
              // Container(height: 40,width: 3,color: Color(0xFFA6A6A8)),
              // Container(height: 10,width: 3,color: Color(0xFFA6A6A8)),
              Tab(
                  icon: Text(
                  'Past'.tr,
                // style: AppFontStyle.blackSemiBold16,
                style: AppFontStyle.blackBold16,
              )),
            ],
          ),
          leading: eventForYouController.isArabic == true ? GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: CircularShadow(
                child: SvgPicture.asset(
                  AppImages.rightArrow,
                  height: 16,
                )
              ),
            ),
          ) : GestureDetector(
          onTap: (){
       Get.back();
    },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: CircularShadow(
          child: SvgPicture.asset(
            '${AppImages.iconPath}back.svg',
          height: 16,
        ),
      ),
    ),
    ),
          actions: [
            CircularShadow(
              child: SvgPicture.asset(
                 '${AppImages.iconPath}saved.svg',
                  height: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircularShadow(
              child: SvgPicture.asset(
                '${AppImages.iconPath}qr.svg',
                height: 16,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return EventCardFullWidth(
                    date: '20,Dec 2022'.tr,
                    backgroundImage: list[index].image,
                    title: list[index].title,
                    address: 'Surat'.tr,
                    interestedPeople: 300,
                    rating: 3,
                  );
                }),
            Text(''),
          ],
        ),
      ),
    );
  }
}

class EventCardFullWidth extends StatelessWidget {
  const EventCardFullWidth({
    Key? key,
    required this.backgroundImage,
    required this.title,
    required this.date,
    required this.address,
    required this.rating,
    required this.interestedPeople,
  }) : super(key: key);

  final String backgroundImage;
  final String title;
  final String date;
  final String address;
  final double rating;
  final double interestedPeople;
  // DetailPageController detailPageController =Get.put(DetailPageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Get.to(()=>const PaymentMethodScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date,
              style: AppFontStyle.textGrey6SemiBold12,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      backgroundImage,
                      fit: BoxFit.cover,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.6),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    title,
                                    style: AppFontStyle.whiteBold14,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    address,
                                    style: AppFontStyle.whiteRegular12,
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RatingBar.builder(
                                  itemSize: 14,
                                  initialRating: rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  unratedColor: AppColors.white,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${interestedPeople}'+'+ Interested'.tr,
                                  // '$interestedPeople+ Interested',
                                  style: AppFontStyle.whiteRegular10,
                                ),
                              ],
                            )
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
