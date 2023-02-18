import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_images.dart';
import '../../utils/common_imports.dart';

class MessageDetailController extends GetxController {

  bool isDelete = false;
  int count = 0;

  List<ChatListModel> chatList = [
    ChatListModel(
      id: 0,
      date: '1',
      chatModel: [
        ChatModel(
            id: 0,
            time: '13:12PM'.tr,
            message: "Hello,I want to plan event for my Birthday so can you send your details.".tr,
            date: "1",
            isSender: 0,
            isReceive: 0,
            daysDifference: 1,
            isSelect: 0,
        ),
        ChatModel(
          id: 1,
          time: '13:24PM'.tr,
          message: "Yes,Sure i will send".tr,
          date: "3",
          isSender: 1,
          isReceive: 0,
          daysDifference: 1,
          isSelect: 0,
        ),
        ChatModel(
            id: 1,
            time: '13:25PM'.tr,
            message: "Which date your Birthday?".tr,
            date: "3",
            isSender: 1,
            isReceive: 1,
            daysDifference: 2,
            isSelect: 0,
        ),
      ],
    ),
    ChatListModel(
      id: 1,
      date: '0',
      chatModel: [
        ChatModel(
            id: 2,
            time: '10:06PM'.tr,
            message: "23/02 it’s my Birthdate".tr,
            date: "0",
            isSender: 0,
            isReceive: 0,
            daysDifference: 0,
            isSelect: 0,
        ),
        ChatModel(
            id: 2,
            time: '10:07PM'.tr,
            message: "Ok,I will confirmed your date.".tr,
            date: "3",
            isSender: 1,
            isReceive: 2,
            daysDifference: 0,
            isSelect: 0,
        ),

      ],
    ),
    // ChatListModel(
    //     id: 1,
    //     time: '12:26PM',
    //
    // ),
  ];

  void selectAllMessage(List<ChatListModel> chatList, ChatModel chatModel) {

    if(chatModel.isSelect == 0){
      // chatListModel.isSelect = true;
      isDelete = true;

      for(int i = 0; i < chatList.length ; i++){
        print("i $i");
        for(int j = 0; j < chatList[i].chatModel.length ; j++){
          print("i $i");
          chatList[i].chatModel[j].isSelect = 1;
          // chatListModel.chatModel[i].isSelect = true;
        }
        // chatList[i].isSelect = 1;
        // chatListModel.chatModel[i].isSelect = true;
      }
    }
    else{
      isDelete = false;
      for(int i = 0; i < chatList.length ; i++){
        for(int j = 0; j < chatList[i].chatModel.length ; j++){
          print("i $i");
          chatList[i].chatModel[j].isSelect = 0;
          // chatListModel.chatModel[i].isSelect = true;
        }
        // chatListModel.chatModel[i].isSelect = true;
      }
      // chatListModel.isSelect = false;
    }
    update();

  }

  void selectMessage(ChatListModel chatListModel, List<ChatListModel> chatList, ChatModel chatModel) {
    print("Helloeee");
    if(chatModel.isSelect == 1){
      print("chatModel.isSelect ${chatModel.isSelect}");
      chatModel.isSelect = 2;
      count += 1;
    }
    else{
      chatModel.isSelect = 1;
      count -= 1;
    }
    update();

  }

  void remove() {
    for(int i = 0; i < chatList.length; i++){
      print("i $i");
      for(int j = 0; j < chatList[i].chatModel.length; j++){
        print("i $i");
        chatList[i].chatModel.removeWhere((element) => element.isSelect == 2);
        // chatListModel.chatModel[i].isSelect = true;
      }
      // chatList[i].isSelect = 1;
      // chatListModel.chatModel[i].isSelect = true;
    }
    count = 0;
    update();
  }

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

}