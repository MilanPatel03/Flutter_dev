
import 'dart:convert';
import 'package:http/http.dart' as http;


class GooglePlacesServiceOrig {
  final String apiKey = 'AIzaSyBrN8qkWosAdDkx3z9zJDLIXNougAx_nU0'; // Replace with your API key

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load place details');
    }
  }

  Future<List<dynamic>> getPlaceReviews(String placeId) async {
    final placeDetails = await getPlaceDetails(placeId);
    return placeDetails['result']['reviews'] ?? [];
  }
}