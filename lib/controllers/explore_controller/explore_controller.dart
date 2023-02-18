import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreController extends GetxController{

  List exploreList = [
    {
      "id": 0,
      "image": AppImages.expo1,
      "name": "Car Expo".tr,
      "date": "15 Jun,2022".tr,
      "label": "Free".tr,
    },
    {
      "id": 1,
      "image": AppImages.expo2,
      "name": "Conference".tr,
      "date": "20 Jun,2022".tr,
      "label": "300".tr,
    },
    {
      "id": 2,
      "image": AppImages.expo1,
      "name": "Fashion Show".tr,
      "date": "25 Jun,2022".tr,
      "label": "200".tr,
    },
    {
      "id": 3,
      "image": AppImages.expo2,
      "name": "Concert".tr,
      "date": "27 Jun,2022".tr,
      "label": "Free".tr,
    },
    {
      "id": 4,
      "image": AppImages.expo1,
      "name": "Bike Expo".tr,
      "date": "30 Jun,2022".tr,
      "label": "Free".tr,
    },
  ];

  List categoryList = [
    {
      "id": 0,
      "image": AppImages.category1,
      "name": "Workshop".tr,
    },
    {
      "id": 1,
      "image": AppImages.category2,
      "name": "Parties".tr,
    },
    {
      "id": 2,
      "image": AppImages.category3,
      "name": "Social meets".tr,
    },
    {
      "id": 3,
      "image": AppImages.category4,
      "name": "Exhibition".tr,
    },
    {
      "id": 4,
      "image": AppImages.category5,
      "name": "Celebration".tr,
    },
    {
      "id": 5,
      "image": AppImages.category6,
      "name": "Performance".tr,
    },
    {
      "id": 6,
      "image": AppImages.category7,
      "name": "Fun & Game".tr,
    },
    {
      "id": 7,
      "image": AppImages.category8,
      "name": "Concerts".tr,
    },
  ];

  List nearByList = [
    {
      "id": 0,
      "image": AppImages.nearBy1,
      "name": "Business conference".tr,
      "date": "15 Jun, 2022".tr,
      "state": "Los Angeles".tr,
      "interested": "320".tr,
      "fav": false,
    },
    {
      "id": 1,
      "image": AppImages.nearBy2,
      "name": "Cirque Musica Querida".tr,
      "date": "20 Jun, 2022".tr,
      "state": "Mexico".tr,
      "interested": "150".tr,
      "fav": false,
    },
    {
      "id": 2,
      "image": AppImages.nearBy3,
      "name": "Sweet Baby James".tr,
      "date": "22 Jun, 2022".tr,
      "state": "New York".tr,
      "interested": "280".tr,
      "fav": false,
    },
    {
      "id": 3,
      "image": AppImages.nearBy4,
      "name": "Art with Me Miami".tr,
      "date": "25 Jun, 2022".tr,
      "state": "Bangkok".tr,
      "interested": "500".tr,
      "fav": false,
    },
    {
      "id": 4,
      "image": AppImages.nearBy1,
      "name": "Cirque Musica Querida".tr,
      "date": "28 Jun, 2022".tr,
      "state": "Los Angeles".tr,
      "interested": "320".tr,
      "fav": false,
    },
    {
      "id": 5,
      "image": AppImages.nearBy2,
      "name": "Sweet Baby James".tr,
      "date": "30 Jun, 2022".tr,
      "state": "Los Angeles".tr,
      "interested": "150".tr,
      "fav": false,
    },
  ];
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

  }
// void favIcon(int index) {
//   if(subList[index]['id'] == index){
//     if(subList[index]['fav'] == false){
//       print("if");
//       subList[index]['fav'] = true;
//     }
//     else{
//       print("else");
//       subList[index]['fav'] = false;
//     }
//     print("subList[index]['fav'] ${subList[index]['fav']}");
//   }
//   else{
//     print("Else Else");
//   }
//   update(['list']);
//
// }

}