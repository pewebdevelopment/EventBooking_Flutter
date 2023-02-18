import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPageController extends GetxController{
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