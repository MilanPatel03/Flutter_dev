
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CommonColors.dart';


// NEAR BY's

final List<AssetImage> nearBySalons = [
  const AssetImage("assets/SalonAppAssets/homepageCard02.jpg"),
  const AssetImage("assets/SalonAppAssets/homepageCard06.jpg"),
  const AssetImage("assets/SalonAppAssets/homepageCard04.jpg"),
];

final List<String> nearbySalonNames = [
  'Black Hair & Beauty Salon',
  'Herik Unisex Salon',
  'Enrich Unisex Beauty & Care',
];
final List<String> nearbySalonLocations = [
  'Nikol, Ahmedabad',
  'Naroda, Ahmedabad',
  'Chandkheda, Ahmedabad',
];
final List<String> nearbySalonDistance = [
  '1.2 KM',
  '3.9 KM',
  '3.0 KM',
];










final List<AssetImage> cardOfHomePageImages = [
  const AssetImage("assets/SalonAppAssets/homepageCard01.jpg"),
  const AssetImage("assets/SalonAppAssets/homepageCard02.jpg"),
  const AssetImage("assets/SalonAppAssets/homepageCard05.jpg"),
];

//Commons Men's and Women's

final List<String> mensServiceCategoryTitles = [
  "Hair Cut",
  "Hair Color",
  "Straightening",
  "Hair Spa",
  "Shaving",
  "Facial",
  "Eye Brow",
];

final List<AssetImage> mensServiceCategoryIcons = [
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/hairCutIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/hairColorIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/straightenerIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/hairSpaIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/shavingIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/facialMaskIcon.png"),
  const AssetImage(
      "assets/SalonAppAssets/ServiceCategoriesIcons/eyeBrowsIcon.png"),
];

// Women's data (example, adjust as per your actual data)
final List<String> womensServiceCategoryTitles = [
  "Hair Cut",
  "Hair Color",
  "Manicure",
  "Pedicure",
  "Waxing",
  "Facial",
  "Makeup",
];

final List<AssetImage> womensServiceCategoryIcons = [
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/hairCutIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/hairColorIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/manicureIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/pedicureIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/waxingIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/facialMaskIcon.png"),
  const AssetImage("assets/SalonAppAssets/ServiceCategoriesIcons/makeupIcon.png"),
];

final List<Color> serviceCategoryColors = [
  const Color(0xFEE8C54D).withOpacity(0.3),
  const Color(0xFB91E04C).withOpacity(0.3),
  const Color(0xFB00AFD8).withOpacity(0.3),
  const Color(0xFB7065E4).withOpacity(0.3),
  const Color(0xFBB30089).withOpacity(0.3),
];

final List<String> pricesForServices = [
  "15\$",
  "20\$",
  "35\$",
  "30\$",
  "10\$",
  "25\$",
  "29\$",
  "25\$",
];

const Widget divider= Divider(
  height: 25,
  thickness: 0.5,
  color: Colors.grey,
  indent: 10,
  endIndent: 10,
);

Widget drawerTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: AppColors.brownColorApp),
    title: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
    onTap: onTap,
  );
}


