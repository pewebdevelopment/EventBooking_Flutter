import 'package:event/controllers/comments_controller.dart';
import 'package:event/utils/common_imports.dart';

class CommentsScreen extends StatelessWidget {
  CommentsController commentsController=Get.put(CommentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircularShadow(
              child: SvgPicture.asset(
                commentsController.isArabic==true? AppImages.rightArrow:'${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              'Comments'.tr,
              style: AppFontStyle.appBarTitle,
            ),
            Text(
              "("'56'.tr+")",
              style: AppFontStyle.blackRegular16,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          GetBuilder<CommentsController>(
              init: CommentsController(),
              id: "comments",
              builder: (controller) {
              return Container(
                child: ListView.builder(
                    itemCount: controller.commentList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                      return CommentList(
                        image: controller.commentList[index].image,
                        personName: controller.commentList[index].personName,
                        time: controller.commentList[index].time,
                        commentsText: controller.commentList[index].commentsText,
                        totalComments: controller.commentList[index].totalComments,
                        subCommentsList: controller.commentList[index].subCommentsModel,
                        commentsList: controller.commentList,
                        index: index,
                      );
                    }
                ),
              );
            }
          ),
          const SizedBox(height: 70,),
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 0,),
            Text(
              "Add A Comment".tr,
              style: AppFontStyle.whiteSemiBold14,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: SvgPicture.asset(
                AppImages.penIcon,
                height: 20,
              ),
            ),
            const SizedBox(width: 0,),
          ],
        ),
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  String image;
  String personName;
  String time;
  String commentsText;
  int totalComments;
  List<SubCommentsModel> subCommentsList;
  List<CommentsModel> commentsList;
  int index;

  CommentList({
    Key? key,
    required this.image,
    required this.personName,
    required this.time,
    required this.commentsText,
    required this.totalComments,
    required this.subCommentsList,
    required this.commentsList,
    required this.index,
  }) : super(key: key);
CommentsController commentsController=Get.put(CommentsController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(commentsList[index].personName,style: AppFontStyle.blackBold16,),
                const SizedBox(height: 5,),
                Text(commentsList[index].time,style: AppFontStyle.textGrey3Regular16,),
                const SizedBox(height: 10,),
                Text(commentsList[index].commentsText,style: AppFontStyle.blackRegular16,maxLines: 2,),
                const SizedBox(height: 7,),
                const Divider(
                  color: Color(0xffD1D1D1),
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(commentsList[index].isShow ? AppImages.disableFav : AppImages.heart,height: 16,),
                        const SizedBox(width: 10,),
                        Text("Linked".tr,style: commentsList[index].isShow ? AppFontStyle.greyRegular15 : AppFontStyle.blackRegular15, maxLines: 1,),
                      ],
                    ),
                    GetBuilder<CommentsController>(
                        init: CommentsController(),
                        id: "show",
                        builder: (controller) {
                        return InkWell(
                          onTap: (){
                            int ind = controller.commentList.indexWhere((element) => element.id == index);
                            print("index on click = $ind");
                            if(ind == index && controller.commentList[index].totalComments > 0){
                              controller.isShowList(controller.commentList[index]);
                            }
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(commentsList[index].isShow ? AppImages.disableComment : AppImages.unFillComment,height: 16,),
                              const SizedBox(width: 10,),
                              Text(commentsList[index].totalComments == 0 ?  "Comments".tr : "${commentsList[index].totalComments} " "Comments".tr,style: commentsList[index].isShow ? AppFontStyle.greyRegular15 : AppFontStyle.blackRegular15,maxLines: 1,),
                            ],
                          ),
                        );
                      }
                    ),
                    Row(
                      children: [
                        commentsController.isArabic==true?SvgPicture.asset(commentsList[index].isShow ? AppImages.disCmt3 : AppImages.cmt2,height: 16,):SvgPicture.asset(commentsList[index].isShow ? AppImages.disableReply : AppImages.reply,height: 16,),
                        const SizedBox(width: 10,),
                        Text("Reply".tr,style: commentsList[index].isShow ? AppFontStyle.greyRegular15 : AppFontStyle.blackRegular15,maxLines: 1,),
                      ],
                    ),
                  ],
                ),
                GetBuilder<CommentsController>(
                    init: CommentsController(),
                    id: "show",
                    builder: (controller) {
                      return controller.commentList[index].isShow ?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: controller.commentList[index].subCommentsModel.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,ind){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(controller.commentList[index].subCommentsModel[ind].image),
                                            ),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(controller.commentList[index].subCommentsModel[ind].personName,style: AppFontStyle.blackBold16,),
                                              const SizedBox(height: 5,),
                                              Text(controller.commentList[index].subCommentsModel[ind].time,style: AppFontStyle.textGrey3Regular16,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(controller.commentList[index].subCommentsModel[ind].commentsText,style: AppFontStyle.blackRegular16,maxLines: 2,),
                                    const SizedBox(height: 7,),
                                    const Divider(
                                      color: Color(0xffD1D1D1),
                                    ),
                                    const SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppImages.heart,height: 16,),
                                            const SizedBox(width: 10,),
                                            Text("Linked".tr,style: AppFontStyle.blackRegular14,maxLines: 1,),
                                          ],
                                        ),
                                        GetBuilder<CommentsController>(
                                            init: CommentsController(),
                                            id: "show",
                                            builder: (controller) {
                                              return InkWell(
                                                onTap: (){
                                                  // int ind = controller.commentList.indexWhere((element) => element.id == index);
                                                  // print("index on click = $ind");
                                                  // if(ind == index){
                                                  //   controller.isShowList(controller.commentList[index]);
                                                  // }
                                                },
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(AppImages.unFillComment,height: 16,),
                                                    const SizedBox(width: 10,),
                                                    Text(controller.commentList[index].subCommentsModel[ind].totalComments == 0 ?  "Comments".tr : "${controller.commentList[index].subCommentsModel[ind].totalComments} " "Comments".tr,style: AppFontStyle.blackRegular14,maxLines: 1,),
                                                  ],
                                                ),
                                              );
                                            }
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppImages.reply,height: 16,),
                                            const SizedBox(width: 10,),
                                            Text("Reply".tr,style: AppFontStyle.blackRegular14,maxLines: 1,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GetBuilder<CommentsController>(
                                        init: CommentsController(),
                                        id: "show",
                                        builder: (controller) {
                                          return controller.commentList[index].subCommentsModel[ind].isShow ?
                                          ListView.builder(
                                              itemCount: controller.commentList[index].subCommentsModel.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context,ind){
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage(controller.commentList[index].subCommentsModel[ind].image),
                                                          ),
                                                          borderRadius: BorderRadius.circular(50),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 15,),
                                                    ],
                                                  ),
                                                );
                                              })
                                              : Container();
                                        }
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )
                          : Container();
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

