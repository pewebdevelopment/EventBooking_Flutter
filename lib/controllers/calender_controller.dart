import 'package:event/utils/common_imports.dart';
import 'package:event/utils/date_utils.dart' as date_util;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/simple_model.dart';

class CalenderController extends GetxController {
  // List<SimpleMode> monthList = [
  //   SimpleMode(id: 0, name: 'icon', isSelected: false),
  //   SimpleMode(id: 1, name: 'Jun', isSelected: true),
  //   SimpleMode(id: 2, name: 'July', isSelected: false),
  //   SimpleMode(id: 3, name: 'Aug', isSelected: false),
  //   SimpleMode(id: 4, name: 'Sep', isSelected: false),
  //   SimpleMode(id: 5, name: 'Oct', isSelected: false),
  //   SimpleMode(id: 6, name: 'Nov', isSelected: false),
  //   SimpleMode(id: 7, name: 'Dec', isSelected: false),
  //   SimpleMode(id: 8, name: 'Jan', isSelected: false),
  //   SimpleMode(id: 9, name: 'Feb', isSelected: false),
  //   SimpleMode(id: 10, name: 'March', isSelected: false),
  //   SimpleMode(id: 11, name: 'April', isSelected: false),
  //   SimpleMode(id: 12, name: 'May', isSelected: false),
  // ];

  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update();
  }


  int currentSlotsIndex = 0;

  List<String> days = [
    "Sun".tr,
    "Mon".tr,
    "Tue".tr,
    "Wed".tr,
    "Thu".tr,
    "Fri".tr,
    "Sat".tr,
    "Sun".tr,
  ];

  List<String> months = [
    "Jan".tr,
    "Feb".tr,
    "March".tr,
    "April".tr,
    "May".tr,
    "June".tr,
    "July".tr,
    "Aug".tr,
    "Sep".tr,
    "Oct".tr,
    "Nov".tr,
    "Dec".tr,
  ];

  List<String> newMonths = [];

  List<DateTime> currentMonthList = List.empty();
  List<DateTime> tmpMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  DateTime currentDateTimeMonth = DateTime.now();
  DateTime currentDateTimeRemoveDay = DateTime.now();
  DateTime nextMonthDateTime =
      DateTime(DateTime.now().year, DateTime.now().month + 1);
  List<DateTime> currentLastMonthList = List.empty();
  List<DateTime> currentNewList = List.empty();
  DateTime selectedDay = DateTime.now();

  String getMonth(int monthNumber) {
    late String month;
    switch (monthNumber) {
      case 1:
        month = "January".tr;
        break;
      case 2:
        month = "February".tr;
        break;
      case 3:
        month = "March".tr;
        break;
      case 4:
        month = "April".tr;
        break;
      case 5:
        month = "May".tr;
        break;
      case 6:
        month = "June".tr;
        break;
      case 7:
        month = "July".tr;
        break;
      case 8:
        month = "August".tr;
        break;
      case 9:
        month = "September".tr;
        break;
      case 10:
        month = "October".tr;
        break;
      case 11:
        month = "November".tr;
        break;
      case 12:
        month = "December".tr;
        break;
    }
    return month;
  }

  @override
  void onInit() async {
    print("call onInit"); // this line not printing
    super.onInit();
    lan();
    currentDateTimeRemoveDay = DateTime(currentDateTimeMonth.year,currentDateTimeMonth.month,currentDateTimeMonth.day,00,00,00,00,00);
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    // print("currentMonthList ${currentMonthList}");
    String date = months
        .where((element) => element == months[currentDateTime.month - 1])
        .toString();
    String finalDate = date.replaceAll("(", "").replaceAll(")", "");
    // int j = 12 - months.length;

    // if(finalDate == months[currentDateTime.month - 1]){
    //   for(int i = 0; i < 12; i++){
    //   newMonths.add(months[i]);
    //   print("currentNewList ${newMonths}");
    //   }
    // }
    // else{
    //   print("month");
    // print(currentLastMonthList[i]);
    // currentMonthList.add(currentLastMonthList[i]);
    // print(currentMonthList.length.toString()+"////////////");
    // }

    // currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    // currentMonthList = currentMonthList.toSet().toList();

    // if(currentDateTime.day != 1) {
    //   currentMonthList.removeRange(
    //       currentMonthList[0].day, currentDateTime.day-1);
    //   currentMonthList.removeAt(0);
    // }
    //
    // print("After Remove currentMonthList $currentMonthList");
    // print("currentMonthList Length ${currentMonthList.length}");
    // currentLastMonthList = date_util.DateUtils.daysInMonth(nextMonthDateTime);
    // int j = 31 - currentMonthList.length;
    // for(int i = 0; i < j; i++){
    //
    //   print(i);
    //   print(currentLastMonthList[i]);
    //   currentMonthList.add(currentLastMonthList[i]);
    //   print(currentMonthList.length.toString()+"////////////");
    // }
    // // print(nextMonthDateTime);
    // currentMonthList.removeLast();

    fetchMonth();
  }

  List<SimpleMode> monthList = [];
  // SimpleMode(id: 0, name: 'icon', isSelected: false),

  fetchMonth() {
    var now = DateTime.now();
    var formatter = DateFormat('MM');
    String month = formatter.format(now);
    monthList.add(SimpleMode(id: 0, name: 'icon', isSelected: false));
    for(int i=int.parse(month);i<=12+int.parse(month)-1;i++){
      monthList.add(SimpleMode(id: i>12?i-12:i, name: i>12?getMonth(i-12):getMonth(i), isSelected: false,
          value:  i>12?currentDateTimeMonth.year+1:currentDateTimeMonth.year));
    }
    monthList[1].isSelected = true;
    // for(var data in monthList){
    //   debugPrint('data ${data.id} name ${data.name} isSelected ${data.isSelected} year ${data.value}');
    // }
    getMonthDays(currentDateTimeMonth.year,currentDateTimeMonth.month);
    update(['month']);
  }

  getMonthDays(int year,int month){

    currentMonthList = date_util.DateUtils.daysInMonth(DateTime(year,month));

    currentMonthList.removeWhere((element){
      if(element.isBefore(currentDateTimeRemoveDay)){
        return true;
      }
      return false;
    });

    selectedDay = currentMonthList[0];

    // print('current month list $currentMonthList');
    update(['days']);
  }


  onChangeSelectedMonth(SimpleMode value) {
    for (var data in monthList) {
      if (data.id == value.id) {
        data.isSelected = true;
      } else {
        data.isSelected = false;
      }
    }
    getMonthDays(value.value, value.id!);
    update(['month']);
  }

  onChangeDays(value){
    selectedDay = value;
    update(['days']);
  }

}
