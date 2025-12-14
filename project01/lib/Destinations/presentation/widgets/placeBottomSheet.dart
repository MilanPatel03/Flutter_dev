import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/place.dart';

void openPlaceBottomSheet(BuildContext context, Place place) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xff1e1e1e),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.65,
        minChildSize: 0.45,
        maxChildSize: 0.92,
        builder: (_, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CachedNetworkImage(
                      imageUrl: place.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(place.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 6),
                  Text(place.location,
                      style: const TextStyle(
                          color: Colors.white60, fontSize: 14)),

                  const SizedBox(height: 12),
                  Text(place.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.4,
                      )),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      const Icon(Icons.star,
                          size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text("${place.rating}",
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 6),
                      Text("(${place.reviewsCount} reviews)",
                          style: const TextStyle(color: Colors.white54)),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    children: place.tags
                        .map((tag) => Chip(
                      label: Text(tag,
                          style: const TextStyle(fontSize: 10)),
                      backgroundColor:
                      Colors.orange.withOpacity(0.25),
                    ))
                        .toList(),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
