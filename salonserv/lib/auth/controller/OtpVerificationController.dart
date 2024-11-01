import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:salonserv/apiServices/apiServices.dart';
import 'package:salonserv/auth/model/LoginOTP.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationController extends GetxController{

  var loading = false.obs;
  var oldResponse = LoginOTP().obs;

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> otpVerificationCont (userid,OTP) async {

    try{
      loading(true);

      final newResponse = await ApiServices().OtpVerification(userid, OTP);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.snackbar("Login", oldResponse.value.message.toString());

        fname.text = oldResponse.value.data!.userDetails!.firstName.toString();
        lname.text = oldResponse.value.data!.userDetails!.lastName.toString();
        email.text = oldResponse.value.data!.userDetails!.email.toString();

        SharedPreferences sh = await SharedPreferences.getInstance();

        sh.setString("userid", oldResponse.value.data!.userDetails!.id.toString());
        sh.setString("userToken", oldResponse.value.data!.token.toString());

        if(kDebugMode){
          print("userid: ${sh.getString("userid")}");
          print("userToken: ${sh.getString("userToken")}");
        }
      } else {
        oldResponse = newResponse.obs;
        Get.snackbar("OTP Verification", oldResponse.value.message.toString());
      }
    } on Exception catch(e){
      print("error :$e");
      loading(false);

    } finally {
      loading(false);
    }
  }
}