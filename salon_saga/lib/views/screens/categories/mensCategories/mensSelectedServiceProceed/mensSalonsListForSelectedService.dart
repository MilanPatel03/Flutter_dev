
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_saga/controllers/serviceController.dart';
import 'package:salon_saga/views/screens/selectedSalonProcedure/salonProceedScreen.dart';

class Menssalonlistforselectedservice extends StatefulWidget {
  final String service;
  const Menssalonlistforselectedservice(
      {super.key, required this.service});

  @override
  State<Menssalonlistforselectedservice> createState() => _MenssalonlistforselectedserviceState();
}

class _MenssalonlistforselectedserviceState extends State<Menssalonlistforselectedservice> {

  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

  @override
  Widget build(BuildContext context) {
    // Get the salon controller
    final salonController = Get.find<ServiceController>();

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

    // Fetch the highest-rated salon for the selected service
    final topRatedSalon = salonController.getHighestRatedSalon(widget.service);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
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
                    "${widget.service} Salons",
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
      ),
      body: Obx(() {

        // If no salons are available for the selected service
        if (salonController.finalFilteredSalons.isEmpty) {
          return Center(
              child: Text('No salons available for ${widget.service}')
          );
        }


        // List of salons providing the selected service
        return CustomScrollView(
          slivers: [

            // This part replaces the non-scrollable content (headers)
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: primarySize, top: primarySize, bottom: primarySize),
                    child: Text(
                      "Featured ${widget.service} Salon",
                      style: GoogleFonts.kavoon(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Get.to(() => Salonproceedscreen(salon: topRatedSalon));
                    },
                    child: Container(

                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.symmetric(horizontal: primarySize),
                      padding: EdgeInsets.only(bottom: primarySize),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.black26),
                        //borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: primarySize, bottom: primarySize/2),
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'HIGHEST RATED IN '),
                                  TextSpan(
                                    text: widget.service.toUpperCase(),
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: ' CATEGORY'),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 120,
                                width: 140,
                                margin: EdgeInsets.only(left: primarySize, top: primarySize / 2, bottom: primarySize / 2),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(topRatedSalon.imageURL),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    ListTile(
                                      title: Text(
                                        topRatedSalon.name,
                                        style: GoogleFonts.kavoon(color: brownColorApp),
                                      ),
                                      subtitle: Text(
                                        topRatedSalon.location,
                                        style: GoogleFonts.mulish(color: Colors.black45, fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: primarySize),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            topRatedSalon.startFrom,
                                            style: const TextStyle(fontSize: 10, color: Colors.black45),
                                          ),
                                          Row(
                                            children: [
                                              salonController.reviewStars(topRatedSalon.ratings.toDouble()),
                                              SizedBox(width: primarySize / 4),
                                              Text(
                                                '${topRatedSalon.ratings}/5',
                                                style: const TextStyle(fontSize: 10, color: Colors.black45),
                                              ),
                                              SizedBox(width: primarySize/3),
                                              Text(
                                                '(${topRatedSalon.ratingnumbers})',
                                                style: const TextStyle(fontSize: 10, color: Colors.black45),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: primarySize),

                  Padding(
                    padding: EdgeInsets.only(left: primarySize),
                    child: Text(
                      "All ${widget.service} Salons",
                      style: GoogleFonts.kavoon(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // This part replaces the ListView.builder with SliverList
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final salon = salonController.finalFilteredSalons[index];

                  return GestureDetector(

                    onTap: (){
                      Get.to(() => Salonproceedscreen(salon: salon));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: primarySize,
                        vertical: primarySize / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 120,
                            width: 140,
                            margin: EdgeInsets.only(
                                left: primarySize / 2,
                                top: primarySize / 2,
                                bottom: primarySize / 2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(salon.imageURL),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    salonController.finalFilteredSalons[index].name,
                                    style: GoogleFonts.kavoon(
                                      color: brownColorApp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    salon.location,
                                    style: GoogleFonts.mulish(
                                      color: Colors.black45,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.only(left: primarySize),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        salon.startFrom,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          salonController.reviewStars(salon.ratings.toDouble()),
                                          SizedBox(width: primarySize / 4),
                                          Text(
                                            '${salon.ratings}/5',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          SizedBox(width: primarySize/3),
                                          Text(
                                            '(${salon.ratingnumbers})',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: salonController.finalFilteredSalons.length,
              ),
            ),
          ],
        );

      }),
    );
  }
}
