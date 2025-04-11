import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/SelectedSalonInfo.dart';

import '../../../Commons/SalonsModel.dart';

class Salonproceedscreen extends StatefulWidget {
  final Salon salon;
  const Salonproceedscreen({super.key, required this.salon});

  @override
  State<Salonproceedscreen> createState() => _SalonproceedscreenState();
}

class _SalonproceedscreenState extends State<Salonproceedscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: AppColors.brownColorApp,
                borderRadius: BorderRadius.only(
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
                        color: AppColors.appbarTextColor,
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
                    if (index == 0)
                      Selectedsaloninfo(index: index, salon: widget.salon),
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
