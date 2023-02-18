import 'package:event/utils/common_imports.dart';

class VideosController extends GetxController{

  List<VideosLiveModel> list = [
    VideosLiveModel(personName: 'Alex Gorje'.tr,image: '${AppImages.videos1}',category: 'Pokemon World'.tr,liveTotal: '15',personImage: '${AppImages.person1}'),
    VideosLiveModel(personName: 'Emiway Berkle'.tr,image: '${AppImages.videos2}',category: 'Holi Day'.tr,liveTotal: '2',personImage: '${AppImages.person2}'),
    VideosLiveModel(personName: 'Goargia Wilson'.tr,image: '${AppImages.expo1}',category: 'Car Expo'.tr,liveTotal: '15',personImage: '${AppImages.person3}'),
    VideosLiveModel(personName: 'Alex Gorje'.tr,image: '${AppImages.videos1}',category: 'Wonder Night'.tr,liveTotal: '15',personImage: '${AppImages.person1}'),
  ];

  List<VideosHighlitesModel> highlitesList = [
    VideosHighlitesModel(personName: 'Alex Gorje'.tr,image: '${AppImages.videosImagePath}highlights1.png',category: 'Pokemon World'.tr,liveTotal: '15',personImage: '${AppImages.person1}',time: "00:13:15"),
    VideosHighlitesModel(personName: 'Emiway Berkle'.tr,image: '${AppImages.imagePath}list3.png',category: 'Holi Day'.tr,liveTotal: '2',personImage: '${AppImages.person2}',time: "00:21:15"),
    VideosHighlitesModel(personName: 'Goargia Wilson'.tr,image: '${AppImages.expo1}',category: 'Car Expo'.tr,liveTotal: '15',personImage: '${AppImages.person3}',time: "00:29:15"),
    VideosHighlitesModel(personName: 'Alex Gorje'.tr,image: '${AppImages.videos1}',category: 'Wonder Night'.tr,liveTotal: '15',personImage: '${AppImages.person1}',time: "00:45:15"),
  ];

  // List videosLiveList = [
  //   {
  //     "id": 0,
  //     "image": AppImages.expo1,
  //     "name": "Car Expo".tr,
  //     "date": "15 Jun,2022".tr,
  //     "label": "Free".tr,
  //   },
  //   {
  //     "id": 1,
  //     "image": AppImages.expo2,
  //     "name": "Conference".tr,
  //     "date": "20 Jun,2022".tr,
  //     "label": "300".tr,
  //   },
  //   {
  //     "id": 2,
  //     "image": AppImages.expo1,
  //     "name": "Fashion Show".tr,
  //     "date": "25 Jun,2022".tr,
  //     "label": "200".tr,
  //   },
  //   {
  //     "id": 3,
  //     "image": AppImages.expo2,
  //     "name": "Concert".tr,
  //     "date": "27 Jun,2022".tr,
  //     "label": "Free".tr,
  //   },
  //   {
  //     "id": 4,
  //     "image": AppImages.expo1,
  //     "name": "Bike Expo".tr,
  //     "date": "30 Jun,2022".tr,
  //     "label": "Free".tr,
  //   },
  // ];

}