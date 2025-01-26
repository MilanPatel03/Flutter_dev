import 'dart:convert';

import 'CommentsModel.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<CommentsModel> fetchComments() async {

    // fetch data from the server and store it in as dart objects!
    final response = await http.get(Uri.parse("https://dummyjson.com/comments"));

    if(response.statusCode == 200){
      var dartResponse = json.decode(response.body);
      var comments = CommentsModel.fromJson(dartResponse);
      return comments;
    } else {
      throw Exception("Something went wrong");
    }

  }

}