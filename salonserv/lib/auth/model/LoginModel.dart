class Loginmodel {
  bool? success;
  String? message;
  int? responseCode; // Add responseCode
  User? data; // Change 'user' to 'data' if that's how the API refers to it

  Loginmodel({this.success, this.message, this.responseCode, this.data});

  // Factory constructor to create an instance from JSON
  factory Loginmodel.fromJson(Map<String, dynamic> json) {
    return Loginmodel(
      success: json['success'],
      message: json['message'],
      responseCode: json['response_code'], // Map responseCode
      data: json['data'] != null ? User.fromJson(json['data']) : null, // Map data
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['response_code'] = responseCode; // Add responseCode to JSON
    if (this.data != null) {
      data['data'] = this.data!.toJson(); // Add data (User) to JSON
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? token;
  String? otp; // Add 'otp' if the API returns it in the data

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.token,
    this.otp, // Include otp in the User model
  });

  // Factory constructor to create an instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      token: json['token'],
      otp: json['otp'], // Map otp from JSON if it exists
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['token'] = token;
    data['otp'] = otp; // Add otp to JSON
    return data;
  }
}
