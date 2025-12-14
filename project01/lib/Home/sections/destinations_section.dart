import 'package:flutter/material.dart';
import 'package:project01/Commons/constants.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/Destinations/presentation/destinations_home.dart';
import 'package:project01/Home/widgets/section_title.dart';


class DestinationsSection extends StatelessWidget {

  final List<String> destinations;


  const DestinationsSection({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {

    DestinationType _getTypeFromIndex(int index) {
      return DestinationType.values[index];
    }

    final orange200 = Colors.orangeAccent.shade200;
    final width = MediaQuery.of(context).size.width * 0.05;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SectionTitle("Destinations"),
        const SizedBox(height: 20),

        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (_, index) {

              //single selected type of destination is
              final selectedType = _getTypeFromIndex(index);

              return Padding(
                padding: AppPadding.centerPaddingHorizontal50(context),
                child: Column(
                  children: [
                    // Glowing + Elevated Circular Card
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DestinationsHome(type: selectedType),
                          ),
                        );
                      },
                      child: Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                          border: Border.all(color: Colors.white60, width: 1),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Icon(
                              _getIconForType(selectedType),
                              color: Colors.orangeAccent.shade200,
                              size: 32,
                              shadows: const [
                                Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 2)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Clean, readable text
                    Text(
                      destinations[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),


      ],
    );
  }

  // Beautiful icons for each destination type
  IconData _getIconForType(DestinationType type) {
    return switch (type) {
      DestinationType.wildlife => Icons.cruelty_free,
      DestinationType.hillStations => Icons.landscape,
      DestinationType.beaches => Icons.beach_access,
      DestinationType.heritage => Icons.castle_rounded,
      DestinationType.honeymoon => Icons.favorite,
      DestinationType.pilgrimage => Icons.temple_hindu,
    };
  }
}
