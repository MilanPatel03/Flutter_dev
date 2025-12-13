import 'package:flutter/material.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';

class Offlineslokdetailscreen extends StatelessWidget {
  final GeetaSlokModel slok;
  const Offlineslokdetailscreen({super.key, required this.slok});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slok Detail'),
        backgroundColor: const Color.fromRGBO(28,28,30, 1),
      ),
      backgroundColor: const Color.fromRGBO(36,36,38, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(slok.slok ?? "nothing", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 10),
              Text(slok.transliteration ?? "nothing", style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.white70)),
              const SizedBox(height: 30),
              if (slok.translations.isNotEmpty)
                ...slok.translations.entries.map((entry) {
                  final value = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.author ?? "No AUther", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                        const SizedBox(height: 5),
                        if (value.et != null)
                          Text("English Translation:\n${value.et}", style: const TextStyle(color: Colors.white)),
                        if (value.ht != null)
                          Text("\nHindi Translation:\n${value.ht}", style: const TextStyle(color: Colors.white)),
                        if (value.ec != null)
                          Text("\nEnglish Commentary:\n${value.ec}", style: const TextStyle(color: Colors.white)),
                        if (value.hc != null)
                          Text("\nHindi Commentary:\n${value.hc}", style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );;
  }
}
