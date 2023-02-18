import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../../models/usermodel.dart';

class LiveController extends GetxController with GetSingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  int currentIndex = 0;
  ScrollController scrollController1 = ScrollController();
  double height=200;
  int secondIndex=0;
  int firstIndex=0;

  List<User> userList = [
    User(cmt: "Amazing Event ", ),
    User(cmt: "Happy Holi ", ),
    User(cmt: "WOW!", ),

  ];

  ///------ color list ---------
  List<String> img = [
    AppImages.cmtIcon1,
    AppImages.cmtIcon2,
    AppImages.cmtIcon3,

  ];
  // List<Color> colors = [
  //   AppColors.black.withOpacity(0.2),
  //   AppColors.black.withOpacity(0.4),
  //
  //   AppColors.black.withOpacity(0.6),
  //
  //
  //   // AppColors.black.withOpacity(0.6),
  //   // AppColors.black.withOpacity(0.5),
  //   // AppColors.black.withOpacity(0.2),
  //
  // ];

  AnimationController? animationController;
  double ratio = 1.0;
  bool selectHeart=false;


  Future<void> addUserToList(name,) async {
    userList.add(User(cmt: name,));
    update();
  }
  void repeatOnce() async {
    await animationController!.forward();
    await animationController!.reverse();
  }
  select(){
    selectHeart=!selectHeart;
    update(['live']);
  }
  int repeatTimes = 10;
  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update(['live']);
  }

  @override
  void onInit() {
    super.onInit();
    refresh();
    lan();
    update(['live']);






    animationController = AnimationController(vsync: this,duration: Duration(seconds: 10))
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed)
        {
          animationController!.reset();
        }
      });
    ///---e xtra --
    // TickerFuture tickerFuture = animationController!.repeat();
    // tickerFuture.timeout(Duration(seconds:  3 * 10), onTimeout:  () {
    //   animationController!.forward(from: 0);
    //   animationController!.stop(canceled: true);
    // });
    // repeatOnce();
    update(['animation']);
  }

  refresh(){

    update(['liveScreen']);
  }

///--- add cmt ----
  updateTabIndex({ind}){

    scrollController1.animateTo(

      ind.toDouble() * height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,



    );

    update();
    // update(['TabIndex']);
    // }else{}

    // update(['TabIndex']);
  }
///---- for auto scroll ---
  Matrix4 getScaleDownMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  secondColor({ind}){
    secondIndex=ind--;
    print('secondIndex======${secondIndex}');
    update();
  }
  thirdColor({ind}){
    firstIndex=ind;
    print('firstindex======${firstIndex}');
    update();
  }
}