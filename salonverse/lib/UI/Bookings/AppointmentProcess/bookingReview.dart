import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonAssets.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Bookings/AfterConfirm/Screens/SuccessfulScreen.dart';
import '../../../Data/Services/SalonServices/ServiceController.dart';
import '../AfterConfirm/Controller/BookingController.dart';
import '../AfterConfirm/Model/BookingModel.dart';

class BookingReviewScreen extends StatelessWidget {
  final ServiceController controller = Get.find<ServiceController>();

  BookingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final halfsizewidth = size.width / 2;
    final onefourthwidth = size.width / 4;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          decoration: const BoxDecoration(
            color: AppColors.brownColorApp,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  "Booking Review",
                  style: GoogleFonts.kavoon(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            sectionTitle("Salon"),
            cardItem(controller.finalFilteredSalonDetails.isNotEmpty
                ? controller.finalFilteredSalonDetails.first.name
                : "No salon selected"),

            sectionTitle("Selected Stylists"),
            ...controller.selectedStylists.map((stylist) =>
                cardItem(stylist)),

            sectionTitle("Selected Package"),
            if (controller.selectedProductName.isNotEmpty)
              cardItem("${controller.selectedProductName} - ₹${controller.selectedProductPrice}"),

            sectionTitle("Selected Date"),
            cardItem(controller.selectedDate.value == null
                ? "No date selected"
                : "${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}"),

            sectionTitle("Selected Time Slot"),
            cardItem(controller.selectedTimeSlot.value.isEmpty
                ? "No time slot selected"
                : controller.selectedTimeSlot.value),

            sectionTitle("Selected Services"),
            ...controller.selectedServices.entries.map((entry) =>
                cardItem("${entry.key} - ₹${entry.value.toStringAsFixed(2)}")),

            sectionTitle("Total Cost Summary"),

            cardItem("Services Total: ₹${controller.totalPrice.toStringAsFixed(2)}"),
            if (controller.selectedProductName.isNotEmpty)
              cardItem("Package: ₹${controller.selectedProductPrice.value}"),

            divider,

            cardItem("Grand Total: ₹${controller.totalCostIncludingPackage.toStringAsFixed(2)}"),

            const Gap(10),

            TextButton(
              onPressed: () {

                final bookingController = Get.find<BookingController>();

                final selectedSalon = controller.finalFilteredSalonDetails.isNotEmpty
                    ? controller.finalFilteredSalonDetails.first
                    : null;

                bookingController.addBooking(
                  BookingModel(
                    salonName: selectedSalon?.name ?? "N/A",
                    stylistName: controller.selectedStylists.join(", "),
                    selectedPackage: controller.selectedProductName.value.toString(),
                    packagePrice: controller.selectedProductPrice.value.toString(),
                    selectedDate: controller.selectedDate.value != null
                        ? "${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}"
                        : "N/A",
                    selectedTime: controller.selectedTimeSlot.value,
                  ),
                );

                Get.to(() => const Successfulscreen());
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
                    "Confirm",
                    style: TextStyle(color: AppColors.brownColorApp),
                  ),
                ),
              ),
            ),

            const Gap(5),

          ],
        );
      }),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.brownColorApp,
        ),
      ),
    );
  }

  Widget cardItem(String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        border: Border.all(color: AppColors.brownColorApp.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        content,
        style: GoogleFonts.poppins(fontSize: 15),
      ),
    );
  }
}
