import 'dart:convert';

import 'package:http/http.dart' as http;

import 'CommentsModel.dart';

class ApiService{

  //url = https://dummyjson.com/comments

/*What URI does:

Uri Class: In Dart, the Uri class (from the dart:core library)
is used to represent Uniform Resource Identifiers (URIs).
URIs are essentially addresses or locations of resources on the internet.
parse Method: The parse method is a static method of the Uri class.
It takes a string as input and attempts to parse it into a Uri object.

Input String: In example, the input string is "https://dummyjson.com/comments".
This is a typical URL string.
Output: The parse method, when successful, returns a Uri object.
This object contains the parsed components of the URL,
such as the scheme (https), host (dummyjson.com), and path (/comments).

  Scheme: https (indicating a secure HTTP connection)
  Host: dummyjson.com (the domain name)
  Path: /comments (the specific resource path)

*/

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