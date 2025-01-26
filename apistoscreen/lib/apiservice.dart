import 'dart:convert';
import 'package:apistoscreen/RecipesModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<RecipesModel> fetchRecipes() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"));

    if (response.statusCode == 200) {
      var dartResponse = json.decode(response.body);
      var finalData = RecipesModel.fromJson(dartResponse);
      return finalData;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
