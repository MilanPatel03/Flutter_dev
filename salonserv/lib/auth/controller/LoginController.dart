import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../apiServices/apiServices.dart';
import '../model/LoginModel.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var oldResponse = Loginmodel().obs;

  TextEditingController mobileNumberTEC = TextEditingController();

  Future<void> loginCont(String MobileNumber) async {
    try {
      loading(true);

      final newResponse = await ApiServices().login(MobileNumber);

      if (newResponse.responseCode == 1) {
        oldResponse.value = newResponse;
        Get.snackbar("OTP", oldResponse.value.data!.otp.toString()); // Access OTP from data
      } else {
        Get.snackbar("Error", "Failed to login");
      }

    } on Exception catch (e) {
      print("Error: $e");
      loading(false);

    } finally {
      loading(false);
    }
  }
}
