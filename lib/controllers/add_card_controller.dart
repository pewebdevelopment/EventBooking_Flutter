import 'package:event/utils/common_imports.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AddCardController extends GetxController{
  ///--- cmt code awesom card data ----
  // String cardNumber = '';
  // String cardHolderName = '';
  // String expiryDate = '';
  // String cvv = '';
  // bool showBack = false;
  //
  // late FocusNode focusNode;
  // TextEditingController cardNumberCtrl = TextEditingController();
  // TextEditingController expiryFieldCtrl = TextEditingController();

  ///---- credit card ---
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  InputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic= prefs.getBool('isArabic') ?? false;
    print('isarbic------${isArabic}');
    update();
  }

  @override
  void onInit() {

    // focusNode = FocusNode();
    // focusNode.addListener(() {
    //
    //     focusNode.hasFocus ? showBack = true : showBack = false;
    //
    // });
    lan();
    // border = InputBorder.none;
    border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.textGrey10,
        width: 1.0,
      ),
    );
    update();
    // getData();
  }

  @override
  void dispose() {
    // focusNode.dispose();
    super.dispose();
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {

      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    update();
  }



}