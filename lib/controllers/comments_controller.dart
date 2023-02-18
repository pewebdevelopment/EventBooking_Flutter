import 'package:event/models/simple_model.dart';
import 'package:event/utils/common_imports.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_images.dart';

class CommentsController extends GetxController {

  bool isShow = false;

  List<CommentsModel> commentList = [
    CommentsModel(
      id: 0,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm1}',
      time: '3 hrs ago'.tr,
      commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      fav: false,
      isShow: false,
      totalComments: 0,
      subCommentsModel: [],
    ),
    CommentsModel(
      id: 1,
      personName: 'Franciso Gibbs'.tr,
      image: '${AppImages.comm2}',
      time: '4 hrs ago'.tr,
      commentsText: "Lorem ipsum dolor sit amet consectetur.Gravida feugiat commodo .".tr,
      fav: false,
      isShow: false,
      totalComments: 5,
      subCommentsModel: [
        SubCommentsModel(
          personName: 'Anya'.tr,
          image: '${AppImages.comm3}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        ),
        SubCommentsModel(
          personName: 'Liza Scott'.tr,
          image: '${AppImages.comm5}',
          time: '4 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        ),
        SubCommentsModel(
          personName: 'Emiway Berkle'.tr,
          image: '${AppImages.header2}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        ),
        SubCommentsModel(
          personName: 'Tamunal12'.tr,
          image: '${AppImages.comm3}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        ),
        SubCommentsModel(
          personName: 'Henry Harvey'.tr,
          image: '${AppImages.header4}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        ),
      ],
    ),
    CommentsModel(
      id: 2,
      personName: 'Henry Harvey'.tr,
      image: '${AppImages.comm4}',
      time: '3 hrs ago'.tr,
      commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      fav: false,
      isShow: false,
      totalComments: 0,
      subCommentsModel: [],
    ),
    CommentsModel(
      id: 3,
      personName: 'Emiway Berkle'.tr,
      image: '${AppImages.comm6}',
      time: '3 hrs ago'.tr,
      commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      fav: false,
      isShow: false,
      totalComments: 1,
      subCommentsModel: [
        SubCommentsModel(
          personName: 'George'.tr,
          image: '${AppImages.comm1}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        )
      ],
    ),
    CommentsModel(
      id: 4,
      personName: 'Vance Corwin'.tr,
      image: '${AppImages.comm3}',
      time: '3 hrs ago'.tr,
      commentsText: "Yes i agree with your opnion...".tr,
      fav: false,
      isShow: false,
      totalComments: 1,
      subCommentsModel: [
        SubCommentsModel(
          personName: 'Nick'.tr,
          image: '${AppImages.comm4}',
          time: '3 hrs ago'.tr,
          commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
          fav: false,
          isShow: false,
          totalComments: 0,
        )
      ],
    ),
    CommentsModel(
      id: 5,
      personName: 'Henry Harvey'.tr,
      image: '${AppImages.comm4}',
      time: '3 hrs ago'.tr,
      commentsText: "Your Event is so superb.i’m so enjoy this event shows.".tr,
      fav: false,
      isShow: false,
      totalComments: 0,
      subCommentsModel: [],
    ),
  ];

  void isShowList(CommentsModel commentList) {
    if(commentList.isShow == true){
      commentList.isShow = false;
    }
    else{
      commentList.isShow = true;
    }

    update(['comments']);
  }

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