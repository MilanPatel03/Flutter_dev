import 'package:flutter/material.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';
import 'package:geetaproject/ui/views/offline/offlineslokdetailscreen.dart';
import 'package:hive/hive.dart';

import '../../../models/autherscontentmodel.dart';

class Offlineslokscreen extends StatelessWidget {
  const Offlineslokscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("slokBox");

    // // ✅ FIX: Explicitly cast the item to Map using `.cast()` to avoid _Map<dynamic, dynamic> error
    // final List<GeetaSlokModel> downloadedSlok = box.values.map((item) {
    //   final map = Map<String, dynamic>.from((item as Map).cast());
    //   return GeetaSlokModel.fromJson(map);
    // }).toList();

    // Process the Hive data

    // final List<GeetaSlokModel> downloadedSlok = box.values.map((item) {
    //   // Cast the item to a Map and ensure it's Map<String, dynamic>
    //   final map = Map<String, dynamic>.from(item as Map);
    //
    //   // Explicitly handle the translations field
    //   final translations = Map<String, dynamic>.from(map['translations'] as Map);
    //   final processedTranslations = translations.map(
    //         (key, value) => MapEntry(key, AuthorContent.fromJson(Map<String, dynamic>.from(value as Map))),
    //   );
    //
    //   // Create a new map with the processed translations
    //   final processedMap = Map<String, dynamic>.from(map)..['translations'] = processedTranslations;
    //
    //   return GeetaSlokModel.fromJson(processedMap);
    // }).toList();


    // Print the raw Hive data for debugging
    print("Hive box values: ${box.values.toList()}");


    // Filter valid GeetaSlokModel objects
    final List<GeetaSlokModel> downloadedSlok = box.values
        .where((item) => item is GeetaSlokModel && item.slok != null)
        .cast<GeetaSlokModel>()
        .toList();

    // Process the Hive data, filtering out invalid entries
    //final List<GeetaSlokModel> downloadedSlok = [];
    for (var item in box.values) {
      try {
        if (item == null || item is! Map) {
          continue; // Skip null or non-Map items
        }
        // Cast the item to a Map and ensure it's Map<String, dynamic>
        final map = Map<String, dynamic>.from(item);

        // Explicitly handle the translations field
        final translations = Map<String, dynamic>.from(map['translations'] as Map? ?? {});
        final processedTranslations = translations.map(
              (key, value) => MapEntry(
            key,
            AuthorContent.fromJson(Map<String, dynamic>.from(value as Map)),
          ),
        );

        // Create a new map with the processed translations
        final processedMap = Map<String, dynamic>.from(map)
          ..['translations'] = processedTranslations;

        downloadedSlok.add(GeetaSlokModel.fromJson(processedMap));
      } catch (e) {
        print("Error processing slok: $e");
        continue; // Skip invalid entries
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Sloks'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: downloadedSlok.isEmpty
          ? const Center(
        child: Text("No Sloks Downloaded", style: TextStyle(color: Colors.white)),)
          : ListView.builder(
        itemCount: downloadedSlok.length,
        itemBuilder: (ctx, index) {
          final slok = downloadedSlok[index];
          return ListTile(
            title: Text(
              slok.slok ?? 'No Slok Available',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              slok.transliteration ?? 'No Transliteration',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white60),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Offlineslokdetailscreen(slok: slok),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
