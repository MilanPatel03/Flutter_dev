import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:salonverse/ApiServices/ApiServices.dart';
import 'package:salonverse/Auth/Model/OtpVerificationModel.dart';
import 'package:salonverse/Auth/Screens/LoginSignupScreen.dart';
import 'package:salonverse/BottomBar/Home/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationController extends GetxController{

  var loading = false.obs;
  var oldResponse = OtpVerificationModel().obs;

  Future<void> OtpVerificationCont (userId, OTP) async {
    try{
      loading(true);

      final newResponse = await ApiServices().otpVerification(userId, OTP);
      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;

        Get.snackbar("Login", oldResponse.value.message.toString());

        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString("userId", oldResponse.value.data!.userDetails!.id.toString());
        sh.setString("userToken", oldResponse.value.data!.token.toString());

        if (kDebugMode) {
          print("userId : ${sh.getString("userId")}");
          print("userToken : ${sh.getString("userToken")}");
        }
        
        Get.offAll(() => const homepage());
      }
    } on Exception catch(e){
      print("error: $e");
      loading(false);

    } finally{
      loading(false);
    }
  }

}
