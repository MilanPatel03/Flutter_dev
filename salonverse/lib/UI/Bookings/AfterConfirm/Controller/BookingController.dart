import 'package:get/get.dart';

import '../Model/BookingModel.dart';

class BookingController extends GetxController {
  final RxList<BookingModel> bookingHistory = <BookingModel>[].obs;

  void addBooking(BookingModel booking) {
    bookingHistory.add(booking);
  }

  void clearHistory() {
    bookingHistory.clear();
  }
}
