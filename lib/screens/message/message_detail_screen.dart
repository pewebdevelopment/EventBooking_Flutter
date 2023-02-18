import 'package:event/controllers/message_controller/message_detail_controller.dart';
import 'package:event/controllers/message_controller/message_screen_controller.dart';
import 'package:event/utils/app_font_style.dart';
import 'package:event/utils/common_imports.dart';

class MessageDetailScreen extends StatelessWidget {
  String image;
  String name;
  MessageDetailScreen({Key? key,required this.image,required this.name}) : super(key: key);
  MessageDetailController messageDetailController=Get.put(MessageDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          messageDetailController.isArabic==true? AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                          // '${AppImages.iconPath}back.svg',
                          height: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                          )
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Text(
                      name,
                      style: AppFontStyle.titleText,
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<MessageDetailController>(
                init: MessageDetailController(),
                builder: (controller) {
                return ListView.builder(
                    itemCount: controller.chatList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      int k = controller.chatList.length > index ? index + 1 : controller.chatList.length - 1;
                      int length =controller.chatList.length;
                      return Column(
                        children: [
                          k >= controller.chatList.length
                              ?  (controller.chatList[index].date == "3" || controller.chatList[index].chatModel.isEmpty) ? Container() : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10,top: 10),
                              child: Text(controller.chatList[index].date == "0" ? "Today" : controller.chatList[index].date == "1" ? "Yesterday" : "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textGrey13,
                                ),
                              ),
                            ),
                          ) : (controller.chatList.length > length - 1) ? (controller.chatList[index].date == "3" || controller.chatList[index].chatModel.isEmpty) ? Container() : Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10,top: 10),
                                child: Text(controller.chatList[index].date == "0" ? "Today" : controller.chatList[index].date == "1" ? "Yesterday" : "",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textGrey13,
                                  ),
                                ),
                              )
                          ) : Container(),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.chatList[index].chatModel.length,
                            itemBuilder: (context,ind){
                              print("kkkkk $k");
                              return Column(
                                children: [
                                  controller.chatList[index].chatModel[ind].isSender == 0 ?
                                  myMessageCard(
                                    chatList: controller.chatList,
                                    chatListModel: controller.chatList[index],
                                    controller: controller,
                                    msg : controller.chatList[index].chatModel[ind].message,
                                    time: controller.chatList[index].chatModel[ind].time,
                                    isReceive: controller.chatList[index].chatModel[ind].isReceive,
                                    index: index,
                                    context: context,
                                    chatModel: controller.chatList[index].chatModel[ind],
                                  )
                                      :
                                  // Container()
                                  messageCard(
                                      controller: controller,
                                      chatList: controller.chatList,
                                      context: context,
                                      msg : controller.chatList[index].chatModel[ind].message,
                                      time: controller.chatList[index].chatModel[ind].time,
                                      isReceive: controller.chatList[index].chatModel[ind].isReceive,
                                      index: index,
                                      chatListModel: controller.chatList[index],
                                      chatModel: controller.chatList[index].chatModel[ind],
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                );
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<MessageDetailController>(
          init: MessageDetailController(),
          builder: (controller) {
          return controller.isDelete == true ?
          Container(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          controller.remove();
                          },
                          child: SvgPicture.asset(AppImages.delete,height: 25,),
                      ),
                      Center(
                        child: Text(
                          controller.count.toString() + " Selected".tr,
                          style: const TextStyle(
                            fontFamily: AppFontStyle.semiBold,
                            color: AppColors.textGrey14
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ) : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.textWhite,
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: TextFormField(
                // controller: controller.commentController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    color: AppColors.textGrey2,
                    fontFamily: AppFontStyle.regular,
                    fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 13),
                  border: InputBorder.none,
                  hintText: 'Type a message'.tr,
                  hintStyle: const TextStyle(
                      color: AppColors.textGrey2,
                      fontFamily: AppFontStyle.regular,
                      fontSize: 16,
                  ),
                  prefixIcon:  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(
                        AppImages.add,
                        height: 5,
                      ),
                    ),
                  ),
                  suffixIcon:  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        AppImages.sendmessage,
                        // fit: BoxFit.fill,
                        height: 10,
                      ),
                    ),
                  ),

                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget myMessageCard({
    required String msg,
    required List<ChatListModel> chatList,
    required String time,
    required int isReceive,
    index,required BuildContext context,
    required MessageDetailController controller,
    required ChatModel chatModel,
    required ChatListModel chatListModel, }) {
    return Container(
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onLongPress: (){
              controller.selectAllMessage(chatList,chatModel);
            },
            onTap: (){
              if(chatModel.isSelect > 0){
                controller.selectMessage(chatListModel,chatList,chatModel);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: controller.isArabic==true? EdgeInsets.fromLTRB(0, 5, 15, 0):EdgeInsets.fromLTRB(15, 5, 0, 0),
                  // padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Row(
                    children: [
                      chatModel.isSelect == 1 ?
                          Padding(
                            padding: controller.isArabic==true? EdgeInsets.only(left: 10):EdgeInsets.only(right: 10),
                            child: SvgPicture.asset(AppImages.circle1,height: 20,),
                          )
                          : chatModel.isSelect == 2 ? Padding(
                        padding: controller.isArabic==true? EdgeInsets.only(left: 10):EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(AppImages.circle2,height: 20,),
                      ) : Container(),
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 50,
                          maxWidth: MediaQuery.of(context).size.width - 100,
                        ),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.textWhite2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            typeToWidget(
                                3,
                                msg,
                                "0",
                                "0",
                                index,
                                0
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                            child: Text(
                                time,
                                style: const TextStyle(
                                  color: AppColors.textGrey12,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.regular,
                                ),
                              ),
                          ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messageCard({
    required String msg,
    required String time,
    required int isReceive,
    index,required BuildContext context,
    required MessageDetailController controller,
    required List<ChatListModel> chatList,
    required ChatListModel chatListModel,
    required ChatModel chatModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onLongPress: (){
                  controller.selectAllMessage(chatList,chatModel);
                },
                onTap: (){
                  if(chatModel.isSelect > 0){
                    controller.selectMessage(chatListModel,chatList,chatModel);
                  }

                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 50,
                          maxWidth: MediaQuery.of(context).size.width - 100,
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.primary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            typeToWidget(
                                3,
                                msg,
                                "0",
                                "0",
                                index,
                              1
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      time,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12,
                                        fontFamily: AppFontStyle.regular,
                                      ),
                                    ),
                                  const SizedBox(width: 7,),
                                  Container(
                                    width: 15,
                                      child: SvgPicture.asset(isReceive == 0 ? AppImages.done : isReceive == 1 ? AppImages.done2 : AppImages.done3,
                                        height: 8,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      chatModel.isSelect == 1 ?
                      Padding(
                        padding: controller.isArabic==true? EdgeInsets.only(right: 10):EdgeInsets.only(left: 10),
                        child: SvgPicture.asset(AppImages.circle1,height: 20,),
                      )
                          : chatModel.isSelect == 2 ? Padding(
                        padding: controller.isArabic==true? EdgeInsets.only(right: 10):EdgeInsets.only(left: 10),
                        child: SvgPicture.asset(AppImages.circle2,height: 20,),
                      ) : Container(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ],
      ),
    );
  }

  typeToWidget(int type, String message, String uid, String taskId, int index, int i){

    if(type == 1){
      // return InkWell(
      //   onTap: (){
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => MyPhotoViewer(SERVER_ADDRESS + "/public/upload/chat/" + message),
      //     ));
      //   },
      //   child: Hero(
      //     tag: SERVER_ADDRESS + "/public/upload/chat/" + message,
      //     child: ClipRRect(
      //       child: CachedNetworkImage(
      //         imageUrl: SERVER_ADDRESS + "/public/upload/chat/" + message,
      //         placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
      //         errorWidget: (context, url, error) => Icon(Icons.error),
      //         height: 200,
      //         width: 200,
      //         fit: BoxFit.cover,
      //       ),
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //   ),
      // );
    }
    else if(type == 2){
      // return InkWell(
      //   onTap: (){
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => MyVideoPlayer(SERVER_ADDRESS + "/public/upload/chat/" + message))
      //     );
      //   },
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(10),
      //     child: Container(
      //       height: 200,
      //       width: 200,
      //       child: Stack(
      //         children: [
      //           MyVideoThumbNail(SERVER_ADDRESS + "/public/upload/chat/" + message),
      //           Container(
      //             color: Colors.black38,
      //           ),
      //           Center(
      //             child: Icon(Icons.play_circle_fill, color: WHITE, size: 70,),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    }
    // else if(type == 3 && uid == myUid){
    //   final uploader = FlutterUploader();
    //   return InkWell(
    //     onLongPress: (){
    //
    //     },
    //     child: Container(
    //       height: 200,
    //       child: Stack(
    //         children: [
    //           Center(
    //             child: CircularProgressIndicator(
    //               valueColor: AlwaysStoppedAnimation(WHITE),
    //             ),
    //           ),
    //           Align(
    //             alignment: Alignment.bottomRight,
    //             child:
    //
    //             Text("Uploading...", style: TextStyle(color: WHITE),),
    //           ),
    //           Center(
    //             child: InkWell(
    //                 onTap: (){
    //                   deleteTask(taskId);
    //                   uploader.cancel(taskId: taskId);
    //                 },
    //                 child: Icon(Icons.cancel, color: WHITE,)),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    else if(type == 0){
      return InkWell(
        onTap: () async{
          // if(isURL(message)){
          //   if (await canLaunch(message)) {
          //     await launch(message);
          //   }
          // }
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
              message,
              style: TextStyle(
                fontFamily: AppFontStyle.bold,
                color: i == 0 ? AppColors.black : AppColors.white,
              )
          ),
        ),
      );
    }
    // else if(type == 3 && uid != myUid){
    //   return Text("Uploading file...", style: TextStyle(fontSize: 10),);
    // }
    else{
      return Padding(
        padding: const EdgeInsets.only(left: 8,top: 8,right: 8,bottom: 8),
        child: Column(
          children: [
            Text(
              message,
                style: TextStyle(
                  fontFamily: AppFontStyle.semiBold,
                  color: i == 0 ? AppColors.black : AppColors.white,
                )
            ),
          ],
        ),
      );
    }

  }


// Widget messageCard({String msg, String time, String image, int isReceive, index}) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           SizedBox(width: 15,),
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(25),
  //             child: CachedNetworkImage(
  //               height: 35,
  //               width: 35,
  //               fit: BoxFit.cover,
  //               imageUrl: image,
  //               progressIndicatorBuilder: (context, url, downloadProgress) => Container(
  //                   child: Center(child: Icon(Icons.account_circle, color: LIGHT_GREY_TEXT,size: 35))),
  //               errorWidget: (context, url, error) => Container(
  //                 child: Center(child: Icon(Icons.account_circle, color: LIGHT_GREY_TEXT, size: 35,),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.fromLTRB(0, 10, 15, 4),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       SvgPicture.string(
  //                         messageCorner,
  //                         allowDrawingOutsideViewBox: true,
  //                       ),
  //                       Container(
  //                         constraints: BoxConstraints(
  //                           minWidth: 50,
  //                           maxWidth: MediaQuery.of(context).size.width - 100,
  //                         ),
  //                         padding: EdgeInsets.all(5),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10),
  //                             bottomRight: Radius.circular(10),
  //                           ),
  //                           color: WHITE,
  //                         ),
  //                         child: typeToWidget(
  //                             int.parse(snapshot.data.docs[index]['type'].toString()),
  //                             snapshot.data.docs[index]['msg'],
  //                             snapshot.data.docs[index]['uid'],
  //                             snapshot.data.docs[index].id,
  //                             snapshot,
  //                             index
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(
  //                       time,
  //                       style: TextStyle(
  //                         color: LIGHT_GREY_TEXT,
  //                         fontWeight: FontWeight.w700,
  //                         fontSize: 11,
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 10,),
  //     ],
  //   );
  // }

}

class MessageList extends StatelessWidget {
  MessageModel messageList;
  MessageList({required this.messageList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: height * 0.07,
          width: width * 0.15,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(messageList.image),
              )
          ),
        ),
        SizedBox(width: width * 0.03,),
        Container(
          width: width * 0.54,
          height: height * 0.07,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(messageList.personName,style: AppFontStyle.blackBold16),
              Text(messageList.message,style: AppFontStyle.greyRegular15,maxLines: 1,),
            ],
          ),
        ),
        SizedBox(width: width * 0.03,),
        Container(
          height: height * 0.07,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(messageList.time,style: AppFontStyle.greyRegular15),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                  BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text(messageList.totalMessage.toString(),
                        style: AppFontStyle
                            .whiteSemiBold10)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

