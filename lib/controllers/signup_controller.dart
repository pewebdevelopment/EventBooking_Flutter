import 'package:event/screens/login_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/demo/category.dart';
import '../screens/onboarding2_screen.dart';
import '../screens/signup_screen.dart';

class SignUpController extends GetxController{

  bool passWord = true;
  bool isChecked=false;

  final signupKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  passwordEyeClick(){
    passWord = !passWord;
    update(['signup']);
  }

  isChcek(bool val){
    isChecked = val;
    update(['signup']);
  }

  signUpMethod() async {

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool seen = (prefs.getBool('screen') ?? false);

    // if(signupKey.currentState!.validate()){
    //   Get.to(BottomNavigationScreen());
    //   update(['login']);
    // }else{
    //   // Get.to(OnBoardingScreens());
    //   // update(['login']);
    // }
    // update(['login']);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('screen') ?? false);

    if(seen){
      if(signupKey.currentState!.validate()){
        Get.to(categoryPage());
        // Get.to(BottomNavigationScreen());
        update(['signup']);
      }else{
        // Get.back();
        update(['signup']);
      }

    }else{
      // Get.back();
      // Get.to(OnBoardingScreens());
      update(['signup']);
    }
    update(['signup']);

  }
  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update(['login']);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lan();
  }


}