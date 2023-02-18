import 'package:event/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FormController extends GetxController {
  TextEditingController nameController = TextEditingController();

  int currentIndex = 0;
  int secondIndex=0;
  int firstIndex=0;

  List<User> userList = [
    User(cmt: "a", ),

  ];
   AutoScrollController controller=AutoScrollController();
   List randomList=[];
  final scrollDirection = Axis.vertical;
   initState() {
     datmethod();

  }
  datmethod(){
      controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, 0),
        axis: scrollDirection);
    randomList.add(userList);
    update();
  }
  Widget wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: AutoScrollController(),
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
  Future scrollToCounter() async {
    await controller.scrollToIndex(userList.length+1,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(userList.length+1);
    // await controller.scrollToIndex(counter,
    //     preferPosition: AutoScrollPosition.begin);
    // controller.highlight(counter);
    update();
  }

  int counter = -1;
  Future nextCounter() {
    counter = (userList.length + 1) % userList.length;
    update();
    return scrollToCounter();
  }






  void updateForm() {
    User user = User(cmt: nameController.text, );
    userList[currentIndex] = user;
    update();
  }

  void updateTextControllers(User user) {
    nameController.text = user.cmt;

    update();
  }

  Future<void> addUserToList(name,) async {


    userList.add(User(cmt: name,));

    update();
  }

  void updateLanguageInformation() {
    // for (var i = 0; i <= userList.length; i++) { // ** don't need nested for loop here **
    for (var user in userList) {
      print("Name: " + user.cmt );
    }
    // }
  }
  ScrollController scrollController1 = ScrollController();
  double height=200;
  updateTabIndex({ind}){
    // index = ind;
    // if(ind == 0){
    //   scrollController1.animateTo(
    //     scrollController1.position.minScrollExtent,
    //     // ind.toDouble() * width,
    //     duration: const Duration(seconds: 2),
    //     curve: Curves.fastOutSlowIn,
    //   );
    //   update();

    // } else if(ind == 4){
      scrollController1.animateTo(
        // scrollController1.position.minScrollExtent,
        ind.toDouble() * height,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        // curve: Curves.easeInOut,
      );
      update();
      // update(['TabIndex']);
    // }else{}

    // update(['TabIndex']);
  }
  secondColor({ind}){
    secondIndex=ind;
    print('secondIndex======${secondIndex}');
    update();
  }
  thirdColor({ind}){
    firstIndex=ind;
    print('firstindex======${firstIndex}');
    update();
  }


}