import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/salonServiceModel.dart';

class ServiceController extends GetxController {

  // List to store filtered salons based on selected service
  var finalFilteredSalons = <Salon>[].obs;


  // Method to filter salons based on selected service
  void filterSalonsByService(String service) {
    finalFilteredSalons.value = salons.where((salon) => salon.services.contains(service)).toList();
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

}