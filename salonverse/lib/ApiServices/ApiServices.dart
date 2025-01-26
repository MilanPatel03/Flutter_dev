import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:salonverse/Auth/Model/LoginModel.dart';
import 'package:salonverse/Auth/Model/OtpVerificationModel.dart';
import 'package:salonverse/Auth/Model/RegisterModel.dart';
import 'package:salonverse/Commons/CommonBaseURL.dart';

class ApiServices {

  Dio dio = Dio();

  //------REGISTER------\\

  Future<RegisterModel> register(
      String FirstName,
      String LastName,
      String MobileNumber,
      String Email,
      String Gender,
      String BirthDate,
      String PinCode,
      String Address
      ) async {

    FormData userForm = FormData();

    userForm.fields.add(MapEntry("First_Name", FirstName));
    userForm.fields.add(MapEntry("Last_Name", LastName));
    userForm.fields.add(MapEntry("Mobile_Number", MobileNumber));
    userForm.fields.add(MapEntry("Email", Email));
    userForm.fields.add(MapEntry("Gender", Gender));
    userForm.fields.add(MapEntry("Birth_Date", BirthDate));
    userForm.fields.add(MapEntry("Pincode", PinCode));
    userForm.fields.add(MapEntry("Address", Address));
    userForm.fields.add(MapEntry("type", "0"));

    final userValue = await dio.post("$baseUrl/register", data: userForm);

    if(userValue.statusCode == 200){
      // final responseData = jsonDecode(userValue.data);
      final valueUser = RegisterModel.fromJson(userValue.data);
      return valueUser;
    }
    throw "Something Went Wrong";
  }

  Future<OtpVerificationModel> otpVerification(userId, OTP) async {
    
    FormData userForm = FormData();
    
    userForm.fields.add(MapEntry("userid", userId));
    userForm.fields.add(MapEntry("OTP", OTP));
    
    final userValue = await dio.post("$baseUrl/OTP", data: userForm);

    if(userValue.statusCode == 200){
      final userValuef = OtpVerificationModel.fromJson(userValue.data);
      return userValuef;
    }
    throw "Something went wrong"; 
  }

  Future<LoginModel> login(String MobileNumber) async {
    
    FormData userForm = FormData();
    
    userForm.fields.add(MapEntry("Mobile_Number", MobileNumber));

    final userValue = await dio.post("$baseUrl/login", data: userForm);

    if(userValue.statusCode == 200){
      try{
        // final responseData = jsonDecode(userValue.data);
        final userValuef = LoginModel.fromJson(userValue.data);
        return userValuef;
      } catch (e) {
        // Handle decoding errors
        print("Error decoding JSON: $e");
        throw "Failed to parse response as JSON";
      }
    }

    throw "Something went wrong";
  }
}
