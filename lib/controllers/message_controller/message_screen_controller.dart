import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_images.dart';
import '../../utils/common_imports.dart';

class MessageScreenController extends GetxController {

  List<MessageModel> messageList = [
    MessageModel(
      id: 0,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm1}',
      time: '03:26AM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 0,
    ),
    MessageModel(
      id: 1,
      personName: 'Franciso Gibbs'.tr,
      image: '${AppImages.comm2}',
      time: '12:26PM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 5,
    ),
    MessageModel(
      id: 2,
      personName: 'Henry Harvey'.tr,
      image: '${AppImages.comm4}',
      time: '26:06PM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 3,
    ),
    MessageModel(
      id: 3,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm6}',
      time: '01:23PM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 1,
    ),
    MessageModel(
      id: 4,
      personName: 'Vance Corwin'.tr,
      image: '${AppImages.comm3}',
      time: '11:20PM'.tr,
      message: "Yes i agree with your opnion...".tr,
      totalMessage: 1,
    ),
    MessageModel(
      id: 5,
      personName: 'Henry Harvey'.tr,
      image: '${AppImages.comm4}',
      time: '05:45AM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 25,
    ),
    MessageModel(
      id: 0,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm1}',
      time: '03:26AM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 0,
    ),
    MessageModel(
      id: 3,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm6}',
      time: '01:23PM'.tr,
      message: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      totalMessage: 1,
    ),
  ];


  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update(['detail']);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lan();
  }
}