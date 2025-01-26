import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/salonServiceModel.dart';
import '../../customProcedureScreen/customSelectedSalonInfo.dart';

class Salonproceedscreen extends StatefulWidget {
  final Salon salon;

  const Salonproceedscreen({super.key, required this.salon});

  @override
  State<Salonproceedscreen> createState() => _SalonproceedscreenState();
}

class _SalonproceedscreenState extends State<Salonproceedscreen> {
  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: brownColorOfAppBar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: appbarTextColor,
                        ),
                      ),
                      //const Spacer(), // Ensures the back button is aligned to the left
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Column(
                    children: [
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0)  Customselectedsaloninfo(
                        index: index,
                        salon: widget.salon,
                      ),
                      if (index == 0) const SizedBox(height: 8.0),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
    );
  }
}
