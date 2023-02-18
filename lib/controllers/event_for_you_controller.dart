import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventForYouController extends GetxController{
  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lan();
    update();
  }

}