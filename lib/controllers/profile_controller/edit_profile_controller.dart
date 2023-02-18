import 'dart:io';

import 'package:event/utils/common_imports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController{





  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController bioController = TextEditingController();





  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {

        selectedDate = picked;
        print('date-----${selectedDate}'
        );
      update();
    }
    update();
  }



  File? imageFile1;
  // String? image1;
  getFromGallery1() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {

      // image1 = '';

      imageFile1 = File(pickedFile.path);
      // image1=imageFile1.toString();
      // print('imagefile path---${imageFile1}');
      // print('imagefile path---${image1}');
      update();

    }
  }
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {

      // image1 = '';

      imageFile1 = File(pickedFile.path);
      // image1=imageFile1.toString();
      // print('imagefile path---${imageFile1}');
      // print('imagefile path---${image1}');
      update();

    }
  }

  ///----
  choosImage(context, ) {
    // Get.defaultDialog();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: ThemeManager().getBottomNavBarColor,
          title:    Text('Choose Image',style: TextStyle(fontSize: 17, color: AppColors.primary, fontFamily: AppFontStyle.semiBold),),
          content: Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {

                      getFromCamera();
                      Get.back();

                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Icon(Icons.camera_alt, color:  AppColors.black,),
                          Text('Camera'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.semiBold),),
                        ]),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      getFromGallery1();
                      Get.back();

                    },
                    child: Column(children:  [
                      Icon(
                        Icons.image,
                        color: AppColors.black,
                      ),
                      Text('Gallery'.tr,style: TextStyle(fontSize: 17, color: AppColors.black, fontFamily: AppFontStyle.semiBold),),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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