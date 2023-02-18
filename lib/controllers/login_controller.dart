import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/demo/category.dart';
import '../screens/onboarding2_screen.dart';
import '../screens/signup_screen.dart';

class LoginController extends GetxController{

  bool passWord = true;
  bool isChecked=false;

  final loginKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // bool isEmail(String input) => EmailValidator.validate(input);
  // bool isPhone(String input) =>
  //     RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
  //         .hasMatch(input);

  passwordEyeClick(){
    passWord = !passWord;
    update(['login']);
  }

  isChcek(bool val){
    isChecked = val;
    update(['login']);
  }

  loginMethod() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool seen = (prefs.getBool('screen') ?? false);
    //
    //
    //   if(loginKey.currentState!.validate()){
    //     Get.to(BottomNavigationScreen());
    //     update(['login']);
    //   }else{
    //     // Get.to(OnBoardingScreens());
    //     // update(['login']);
    //   }


    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('screen') ?? false);
    print('seen--${seen}');

    if(seen){
      if(loginKey.currentState!.validate()){
        Get.to(categoryPage());
        update(['login']);
      }else{
        // Get.back();
        update(['login']);
      }

    }else{
      // Get.back();
      // Get.to(OnBoardingScreens());
      update(['login']);
    }
    update(['login']);

}
  signUpMethod() async {





          // Get.to(SignUpScreen());
          update(['login']);


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