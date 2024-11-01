import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salonserv/auth/controller/LoginController.dart';
import 'package:salonserv/auth/controller/RegisterController.dart';

class Loginsignupscreen01 extends StatefulWidget {
  const Loginsignupscreen01({super.key});

  @override
  State<Loginsignupscreen01> createState() => _Loginsignupscreen01State();
}

class _Loginsignupscreen01State extends State<Loginsignupscreen01> {
  int currentIndex = 0;
  final RegisterController _registerController = Get.put(RegisterController());
  final LoginController _loginController = Get.put(LoginController());

  Color brownColorApp = const Color(0xFFAF7F1F);
  var selectedGender;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: height * 0.35,
                      width: width,
                      child: Stack(
                        children: [
                          // Image Background
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/SalonAppAssets/Auth/LoginSignupImageSalon.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // Brown Overlay
                          Container(
                            color: brownColorApp.withOpacity(0.3), // Semi-transparent brown color
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.65, // Extended height for scrollable area
                      width: width,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned(
                  top: height * 0.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54, width: 0.05),
                            borderRadius: BorderRadius.circular(17),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                offset: Offset(0.5, 0.01),
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() => currentIndex = 0);
                                    },
                                    child: Column(
                                      children: [
                                        Text("SignIn",
                                            style: GoogleFonts.kavoon(
                                              color: currentIndex == 0 ? Colors.black : Colors.black54,
                                              fontSize: currentIndex == 0 ? 20 : 17,
                                            )),
                                        if (currentIndex == 0)
                                          Container(
                                            height: 4,
                                            width: width * 0.18,
                                            color: brownColorApp,
                                          ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() => currentIndex = 1);
                                    },
                                    child: Column(
                                      children: [
                                        Text("SignUp",
                                            style: GoogleFonts.kavoon(
                                              color: currentIndex == 1 ? Colors.black : Colors.black54,
                                              fontSize: currentIndex == 1 ? 20 : 17,
                                            )),
                                        if (currentIndex == 1)
                                          Container(
                                            height: 4,
                                            width: width * 0.18,
                                            color: brownColorApp,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.03),
                              if (currentIndex == 0)
                                _buildSignInSection(width, height),
                              if (currentIndex == 1)
                                _buildSignUpSection(width, height),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -6,
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: height * 0.15,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(width: 0.1, color: Colors.black54),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38.withOpacity(0.5),
                                    offset: const Offset(0.5, 0.01),
                                    blurRadius: 1,
                                    blurStyle: BlurStyle.solid,
                                  )
                                ]
                            ),
                            child: Container(
                              height: height * 0.13,
                              width: width * 0.13,
                              decoration: BoxDecoration(
                                color: brownColorApp,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: _registerController.loading.value
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : _loginController.loading.value
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Icon(Icons.arrow_right_alt, color: Colors.white, size: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInSection(double width, double height) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: width * 0.8,
          height: 50,
          child: TextFormField(
            controller: _loginController.mobileNumberTEC,
            cursorColor: Colors.black,
            cursorWidth: 0.5,
            decoration: InputDecoration(
              hintText: "Mobile Number",
              hintStyle: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w300),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: brownColorApp, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSignUpSection(double width, double height) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildTextField(width, "First Name", _registerController.firstNameCTC),
        const SizedBox(height: 10),
        _buildTextField(width, "Last Name", _registerController.secondNameCTC),
        const SizedBox(height: 10),
        _buildTextField(width, "Mobile Number", _registerController.mobileNumberCTC),
        const SizedBox(height: 10),
        _buildTextField(width, "Email", _registerController.emailCTC),
        const SizedBox(height: 10),
        _buildDropdownField(width),
        const SizedBox(height: 10),
        _buildDateField(width),
        const SizedBox(height: 20), // Additional padding for scrolling
      ],
    );
  }

  Widget _buildTextField(double width, String hintText, TextEditingController controller) {
    return SizedBox(
      width: width * 0.8,
      height: 50,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        cursorWidth: 0.5,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w300),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: brownColorApp, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }

  Widget _buildDropdownField(double width) {
    return SizedBox(
      width: width * 0.8,
      height: 50,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: "Select Gender",
          hintStyle: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w300),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: brownColorApp, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
        value: selectedGender,
        onChanged: (value) {
          setState(() => selectedGender = value);
          _registerController.genderCTC.text = selectedGender;
        },
        items: ['Male', 'Female'].map((gender) {
          return DropdownMenuItem(value: gender, child: Text(gender));
        }).toList(),
      ),
    );
  }

  Widget _buildDateField(double width) {
    return SizedBox(
      width: width * 0.8,
      height: 50,
      child: GestureDetector(
        onTap: () async {
          final pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            _registerController.birthDateCTC.text = DateFormat('dd-MM-yyyy').format(pickedDate);
            setState(() {});
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: _registerController.birthDateCTC,
            cursorColor: Colors.black,
            cursorWidth: 0.5,
            decoration: InputDecoration(
              hintText: "Select Date of Birth",
              hintStyle: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w300),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: brownColorApp, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
      ),
    );
  }
}
