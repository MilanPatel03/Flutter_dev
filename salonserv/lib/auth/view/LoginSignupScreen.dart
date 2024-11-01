import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salonserv/auth/controller/LoginController.dart';
import 'package:salonserv/auth/controller/RegisterController.dart';

class Loginsignupscreen extends StatefulWidget {
  const Loginsignupscreen({super.key});

  @override
  State<Loginsignupscreen> createState() => _LoginsignupscreenState();
}

class _LoginsignupscreenState extends State<Loginsignupscreen> {
  var index = 0;
  int value = 1;

  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);

  final RegisterController _registerController = Get.put(RegisterController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  var selectedGender;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: height*0.35,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/SalonAppAssets/Auth/LoginSignupImageSalon.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: height*0.65,
                  width: width,
                  color: Colors.white,
                ),
              ],
            ),
            Positioned(
              top: height*0.25,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: width*0.9,
                decoration: BoxDecoration(
                  color: screenColor,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  value = 1;
                                });
                              },
                              child: Text("SignIn", style: value == 1?
                              GoogleFonts.kavoon(
                                color: Colors.black,
                                fontSize: 20,
                              ): GoogleFonts.kavoon(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                              ),
                            ),
                            value == 1?
                                Container(
                                  height: height*0.004,
                                  width: width*0.18,
                                  color: brownColorApp,
                                ):Container()
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  value = 2;
                                });
                              },
                              child: Text("SignUp", style: value == 2?
                              GoogleFonts.kavoon(
                                color: Colors.black,
                                fontSize: 20,
                              ): GoogleFonts.kavoon(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                              ),
                            ),
                            value == 2?
                            Container(
                              height: height*0.004,
                              width: width*0.18,
                              color: brownColorApp,
                            ):Container()
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: height*0.03),

                    value == 1?
                    SizedBox(
                      width: width*0.9,
                      child: Column(
                        children: [
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              controller: _loginController.mobileNumberTEC,
                              decoration: InputDecoration(

                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),


                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        :
                    SizedBox(
                      width: width*0.9,
                      child: Column(
                        children: [
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              controller: _registerController.firstNameCTC,
                              decoration: InputDecoration(

                                hintText: "First Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              controller: _registerController.secondNameCTC,
                              decoration: InputDecoration(

                                hintText: "Last Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              controller: _registerController.mobileNumberCTC,
                              decoration: InputDecoration(

                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              controller: _registerController.emailCTC,
                              decoration: InputDecoration(

                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: DropdownButtonFormField(

                              decoration: InputDecoration(

                                hintText: "Select Gender",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              value : selectedGender,
                              onChanged: (value){
                                selectedGender = value;
                                _registerController.genderCTC.text = selectedGender;
                              }, items: ['Male', 'Female'].map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                            }).toList(),
                            ),
                          ),
                          SizedBox(height: height*0.03),
                          SizedBox(
                            width: width*0.8,
                            child: TextFormField(
                              onTap: (){
                                _selectDate();
                              },
                              readOnly: true,
                              controller: _registerController.birthDateCTC,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                                hintText: "Birth Date",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w300,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: brownColorApp,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1979, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        String selectedDate = DateFormat('yyyy/MM/dd').format(picked);
        _registerController.birthDateCTC.text = selectedDate.toString();
      });
    }
  }

}
