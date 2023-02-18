import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketsTypeController extends GetxController{
  int index=1;
  bool selectedSilver = false;
  bool selectedGold = false;
  bool selectedPlatinum = false;
 int price=0;

  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update(['ticType']);
  }


  @override
  void onInit() {
    selectedSilver=true;
    price=300;
    lan();
    update(['ticType']);
  }

  silver(){
    selectedSilver=!selectedSilver;
    selectedGold = false;
    selectedPlatinum = false;
    update(['ticType']);
  }


  gold(){
    selectedGold=!selectedGold;
    selectedSilver = false;
    selectedPlatinum = false;
    update(['ticType']);
  }


  platinum(){
    selectedPlatinum=!selectedPlatinum;
    selectedSilver = false;
    selectedGold = false;
    update(['ticType']);
  }


  increment(){
    index++;
    update(['ticType']);
  }


  decrement(){
    index--;
    update(['ticType']);
  }
}