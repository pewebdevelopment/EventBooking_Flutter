import 'package:event/models/usercard_model.dart';
import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/common_imports.dart';
import '../utils/common_imports.dart';

class PaymentController extends GetxController{

  String number='';
  String name='';
  String date='';
  List<UserCardModel> userCardList = [
    // UserCardModel(cmt: "a", ),

  ];


  bool selectedGoogle = false;
  bool selectedApple = false;
  bool selectedPaypal = false;
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
    selectedApple=true;
    getData();

  }




  google(){
    selectedGoogle=!selectedGoogle;
    selectedApple = false;
    selectedPaypal = false;
    update(['paymentscreen']);
  }


  apple(){
    selectedApple=!selectedApple;
    selectedGoogle = false;
    selectedPaypal = false;
    update(['paymentscreen']);
  }


  paypal(){
    selectedPaypal=!selectedPaypal;
    selectedGoogle = false;
    selectedApple = false;
    update(['paymentscreen']);
  }

  getData() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    number=  sp.getString('cNumber')!;
    name=sp.getString('cName')!;
    date=sp.getString('cDate')!;

    print('name==${number}');
    print('name==${name}');
    print('name==${date}');
    update(['paymentscreen']);
  }

  Future<void> addUserToList(cname,cnumber,cdate) async {


    userCardList.add(UserCardModel(name: cname,cardNumber: cnumber,expiredDate:cdate ));

    update();
  }

  void updateLanguageInformation() {
    // for (var i = 0; i <= userList.length; i++) { // ** don't need nested for loop here **
    for (var user in userCardList) {
      // print("Name: " + user.cmt );
    }
    // }
  }


  // List<LinearGradient> colors = [
  //   LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     col: [
  //       Color(0xff3A5BF6),
  //       Color(0xff7A55D4),
  //     ],
  //     stops: const <double>[
  //       0.35,
  //       0.8,
  //     ],
  //   ),
  //   LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     col: [
  //       Color(0xff02C0A9),
  //       Color(0xff1189DC),
  //     ],
  //     stops: const <double>[
  //       0.35,
  //       0.8,
  //     ],
  //   ),
  //
  //
  // ];


  // List<Colors> colors = [
  //   Colors(first:     Color(0xff3A5BF6),second: Color(0xff7A55D4), ),
  //   Colors(first:Color(0xff02C0A9),second:Color(0xff1189DC), ),
  //
  //
  //
  // ];


}


// class LinearGradient {
//
//   AlignmentGeometry begin;
//   AlignmentGeometry end;
//   List<Color> col;
//   List<double> stops;
//
//
//
//   LinearGradient({required this.begin,required this.end,required this.col,required this.stops});
// }

// class Colors {
//
//   Color first;
//   Color second;
//
//
//   Colors({required this.first,required this.second,});
// }