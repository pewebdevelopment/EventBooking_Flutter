import 'package:event/controllers/message_controller/message_screen_controller.dart';
import 'package:event/screens/message/message_detail_screen.dart';
import 'package:event/utils/common_imports.dart';

class MessageScreen extends StatelessWidget {
   MessageScreen({Key? key}) : super(key: key);
  MessageScreenController messageScreenController=Get.put(MessageScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: ,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: CircularShadow(
                child: SvgPicture.asset(
                  messageScreenController.isArabic==true? AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                  height: 16,
                ),
              ),
            ),
          ),
        ),
        title:  Text(
          'Lizza_Scott'.tr,
          style: AppFontStyle.appBarTitle,
        ),
        actions: [
          SvgPicture.asset(AppImages.bell,height: 20,),
          SizedBox(width: 15,),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: Color(0xffD1D1D1),
            ),
            const SizedBox(height: 5,),
            // Padding(
              // padding: const EdgeInsets.all(8.0),
              // child:
              Container(
                margin: messageScreenController.isArabic==true?  EdgeInsets.only(left: 12,right: 15,top: 8):EdgeInsets.only(left: 15,right: 12,top: 8),
                  height: 48,
                  decoration: BoxDecoration(
                    // border: Border.all(color: ),
                    color: AppColors.textWhite,
                    borderRadius: new BorderRadius.circular(9.0),
                  ),
                  child: TextFormField(
                      // controller: controller.commentController,
                      keyboardType: TextInputType.text,

                      style: const TextStyle(
                          color: AppColors.textGrey5,
                          fontFamily: AppFontStyle.bold,fontSize:16
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
                        hintText: 'Search'.tr,
                        hintStyle: const TextStyle(
                            color: AppColors.textGrey5,
                            fontFamily: AppFontStyle.bold,fontSize:16
                        ),
                        prefixIcon:  Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            AppImages.searchMessage,
                            height: 5,
                          ),
                        ),
                      ),
                  ),
              ),
            // ),
            SizedBox(height: 5,),
            Container(
              margin: messageScreenController.isArabic==true?  EdgeInsets.only(left: 12,right: 15,top: 8):EdgeInsets.only(left: 15,right: 12,top: 8),

              // margin: EdgeInsets.only(left: 15,right: 12,top: 8),
              // padding: const EdgeInsets.all(8.0),
              child: Text(
                "Messages".tr,
                style: AppFontStyle.greySemiBold18,
              ),
            ),
            GetBuilder<MessageScreenController>(
              init: MessageScreenController(),
              id: "list",
              builder: (controller) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return Divider(
                        color: Color(0xffD1D1D1),
                      );
                    },
                    itemCount: controller.messageList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Container(
                        margin: messageScreenController.isArabic==true?  EdgeInsets.only(left: 12,right: 15,top: 8):EdgeInsets.only(left: 15,right: 12,top: 8),

                        // margin: EdgeInsets.only(left: 15,right: 12,top: 8),
                        // padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                        child: MessageList(messageList: controller.messageList[index]),
                      );
                    }
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  MessageModel messageList;
  MessageList({required this.messageList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Get.to(MessageDetailScreen(name: messageList.personName,image: messageList.image,));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.54,
                height: height * 0.075,
                // color:  Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(messageList.personName,style: AppFontStyle.blackBold16),
                    Text(messageList.message,style: AppFontStyle.greyRegular15,maxLines: 1,),
                  ],
                ),
              ),
              // SizedBox(width: width * 0.03,),
              Container(
                height: height * 0.075,
                width: width * 0.2,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(messageList.time,style: AppFontStyle.greyRegular15),
                    messageList.totalMessage == 0 ? Container() : Container(
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
          ),

        ],
      ),
    );
  }
}

