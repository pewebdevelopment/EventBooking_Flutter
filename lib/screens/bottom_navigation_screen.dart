import 'package:event/screens/explore_screen.dart';
import 'package:event/screens/profile_screen.dart';
import 'package:event/screens/videos_screen.dart';
import 'package:event/utils/common_imports.dart';

import 'demo/category.dart';
import 'detail_page_screen.dart';
import 'onboarding2_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  bool isEdit=false;
  BottomNavigationController bottomNavigationController=Get.put(BottomNavigationController());
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CalenderScreen(),
    ExploreScreen(),
    // categoryPage(),
    VideosScreen(),
    // OnBoardingScreens(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(controller.selectedIndex),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 0,
                      blurRadius: 5),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  // selectedLabelStyle: AppFontStyle.primarySemiBold12,
                  selectedLabelStyle: AppFontStyle.primaryBold12,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: AppColors.textGrey2,
                  unselectedLabelStyle: AppFontStyle.grey2SemiBold12,
                  // unselectedLabelStyle: AppFontStyle.grey2SemiBold10,
                  showUnselectedLabels: true,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  enableFeedback: false,
                  backgroundColor: AppColors.white,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppImages.homeActive,
                        height: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppImages.homeUnActive,
                        height: 30,
                      ),
                      label: 'home'.tr,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppImages.calenderActive,
                        height: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppImages.calenderUnActive,
                        height: 30,
                      ),
                      label: 'Calender'.tr,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppImages.exploreActive,
                        height: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppImages.exploreUnActive,
                        height: 30,
                      ),
                      label: 'Explore'.tr,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppImages.videosActive,
                        height: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppImages.videosUnActive,
                        height: 30,
                      ),
                      label: 'Videos'.tr,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppImages.profileActive,
                        height: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppImages.profileUnActive,
                        height: 30,
                      ),
                      label: 'Profile'.tr,
                    ),
                  ],
                  currentIndex: controller.selectedIndex,
                  onTap: controller.onItemTapped,
                ),
              ),
            ),
          );
        });
  }
}
