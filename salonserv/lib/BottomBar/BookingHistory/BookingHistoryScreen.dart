import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatefulWidget {

  String? route;
  String? appointmentId;

  BookingHistoryScreen({super.key, required this.route, this.appointmentId});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
