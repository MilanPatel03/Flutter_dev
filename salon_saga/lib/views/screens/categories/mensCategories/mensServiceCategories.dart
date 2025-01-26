
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_saga/views/screens/categories/mensCategories/mensSelectedServiceProceed/mensSalonsListForSelectedService.dart';
import '../../../../controllers/serviceController.dart';

class Mensservicecategories extends StatefulWidget {
  const Mensservicecategories({super.key});

  @override
  State<Mensservicecategories> createState() => _MensservicecategoriesState();
}


class _MensservicecategoriesState extends State<Mensservicecategories> {

  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

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

  final List<Color> mensServiceCategoryColors = [
    const Color(0xFEE8C54D).withOpacity(0.3),
    const Color(0xFB91E04C).withOpacity(0.3),
    const Color(0xFB00AFD8).withOpacity(0.3),
    const Color(0xFB7065E4).withOpacity(0.3),
    const Color(0xFBB30089).withOpacity(0.3),
  ];

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

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
                    bottomLeft: Radius.circular(10), // Adjust the radius as needed
                    bottomRight: Radius.circular(10), // Adjust the radius as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(
                    alignment: Alignment.centerLeft,
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
                      Center(
                        child: Text(
                          "Categories",
                          style: GoogleFonts.kavoon(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: appbarTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: primarySize, top: 2 * primarySize),
                child: Text(
                  "Men's Category",
                  style: GoogleFonts.kavoon(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: primarySize,
                    right: primarySize,
                    top: 2 * primarySize),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: brownColorApp,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.black,
                        )),
                    hintText: "Search Services..",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: primarySize,
                    right: primarySize,
                    top: 2 * primarySize),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: mensServiceCategoryTitles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          String selectedService = mensServiceCategoryTitles[index];
                          // 2. Use GetX to filter salons based on the selected service
                          Get.find<ServiceController>().filterSalonsByService(selectedService);
                          // 3. Navigate to the MensSalonServicesList screen, passing only the selected service
                          Get.to(() => Menssalonlistforselectedservice(service: selectedService));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: mensServiceCategoryColors[
                                      index % mensServiceCategoryColors.length],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: mensServiceCategoryIcons[index]),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              mensServiceCategoryTitles[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
