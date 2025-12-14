import 'package:flutter/material.dart';

enum DestinationType {
  wildlife,
  hillStations,
  beaches,
  heritage,
  honeymoon,
  pilgrimage;

  String get title {
    switch (this) {
      case DestinationType.wildlife:
        return "Wildlife";
      case DestinationType.hillStations:
        return "Hill Stations";
      case DestinationType.beaches:
        return "Beaches";
      case DestinationType.heritage:
        return "Heritage";
      case DestinationType.honeymoon:
        return "Honeymoon";
      case DestinationType.pilgrimage:
        return "Pilgrimage";
      default:
        return name[0].toUpperCase() + name.substring(1);
    }
  }
}

final List<Map<String,String>> suggestionImages = [
  {"suggestionsUrl" : 'https://cdn1.tripoto.com/media/filter/tst/img/566348/Image/1523432911_tokyotravelguide3.jpg.webp', "suggestionsName": "Timeless Tokyo",},
  {"suggestionsUrl" : 'https://preview.redd.it/toma9cpxozl31.jpg?width=1080&crop=smart&auto=webp&s=e45a97c02890c6077e24648cdd377fcaddfd5790', "suggestionsName" : "Forbidden City of Beiging"},
  {"suggestionsUrl" : 'https://wanderon-images.gumlet.io/gallery/new/2025/08/22/1755867367367-about-hawa-mahal-jaipur.webp', "suggestionsName" : "Jewel of Jaipur"},
  {"suggestionsUrl" : 'https://img.freepik.com/free-photo/ho-kham-luang-northern-thai-style-royal-flora-ratchaphruek-chiang-mai-thailand_335224-822.jpg?semt=ais_hybrid&w=740&q=80', "suggestionsName" : "Temple Trails of Chiang Mai"},
  {"suggestionsUrl" : 'https://images.travelandleisureasia.com/wp-content/uploads/sites/2/2023/01/19154518/Bali-Indonesia-809x455.jpg?tr=w-1920', "suggestionsName" : "Bali Breeze"},
  {"suggestionsUrl" : 'https://images.travelandleisureasia.com/wp-content/uploads/sites/2/2023/01/20003012/Dubai-UAE-809x455.jpg?tr=w-1920', "suggestionsName" : "Heights of Dubai"},
];

final List<Map<String, String>> suggestionsDetails = [
  {
    "suggestionsCountry": "Japan",
    "details": "Home to Tokyo’s neon skylines, ancient temples, and rich culture blending tradition with high-tech modern life."
  },
  {
    "suggestionsCountry": "China",
    "details": "A land of imperial history, iconic palaces like the Forbidden City, and a deep cultural heritage spanning thousands of years."
  },
  {
    "suggestionsCountry": "India",
    "details": "Vibrant cities, royal palaces, and diverse traditions. from Jaipur’s pink architecture to world-famous cuisine."
  },
  {
    "suggestionsCountry": "Thailand",
    "details": "Known for its serene temples, tropical landscapes, and warm hospitality, blending culture, food, and nature beautifully."
  },
  {
    "suggestionsCountry": "Indonesia",
    "details": "An island nation famous for Bali’s beaches, volcanic mountains, lush forests, and a unique blend of cultures."
  },
  {
    "suggestionsCountry": "UAE",
    "details": "A futuristic desert nation with iconic cities like Dubai, offering skyscrapers, luxury experiences, and cultural wonders."
  },
];


final List<String> destinations = [
  "Wildlife",
  "Hill stations",
  "Beaches",
  "Heritage",
  "HoneyMoon",
  "Pilgrimage",
];

final List<ImageProvider> destinationGifs = [
  const AssetImage('assets/destinationsIMAGES/wildLifeCard.jpg'),
  const AssetImage('assets/destinationsIMAGES/hillStationCard.jpg'),
  const AssetImage("assets/destinationsIMAGES/beachCARDed.jpg"),
  const AssetImage("assets/destinationsIMAGES/heritageCard02.jpg"),
  const AssetImage("assets/destinationsIMAGES/HoneyMoonCARDe.jpg"),
  const AssetImage("assets/destinationsIMAGES/pilgrimageCard03.jpg"),
];

final List<Map<String, String>> newsSites = [
  {'icon': 'assets/newsIcons/bbc.svg', "name": "BBC"},
  {'icon': 'assets/newsIcons/reuters.svg', "name": "Reuters"},
  {'icon': 'assets/newsIcons/theguardian.svg', "name": "Guardian"},
  {'icon': 'assets/newsIcons/buzzfeed.svg', "name": "BuzzFeed"},
  {'icon': 'assets/newsIcons/nbc.svg', "name": "NBC"},
  {'icon': 'assets/newsIcons/phocuswire.svg', "name": "FocusWire"},
  {'icon': 'assets/newsIcons/cnn.svg', "name" : "CNN"},
  {'icon': 'assets/newsIcons/skift.svg', "name": "Skift"},
  {'icon': 'assets/newsIcons/theindependent.svg', "name": "Independent"},
];