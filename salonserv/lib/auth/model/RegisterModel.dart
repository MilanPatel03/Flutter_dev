class Registermodel {
  bool? success;
  String? message;
  User? user;
  String? token;

  Registermodel({this.success, this.message, this.user});

  // Factory constructor to create an instance from JSON
  factory Registermodel.fromJson(Map<String, dynamic> json) {
    return Registermodel(
      success: json['success'],
      message: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
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

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.token,
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
    return data;
  }
}
