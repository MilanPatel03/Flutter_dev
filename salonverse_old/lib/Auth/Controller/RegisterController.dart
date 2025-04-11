import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:salonverse/ApiServices/ApiServices.dart';
import 'package:salonverse/Auth/Model/RegisterModel.dart';
import 'package:salonverse/BottomBar/Home/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {

  var loading = false.obs;
  var oldResponse = RegisterModel().obs;

  TextEditingController firstNameCTC =TextEditingController();
  TextEditingController lastNameCTC = TextEditingController();
  TextEditingController mobileNumberCTC = TextEditingController();
  TextEditingController emailCTC = TextEditingController();
  TextEditingController genderCTC = TextEditingController();
  TextEditingController birthDateCTC = TextEditingController();
  TextEditingController pincodeCTC = TextEditingController();
  TextEditingController addressCTC = TextEditingController();

  Future<void> registerCont(FirstName, LastName, MobileNumber, Email, Gender, BirthDate, PinCode, Address, ) async {

    try{
      loading(true);

      final newResponse = await ApiServices().register(FirstName, LastName, MobileNumber, Email, Gender, BirthDate, PinCode, Address);
      if(newResponse.success == true){

        oldResponse.value = newResponse;
        Get.snackbar("SignUp", oldResponse.value.message.toString());

        // Save user data in SharedPreferences
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString("userId", oldResponse.value.user!.id.toString());
        sh.setString("userToken", oldResponse.value.token.toString());

        if (kDebugMode) {
          print("userId: ${sh.getString("userId")}");
          print("userToken: ${sh.getString("userToken")}");
        }

        // Navigate to HomePage
        Get.offAll(() => const homepage());
      }
      else{
        oldResponse.value = newResponse;
        Get.snackbar("SignUp", oldResponse.value.message.toString());
      }
    } on Exception catch(e){
      print("error: $e");
      loading(false);
      Get.snackbar("Error", "An error occurred while processing the registration.");
    }
    finally {
      loading(false);
    }
  }
}