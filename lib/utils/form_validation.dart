import 'package:event/utils/common_imports.dart';

String? fullNameValidate(String? val) {
  if (val!.isEmpty) {
    return 'enterFullName'.tr;
  }  else {
    return null;
  }
}

String? phoneValidate(String? val) {
  if (val!.isEmpty) {
    return 'enterPhone'.tr;
  }  else {
    return null;
  }
}

String? passwordValidate(String? val) {
  if (val!.isEmpty) {
    return 'enterPassword'.tr;
  }  else {
    return null;
  }
}