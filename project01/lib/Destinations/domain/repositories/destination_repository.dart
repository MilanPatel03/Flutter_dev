import 'package:project01/Destinations/domain/models/news_item.dart';
import 'package:project01/Destinations/domain/models/place.dart';

import '../../../Commons/constants.dart';

abstract class DestinationRepository {
  Future<List<Place>> getPlaces(DestinationType type);
  Future<List<NewsItem>> getNews(DestinationType type);
  Future<List<String>> getGroupChats(DestinationType type); //just mock
}