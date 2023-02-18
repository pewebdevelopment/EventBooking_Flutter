import 'package:event/screens/demo/animateCategory.dart';
import 'package:event/screens/demo/bubblescreen.dart';
import 'package:event/screens/demo/category.dart';
import 'package:event/screens/live_screen.dart';
import 'package:event/screens/login_screen.dart';
import 'package:event/screens/onboarding2_screen.dart';
import 'package:event/screens/splash_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isArabic= prefs.getBool('isArabic') ?? false;
  runApp(MyApp(isArabic));
}

class MyApp extends StatelessWidget {
  final bool isArabic;

  MyApp(this.isArabic);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppStrings(),
      debugShowCheckedModeBanner: false,
      locale: isArabic ? Locale('ar','AE') : Locale('en','US'),      // fallbackLocale: const Locale('en', 'US'),
      title: 'appName'.tr,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        // fontFamily: 'Gotham Rounded'
      ),
      // home: LoginScreen(),
      // home: OnBoardingScreens(),
      // home: SpringBasedAnimationExample(),
      // home: categoryPage(),
      home: SplashScreen(),
    );
  }
}
