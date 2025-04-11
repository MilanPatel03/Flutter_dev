import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:salonverse/Commons/CommonBaseURL.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UI/Auth/Model/LoginModel.dart';
import '../../../UI/Auth/Model/OtpVerificationModel.dart';
import '../../../UI/Auth/Model/RegisterModel.dart';
import '../../../UI/Category/ServiceCategoryByGender/Model/GetServiceCategoryByGenderModel.dart';
import '../../../UI/Profile/Model/EditProfileProfileModel.dart';
import '../../../UI/Profile/Model/GetProfileModel.dart';

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
    userForm.fields.add(const MapEntry("type", "0"));

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

  Future<GetServicesCategoryByGenderModel> getServicesCategory(String? genderType) async {

    FormData userForm = FormData();
    userForm.fields.add(MapEntry("GenderType",genderType ?? ""));

    SharedPreferences sh = await SharedPreferences.getInstance();
    var token = sh.getString("userToken");
    print("token $token");

    if (token == null || token.isEmpty) {
      throw "No authentication token found. Please log in.";
    }

    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final userValue = await dio.post("$baseUrl/getCategory", data: userForm);
      if (userValue.statusCode == 200) {
        final valueUser = GetServicesCategoryByGenderModel.fromJson(userValue.data);
        return valueUser;
      } else {
        throw "API request failed with status: ${userValue.statusCode}";
      }
    } on Exception catch (e) {
      throw "Failed to fetch categories: $e";
      // TODO
    }
    
  }

  Future<EditProfileProfileModel> editProfileProfile(
      firstName,
      lastName,
      mobileNumber,
      email,
      gender,
      birthDate,
      pinCode,
      address,
      profile,
      ) async {

    SharedPreferences sh = await SharedPreferences.getInstance();
    var token = sh.getString("userToken");
    var userid = sh.getString("userId");
    print("userid $userid");
    print("token $token");

    FormData userForm = FormData();
    userForm.fields.add(MapEntry("UserId",'$userid'));
    userForm.fields.add(MapEntry("First_Name",'$firstName'));
    userForm.fields.add(MapEntry("Last_Name",'$lastName'));
    userForm.fields.add(MapEntry("Mobile_Number",'$mobileNumber'));
    userForm.fields.add(MapEntry("Email",'$email'));
    userForm.fields.add(MapEntry("Gender",'$gender'));
    userForm.fields.add(MapEntry("Birth_Date",'$birthDate'));
    userForm.fields.add(MapEntry("Pincode",'$pinCode'));
    userForm.fields.add(MapEntry("Address",'$address'));
    userForm.files.add(MapEntry("profile",MultipartFile.fromFileSync(profile.path,filename: profile.path.split(Platform.pathSeparator).last)));

    dio.options.headers['Authorization'] = 'Bearer $token';

    final userValue = await dio.post("$baseUrl/EditProfileByUserId", data: userForm);

    if (userValue.statusCode == 200) {
      final valueUser = EditProfileProfileModel.fromJson(userValue.data);
      return valueUser;
    }
    throw "Something Went Wrong!!";
  }

  Future<GetProfileModel> getProfile() async {

    SharedPreferences sh = await SharedPreferences.getInstance();
    var token = sh.getString("userToken");
    var userid = sh.getString("userId");
    print("userid $userid");
    print("token $token");

    FormData userForm = FormData();
    userForm.fields.add(MapEntry("UserId",'$userid'));

    dio.options.headers['Authorization'] = 'Bearer $token';

    final userValue = await dio.post("$baseUrl/getProfileByUserId", data: userForm);

    if (userValue.statusCode == 200) {
      final valueUser = GetProfileModel.fromJson(userValue.data);
      return valueUser;
    }
    throw "Something Went Wrong!!";
  }



}
