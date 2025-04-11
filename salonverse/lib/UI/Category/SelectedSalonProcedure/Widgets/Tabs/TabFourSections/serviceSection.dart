import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/Data/Services/SalonServices/ServiceController.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

import '../../../../../../Commons/CommonAssets.dart';
import '../../../../../../Commons/SalonsModel.dart';

class Servicesection extends StatefulWidget {
  final SalonDetails salonDetails;
  final Salon salon;
  final TabController tabController;

  const Servicesection(
      {super.key, required this.salonDetails, required this.salon, required this.tabController});

  @override
  State<Servicesection> createState() => _ServicesectionState();
}

class _ServicesectionState extends State<Servicesection> {
  late List<bool> isCheckedList;
  final serviceController = Get.find<ServiceController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final services = widget.salon.services;
    isCheckedList = List.generate(
      services.length, (index) => serviceController.selectedServices.containsKey(services[index]),
    );
  }

  int getTotalAmount() {
    int total = 0;
    serviceController.selectedServices.forEach((_, price) {
      total += price.toInt(); // Because price is already a double
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final thisSalon = widget.salon;
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final halfsizewidth = size.width / 2;
    final onefourthwidth = size.width / 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: thisSalon.services.length,
              itemBuilder: (BuildContext context, int index) {
                String singleService = thisSalon.services[index];
                double serviceRating = thisSalon.getServiceRating(singleService); // Get rating

                // this is for random price from the list
                String servicePrice = widget.salon.getServicePrice(singleService);

                double price = double.tryParse(servicePrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
                double rating = thisSalon.getServiceRating(singleService);


                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            singleService, // FIXED
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rating: ${serviceRating.toStringAsFixed(1)} ⭐",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Service Fee: "),
                          Text(
                            servicePrice, // Show random price here
                            style:
                            const TextStyle(color: AppColors.brownColorApp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  value: isCheckedList[index],
                  onChanged: (value) {
                    setState(() {
                        isCheckedList[index] = value!;
                        serviceController.toggleService(singleService, price, value);
                      },
                    );
                  },
                  activeColor: Colors.transparent,
                  checkColor: AppColors.brownColorApp,
                );
              },
            ),
              const Gap(25),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.brownColorApp.withOpacity(0.4)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${serviceController.selectedServicesCount} services selected"),
                      Text("Total: ₹${serviceController.totalPrice.toStringAsFixed(0)}",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.brownColorApp)),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),

        const Gap(10),

        TextButton(
          onPressed: () {
            widget.tabController.animateTo(2);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: onefourthwidth / 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:
                  const BorderSide(width: 0.5, color: AppColors.brownColorApp),
            ),
          ),
          child: const SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(color: AppColors.brownColorApp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
