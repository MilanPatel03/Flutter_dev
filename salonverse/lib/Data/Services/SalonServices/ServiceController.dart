import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

import '../../../Commons/SalonsModel.dart';

class ServiceController extends GetxController {

  // List to store filtered salons based on selected service
  var finalFilteredSalons = <Salon>[].obs;

  var finalFilteredSalonDetails = <SalonDetails>[].obs;

  // Method to filter salons based on selected service
  void filterSalonsByService(String service) {
    finalFilteredSalons.value = salons.where((salon) => salon.services.contains(service)).toList();
  }

  void filterDetailsBySelectedSalon(String salonName) {
    try {
      // Find the matching SalonDetails by comparing the name
      final matchingDetail = salonDetailsList.firstWhere((detail) => detail.name == salonName);

      // Update the observable list (if needed)
      finalFilteredSalonDetails.value = [matchingDetail];
    } catch (e) {
      // No matching detail found: clear the list or handle accordingly
      finalFilteredSalonDetails.value = [];
    }
  }

  Widget reviewStars(num ratingsOutOfFive) {
    return Row(
      children: List.generate(5, (index) {
        IconData icon;
        if (ratingsOutOfFive >= index + 1) {
          icon = Icons.star; // Full star
        } else if (ratingsOutOfFive >= index + 0.5) {
          icon = Icons.star_half; // Half star
        } else {
          icon = Icons.star_border; // Empty star
        }
        return Icon(
          icon,
          color: Colors.yellow,
          size: 18, // Adjust the size as needed
        );
      }),
    );
  }


  List<String> getPlaceIDs() {
    return finalFilteredSalons.map((salon) => salon.placeID).toList();
  }


  // Method to get the highest-rated salon in a specific service category
  Salon getHighestRatedSalon(String service) {
    List<Salon> salonsWithService = salons.where((salon) => salon.services.contains(service)).toList();

    // Sort by service rating, then by review count, then by name if needed
    salonsWithService.sort((a, b) {

      double ratingA = a.getServiceRating(service);
      double ratingB = b.getServiceRating(service);

      if (ratingA != ratingB) {
        return ratingB.compareTo(ratingA); // Sort by highest rating
      } else if (a.ratingnumbers != b.ratingnumbers) {
        return b.ratingnumbers.compareTo(a.ratingnumbers); // If ratings are equal, sort by number of reviews
      } else {
        return a.name.compareTo(b.name); // If both are equal, sort alphabetically by name
      }
    });

    // Return the top-rated salon after sorting
    return salonsWithService.first;
  }



  //For sum-up the prices
  var selectedServices = <String, double>{}.obs;

  void toggleService(String service, double price, bool isSelected) {
    if (isSelected) {
      selectedServices[service] = price;
    } else {
      selectedServices.remove(service);
    }
  }

  int get selectedServicesCount => selectedServices.length;

  double get totalPrice => selectedServices.values.fold(0, (sum, item) => sum + item);

  //Stores selected stylist name and their price
  var selectedStylists = <String>{}.obs;

  void toggleStylist(String name,bool isSelected) {
    if (isSelected) {
      selectedStylists.add(name);
    } else {
      selectedStylists.remove(name);
    }
  }

  int get selectedStylistsCount => selectedStylists.length;

  int get totalStylists => selectedStylists.length;


  //
  // For selected product (package)
  var selectedProductName = ''.obs;
  var selectedProductPrice = ''.obs;

  void selectProduct(String name, String price) {
    selectedProductName.value = name;
    selectedProductPrice.value = price;
  }

  // Store selected appointment date and time slot
  var selectedDate = Rxn<DateTime>(); // nullable date
  var selectedTimeSlot = ''.obs; // time slot as string

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTimeSlot(String timeSlot) {
    selectedTimeSlot.value = timeSlot;
  }

  //Total const including package

  double get totalCostIncludingPackage {
    // Clean ₹ or other non-digit characters
    String cleanedPrice = selectedProductPrice.value.replaceAll(RegExp(r'[^\d.]'), '');
    double packageCost = double.tryParse(cleanedPrice) ?? 0;
    return totalPrice + packageCost;
  }


}