import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'Models/PostModel.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  //Define Array Name
  List<PostModel> postList = [];

  final GoogleSearchService _service = GoogleSearchService(

    apiKey: 'AIzaSyA4I7YkOv0HpwykPeM0roAQzCsddswfu7Y',
    searchEngineId: '128a841a32a764580',
  );

  late Future<List<SearchResult>> _futureResults;

  @override
  void initState() {
    super.initState();
    _futureResults = _service.fetchSearchResults('archeological news today');
  }

  Future<Object> getPostApi () async{

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //Now, decoding Data
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }else{
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API's"),
      ),
      body: Column(
        children: [

          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return const Text('Loading');
                  }else{
                    return ListView.builder(
            
                        itemCount: postList.length,
                        itemBuilder: (context, index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text('Title',
                                  style: (GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  )
                                  )
                              ),

                              Text(postList[index].title.toString()),

                              Text('Description',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(postList[index].body.toString()),
                            ],
                          ),
                        ),
                      );
                    }
                    );
                  }
                },
            
            ),

          ),

          Expanded(
            child: FutureBuilder<List<SearchResult>>(
              future: _futureResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final result = snapshot.data![index];
                      return ListTile(
                        title: Text(result.title),
                        subtitle: Text(result.snippet),
                        onTap: () => _launchURL(result.link),
                      );
                    },
                  );
                }
              },
          ),
          ),
        ],
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SearchResult {
  final String title;
  final String link;
  final String snippet;

  SearchResult({required this.title, required this.link, required this.snippet});

  factory SearchResult.fromJson(Map<String, dynamic> json) {

    return SearchResult(
      title: json['title'],
      link: json['link'],
      snippet: json['snippet'],
    );

  }
}


class GoogleSearchService {
  final String apiKey;
  final String searchEngineId;

  GoogleSearchService({required this.apiKey, required this.searchEngineId});

  Future<List<SearchResult>> fetchSearchResults(String query) async {
    final response = await http.get(Uri.parse(
      'https://www.googleapis.com/customsearch/v1?q=$query&key=$apiKey&cx=$searchEngineId',
    ));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final items = json['items'] as List;
      return items.map((item) => SearchResult.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}




