
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/Services/ApiServices/ApiServices.dart';
import '../Model/LoginModel.dart';
import '../Screens/OtpVerfication.dart';

class LoginController extends GetxController{

  var loading = false.obs;
  var oldResponse = LoginModel().obs;

  TextEditingController mobileNumberTEC = TextEditingController();

  Future<void> loginCont (MobileNumber) async{

    try {
      loading(true);

      final newResponse = await ApiServices().login(MobileNumber);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;

        Get.snackbar("OTP", oldResponse.value.data!.otp.toString());

        Get.to(OtpVarificationScreen(userID: oldResponse.value.data!.userId.toString(),));
      } else {
        oldResponse = newResponse.obs;
        Get.snackbar("Login", oldResponse.value.message.toString());
      }
    } on Exception catch(e) {
      print("error: $e");
      loading(false);
    }

    finally {
      loading(false);
    }

  }
}