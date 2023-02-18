import 'package:event/screens/edit_profile_screen.dart';
import 'package:event/screens/profile_screen.dart';
import 'package:event/utils/common_imports.dart';

class BottomNavigationController extends GetxController{

  int selectedIndex = 0;


  // sunny kadivar

  void onItemTapped(int index) {
    selectedIndex = index;
      update();
  }
  bool isEdit=false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}