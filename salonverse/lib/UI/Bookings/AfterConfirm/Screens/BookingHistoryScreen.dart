

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/BookingController.dart';

class BookingHistoryScreen extends StatelessWidget {
  final BookingController bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking History")),
      body: Obx(() {
        if (bookingController.bookingHistory.isEmpty) {
          return const Center(child: Text("No bookings yet."));
        }

        return ListView.builder(
          itemCount: bookingController.bookingHistory.length,
          itemBuilder: (context, index) {
            final booking = bookingController.bookingHistory[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(booking.salonName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stylist: ${booking.stylistName}"),
                    Text("Package: ${booking.selectedPackage}"),
                    Text("Price: ₹${booking.packagePrice}"),
                    Text("Date: ${booking.selectedDate}"),
                    Text("Time: ${booking.selectedTime}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
