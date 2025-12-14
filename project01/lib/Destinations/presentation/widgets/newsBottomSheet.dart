import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/news_item.dart';

void openNewsBottomSheet(BuildContext context, NewsItem item) {
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
        initialChildSize: 0.7,
        maxChildSize: 0.95,
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
                      imageUrl: item.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(item.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 6),
                  Text("${item.source} • ${DateTime.now().difference(item.publishTime).inHours}h ago",
                      style: const TextStyle(color: Colors.white60)),

                  const SizedBox(height: 14),
                  // Text(item.description,
                  //     style: const TextStyle(
                  //         color: Colors.white70,
                  //         fontSize: 15,
                  //         height: 1.4)),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
