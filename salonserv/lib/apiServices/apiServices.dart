import 'package:dio/dio.dart';
import 'package:salonserv/auth/model/LoginModel.dart';
import 'package:salonserv/auth/model/LoginOTP.dart';
import 'package:salonserv/auth/model/RegisterModel.dart';
import '../common/common_baseUrl.dart';

class ApiServices {

  Dio dio = Dio();

  //==Register==

  Future<Registermodel> register(
      FirstName,
      LastName,
      MobileNumber,
      Email,
      Gender,
      BirthDate,
      Pincode,
      Address,
      ) async {

    FormData userForm = FormData();
    
    userForm.fields.add(MapEntry("First_Name", FirstName));
    userForm.fields.add(MapEntry("Last_Name", LastName));
    userForm.fields.add(MapEntry("Mobile_Number", MobileNumber));
    userForm.fields.add(MapEntry("Email", Email));
    userForm.fields.add(MapEntry("Gender", Gender));
    userForm.fields.add(MapEntry("Birth_Date", BirthDate));
    userForm.fields.add(MapEntry("Pincode", Pincode));
    userForm.fields.add(MapEntry("Address", Address));
    userForm.fields.add(MapEntry("type", "0"));

    final userValue = await dio.post("$baseUrl/register", data: userForm);

    if(userValue.statusCode == 200) {
      final valueUser = Registermodel.fromJson(userValue.data);
      return valueUser;
    }
    throw "Something went wrong!";
  }

  //==Login==

  Future<Loginmodel> login( Mobilenumber ) async {

    FormData userForm = FormData();
    userForm.fields.add(MapEntry("Mobile_Number", Mobilenumber));

    final userValue = await dio.post("$baseUrl/login", data: userForm);

    if(userValue.statusCode == 200) {
      final valueUser = Loginmodel.fromJson(userValue.data);

      return valueUser;
    }
    throw "Something went wrong!";
  }

  //==LoginOTP==

  Future<LoginOTP> OtpVerification( userid, OTP ) async {

    FormData userForm = FormData();

    userForm.fields.add(MapEntry("userid", userid));
    userForm.fields.add(MapEntry("OTP", OTP));

    final userValue = await dio.post("$baseUrl/OTP", data: userForm);

    if(userValue.statusCode==200){
      final valueUser = LoginOTP.fromJson(userValue.data);
      return valueUser;
    }
    throw "Something went wrong!";
  }

}