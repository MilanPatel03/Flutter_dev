import 'dart:convert';

import 'package:geetaproject/models/geetachaptermodel.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';
import 'package:http/http.dart' as http;

class GeetaServices {

  Future<GeetaSlokModel> fetchSlok(int chapter, int verse) async {
    final url = "https://vedicscriptures.github.io/slok/$chapter/$verse";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      print("API response for slok $chapter-$verse: $jsonResponse"); // Debug log
      // Validate required fields
      if (jsonResponse['_id'] == null ||
          jsonResponse['slok'] == null ||
          jsonResponse['transliteration'] == null) {
        throw Exception("Invalid API response: missing required fields");
      }

      final finalResponse = GeetaSlokModel.fromJson(jsonResponse);
      return finalResponse;
    } else {
      throw Exception("Shlok not found at Chapter: $chapter, Verse: $verse");
    }

  }

  Future<List<GeetaChapterModel>> fetchChapter() async {
    const url = "https://vedicscriptures.github.io/chapters";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as List;
      print("API response for chapters: $jsonResponse"); // Debug log
      final finalResponse = jsonResponse.map((json) => GeetaChapterModel.fromJson(json)).toList();
      return finalResponse;
    } else {
      throw Exception("Chapters not found");
    }
  }
}