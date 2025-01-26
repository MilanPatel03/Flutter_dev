import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'newsDetailsScreen.dart';


class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {

  final NewsService newsService = NewsService();
  Future<List<dynamic>>? newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = newsService.fetchNews('recent international/global travel updates');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news found'));
          } else {
            final newsItems = snapshot.data!;
            return ListView.builder(

              itemCount: newsItems.length,

              itemBuilder: (context, index) {
                final news = newsItems[index];
                return ListTile(

                  title: Text(news['title']),
                  subtitle: Text(news['snippet']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(url: news['link']),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class NewsService {
  static const String baseUrl = 'https://www.googleapis.com/customsearch/v1';
  static const String apiKey = 'AIzaSyA4I7YkOv0HpwykPeM0roAQzCsddswfu7Y';
  static const String searchEngineId = '128a841a32a764580';

  Future<List<dynamic>> fetchNews(String query) async {
    final response = await http.get(
        Uri.parse('$baseUrl?q=$query&key=$apiKey&cx=$searchEngineId')
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
