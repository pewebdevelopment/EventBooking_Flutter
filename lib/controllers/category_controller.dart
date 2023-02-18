import 'package:event/utils/common_imports.dart';

class CategoryController extends GetxController{

  int? indexSelect;
  List isRecommended = [];
  List categoryList = [
  {

  "image": 'assets/icons/category/ballBlack.png',

  "name": "Sports".tr,

},
    {

      "image": 'assets/icons/category/business.png',

      "name": "Business".tr,

    },
    {

      "image": 'assets/icons/category/education.png',

      "name": "Education".tr,

    },
    {

      "image": 'assets/icons/category/fitness.png',

      "name": "Fitness".tr,

    },
    {

      "image": 'assets/icons/category/health.png',

      "name": "Health".tr,

    },
    {

      "image": 'assets/icons/category/Pizza.png',

      "name": "Food".tr,

    },
    {

      "image": 'assets/icons/category/Plan.png',

      "name": "Travel".tr,

    },
    {

      "image": 'assets/icons/category/retail.png',

      "name": "Retail".tr,

    },
    {

      "image": 'assets/icons/category/music.png',

      "name": "Music".tr,

    },

  ];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


  }

  select(int ind){

    if (isRecommended.contains(ind)) {
      // isRecommended.clear();(when u clear all selection )

      isRecommended.remove(ind);
    } else {
      isRecommended.add(ind);
    }
    ///--- below for single selection

    // indexSelect=ind;
    update(['category']);
  }
}