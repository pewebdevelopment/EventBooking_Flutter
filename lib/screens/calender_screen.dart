import 'package:event/utils/common_imports.dart';
import 'package:event/utils/date_utils.dart' as date_util;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'eventCalender'.tr,
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
          GestureDetector(
            onTap: () {
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
      body: GetBuilder<CalenderController>(
          init: CalenderController(),
        builder: (mainController) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              GetBuilder<CalenderController>(
                  id: 'month',
                  builder: (controller) {
                    // print("controller.currentLastMonthList ${controller.currentLastMonthList}");
                    return SizedBox(
                      height: 40,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.monthList.length,
                          itemBuilder: (context, index) {
                            var data = controller.monthList[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 16 : 10.0, right: 10),
                              child: index == 0
                                  ? SvgPicture.asset(
                                      AppImages.calenderFill,
                                      height: 26,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        if (index != 0) {
                                          controller.onChangeSelectedMonth(data);
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          data.name ?? ''.tr,
                                          style: data.isSelected!
                                              ? AppFontStyle.textGrey4SemiBold16
                                              : AppFontStyle.textGrey3SemiBold16,
                                        ),
                                      ),
                                    ),
                            );
                          }),
                    );
                  }),
              const Divider(
                color: Color(0xffD1D1D1),
              ),
              GetBuilder<CalenderController>(
                  id: 'days',
                  builder: (daysController) {
                    return Container(

                      height: 100,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: daysController.currentMonthList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              daysController.onChangeDays(
                                  daysController.currentMonthList[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              alignment: Alignment.center,
                              margin:daysController.isArabic==true? EdgeInsets.only(
                                  left: index ==
                                      daysController.currentMonthList.length - 1
                                      ? 16
                                      : 0,
                                  top: 10,
                                  right: index == 0 ? 16 : 10,
                                  bottom: 10):EdgeInsets.only(
                                  right: index ==
                                          daysController.currentMonthList.length - 1
                                      ? 16
                                      : 0,
                                  top: 10,
                                  left: index == 0 ? 16 : 10,
                                  bottom: 10),
                              height: 60,
                              decoration: BoxDecoration(
                                  color: daysController.selectedDay ==
                                          daysController.currentMonthList[index]
                                      ? AppColors.primary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5.0,
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${daysController.currentMonthList[index].day}'.tr,
                                    // '15',
                                    style: daysController.selectedDay ==
                                            daysController.currentMonthList[index]
                                        ? AppFontStyle.whiteSemiBold16
                                        : AppFontStyle.textGrey5SemiBold16,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 1,
                                    width: 35,
                                    color: daysController.selectedDay ==
                                            daysController.currentMonthList[index]
                                        ? AppColors.white
                                        : const Color(0xffA1A1A1),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    DateFormat('EEE').format(
                                        daysController.currentMonthList[index]).tr,
                                    style: daysController.selectedDay ==
                                            daysController.currentMonthList[index]
                                        ? AppFontStyle.whiteSemiBold16
                                        : AppFontStyle.textGrey5SemiBold16,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
              EventHorizontalList(
                title: 'Events for you'.tr,
                onRightArrowClick: (){
                  Get.to(()=>EventForYouScreen());
                },
                list:  [EventCardModel(title: 'Stand Up Comedy'.tr, image: '${AppImages.imagePath}mic.png')],
              ),
              EventHorizontalList(
                title: 'Your Events'.tr,
                onRightArrowClick: (){
                  // Get.to(()=>const EventForYouScreen());
                },
                // list:  ['${AppImages.imagePath}mic.png'],
                list:  [EventCardModel(title: 'Singing Event'.tr, image: '${AppImages.imagePath}sing.png'),
                  EventCardModel(title: 'Stand Up Comedy'.tr, image: '${AppImages.imagePath}party.png')],
              ),
              EventHorizontalList(
                title: 'Follower’s Events'.tr,
                onRightArrowClick: (){
                  // Get.to(()=>const EventForYouScreen());
                },
                // list:  ['${AppImages.imagePath}mic.png'],
                list:  [EventCardModel(title: 'Dancing'.tr, image: '${AppImages.imagePath}dance.png')],
              ),
            ],
          );
        }
      ),
    );
  }
}

class EventHorizontalList extends StatelessWidget {
   EventHorizontalList({
    Key? key, required this.title, required this.onRightArrowClick, required this.list,
  }) : super(key: key);

  final String title;
  final VoidCallback onRightArrowClick;
  final List<EventCardModel> list;
CalenderController calenderController=Get.put(CalenderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      // color: Colors.green,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: AppFontStyle.blackSemiBold18,
                ),
                GestureDetector(
                  onTap: onRightArrowClick,
                  child: CircularShadow(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        calenderController.isArabic==true?'${AppImages.iconPath}back.svg':AppImages.rightArrow,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return EventCard(
                  backgroundImage: list[index].image,
                  title: list[index].title,
                  date: '15 Jun, 2022'.tr,
                  address: 'Surat'.tr,
                  rating: 3,
                  interestedPeople: 300,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

