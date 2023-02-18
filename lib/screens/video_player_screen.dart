import '../utils/common_imports.dart';

class VideoPlayerScreen extends StatelessWidget {
  String image;
  String personName;
  String videoTotal;
  VideoPlayerScreen({required this.image, required this.personName,required this.videoTotal});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    AppImages.videoplayerImage,
                ),
                fit: BoxFit.fill,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65,left: 20,right: 20),
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(image),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: AppColors.lime,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personName,
                          style: AppFontStyle.whiteBold14,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 7,),
                        Text(
                          videoTotal + " video upload".tr,
                          style: AppFontStyle.whiteBold14,
                        ),
                        const SizedBox(height: 7,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,),
                  // Expanded(child: Container()),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Follow".tr,
                            style: AppFontStyle.whiteSemiBold16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.4),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppImages.bg,
                    ),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12,right: 8),
                child: SvgPicture.asset(
                  AppImages.play,
                  height: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
