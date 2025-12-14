import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinentPage extends StatefulWidget {
  final String selectedContinent;
  const ContinentPage({super.key, required this.selectedContinent});

  @override
  State<ContinentPage> createState() => _ContinentPageState();
}

class _ContinentPageState extends State<ContinentPage> {
  late String continent;
  late String bannerImage;

  // Sample data (you can replace later)
  final Map<String, String> continentImages = {
    "Asia": "assets/continentsFor/continentsPage/asia_top.webp",
    "Europe": "assets/continentsFor/continentsPage/eu_top.webp",
    "Africa": "assets/continentsFor/continentsPage/africa_top.webp",
    "Australia": "assets/continentsFor/continentsPage/australia_top.webp",
    "North America": "assets/continentsFor/continentsPage/na_top.webp",
    "South America": "assets/continentsFor/continentsPage/sa_top.webp",
    "Antarctica": "assets/continentsFor/continentsPage/antarctica_top.avif",
  };

  final Map<String, List<Map<String, String>>> topDestinations = {
    "Asia": [
      {"name": "Tokyo", "img": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/30/e4/5f/1c/caption.jpg?w=1200&h=-1&s=1&cx=1920&cy=1280&chk=v1_f985a2f288f0a671c5d2"},
      {"name": "Bali", "img": "https://i0.wp.com/gilivoyages.com/wp-content/uploads/2024/01/Watching-Sunset.webp?w=600&ssl=1"},
      {"name": "Dubai", "img": "https://www.cdn.travejar.com/storage/india_attraction_tour_image/17467078890.webp"},
    ],
    "Europe": [
      {"name": "Paris", "img": "https://freewalkingtour.com/_ipx/f_webp&q_80&s_1090x560/https://fra1.digitaloceanspaces.com/walkative-e9373acb44-cdn/media/main/products/images/Paris_tourists_guide_47286.webp"},
      {"name": "Rome", "img": "https://thumbs.dreamstime.com/b/portrait-happy-young-family-st-peter-s-basilica-church-vatican-city-rome-travel-parents-kids-european-italy-75602023.jpg"},
      {"name": "Barcelona", "img": "https://static01.nyt.com/images/2024/08/31/travel/00barcelona-backlash-wgkc/00barcelona-backlash-wgkc-articleLarge.jpg?quality=75&auto=webp&disable=upscale"},
    ],
    // Add other continents as needed...
  };

  @override
  void initState() {
    super.initState();
    continent = widget.selectedContinent;
    bannerImage = continentImages[continent] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      appBar: AppBar(
        backgroundColor: const Color(0xff181818),
        centerTitle: true,
        elevation: 0,
        title: Text(
          continent,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------------------
            // 🌄 HERO BANNER
            // -----------------------------------------
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bannerImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  continent,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black87,
                          blurRadius: 12,
                          offset: Offset(0, 3)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // -----------------------------------------
            // 📝 DESCRIPTION
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Explore the wonders of $continent. \nCulture, landscapes, food,"
                    " history and unforgettable experiences await.",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 15,
                    height: 1.4),
              ),
            ),

            const SizedBox(height: 22),

            // -----------------------------------------
            // ⭐ TOP DESTINATIONS
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top Destinations",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: topDestinations[continent]?.length ?? 0,
                itemBuilder: (context, index) {
                  final place =
                      topDestinations[continent]?[index] ?? {};
                  return _destinationCard(place["name"]!, place["img"]!);
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------
  // 🔹 Destination card widget
  // -----------------------------------------
  Widget _destinationCard(String name, String image) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}




// class _ContinentPageState extends State<ContinentPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff181818),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff181818),
//         centerTitle: true,
//         title: Text(widget.selectedContinent,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
//       ),
//       body: Center(child: Text("${widget.selectedContinent} Page"),),
//     );
//   }
// }
