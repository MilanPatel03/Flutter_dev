import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project01/Commons/constants.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/Destinations/data/repositories/destination_repository_impl.dart';
import 'package:project01/Destinations/presentation/widgets/placeBottomSheet.dart';
import 'package:project01/Home/widgets/cached_network_card.dart';

import '../domain/models/place.dart';

class PlacesScreen extends StatelessWidget {
  final DestinationType type;
  const PlacesScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DestinationRepositoryImplementation().getPlaces(type),
        builder: (context, ss) {
          //if loading
          if(ss.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.orangeAccent.shade200),);
          }
          else if(!ss.hasData || ss.data!.isEmpty) {
            return const Center(child: Text("No Places Found",style: TextStyle(color: Colors.white70)));
          }
          else {
            final places = ss.data!;
            return ListView.builder(
              padding: AppPadding.centerPaddingOverall25(context),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return _PlaceCard(place: place);
                }
            );
          }
        }
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final Place place;
  const _PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        openPlaceBottomSheet(context, place);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),

        //decoration
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff1f1f1f),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5)),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: place.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey[800]),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white70),
              ),
            ),


            Padding(
              padding: AppPadding.centerPaddingOverall25(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(place.location, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(place.description, style: const TextStyle(color: Colors.white60, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber,size: 14),
                      const SizedBox(height: 4),
                      Text("${place.rating} ",style: const TextStyle(color: Colors.white),),
                      Text("${place.reviewsCount}", style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.6,)),
                      const Spacer(),

                      Wrap(
                        spacing: 8,
                          children: place.tags.take(3).map(
                                  (tag) => Chip(label: Text(tag,style: const TextStyle(fontSize: 10)),
                                  backgroundColor: Colors.orange.withOpacity(0.2),
                                    padding: EdgeInsets.zero,
                                  )).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



