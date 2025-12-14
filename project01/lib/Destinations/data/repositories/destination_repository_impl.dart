import 'package:project01/Destinations/domain/repositories/destination_repository.dart';

import '../../../Commons/constants.dart';
import '../../domain/models/group.dart';
import '../../domain/models/news_item.dart';
import '../../domain/models/place.dart';

class DestinationRepositoryImplementation implements DestinationRepository {

  //Simulate network delay
  Future<void> _delay() {
    return Future.delayed(const Duration(milliseconds: 900));
  }

  @override
  Future<List<String>> getGroupChats(DestinationType type) async {
    await _delay();
    return [
      "General Chat",
      "Trip Planning 2026",
      "Solo Travelers",
      "Photography Lovers",
    ];
  }

  @override
  Future<List<NewsItem>> getNews(DestinationType type) async {

    await _delay();
    return _mockNews[type] ?? [];
  }

  @override
  Future<List<Place>> getPlaces(DestinationType type) async {

    await _delay();
    return _mockPlaces[type] ?? [];
  }



  // ====== MOCK DATA (Replace with real API later) ======
  // Places (expanded so groups can reference them)
  static final Map<DestinationType, List<Place>> _mockPlaces = {
    DestinationType.beaches: [
      Place(
        id: "1",
        name: "Goa Beaches",
        location: "Goa, India",
        description: "Golden sands, vibrant nightlife, Portuguese heritage.",
        imageUrl:
        "https://www.bharatbooking.com/admin/webroot/img/uploads/holiday-package-gallery/1699101891_840740-north-goa-tour-with-malvan-beach-package-slider-image.webp",
        rating: 4.8,
        reviewsCount: 3421,
        tags: ["Party", "Sunset", "Water Sports"],
      ),
      Place(
        id: "2",
        name: "Andaman Islands",
        location: "Andaman & Nicobar",
        description: "Crystal clear waters and untouched coral reefs.",
        imageUrl:
        "https://thetravellertrails.in/wp-content/uploads/2024/09/Andaman-Isles-of-Paradise_Radhanagar-Beach_2.webp",
        rating: 4.9,
        reviewsCount: 2890,
        tags: ["Peace", "Food", "Sunset", "Sea"],
      ),
      Place(
        id: "4",
        name: "Maldives Atolls",
        location: "Maldives",
        description: "Overwater bungalows, turquoise lagoons and private islands.",
        imageUrl:
            "https://untoday.org/wp-content/uploads/2025/03/15_LEISURE-1.webp",
        rating: 4.95,
        reviewsCount: 1580,
        tags: ["Luxury", "Scuba", "Privacy"],
      ),
      Place(
        id: "5",
        name: "Bondi Beach",
        location: "Sydney, Australia",
        description: "Iconic surf beach with promenade cafes and coastal walks.",
        imageUrl:
        "https://wp.viacation.com/wp-content/uploads/2025/02/925522.webp",
        rating: 4.6,
        reviewsCount: 940,
        tags: ["Surf", "Promenade", "Walks"],
      ),
    ],
    DestinationType.heritage: [
      Place(
        id: "3",
        name: "Hawa Mahal",
        location: "Jaipur, India",
        description:
        "A stunning pink sandstone palace of winds, built in 1799 by Maharaja Sawai Pratap Singh, famous for its intricate latticework and 953 small windows.",
        imageUrl: "https://www.safarmentor.com/img/gallery/hawa-mahal-in-jaipur-1982.webp",
        tags: ["Palace of Winds", "Rajasthan", "Pink City", "Rajput architecture", "honeycomb facade"],
        rating: 4.9,
        reviewsCount: 346,
      ),
      Place(
        id: "6",
        name: "Machu Picchu",
        location: "Cusco Region, Peru",
        description: "Ancient Incan citadel set high in the Andes Mountains.",
        imageUrl:
        "https://www.alpacaexpeditions.com/wp-content/webp-express/webp-images/uploads/hikking-Inca-Trail-to-Machu-Picchu-5Days-4Nights.jpg.webp",
        rating: 4.9,
        reviewsCount: 2210,
        tags: ["Inca", "Hike", "UNESCO", "High Altitude"],
      ),
      Place(
        id: "7",
        name: "Colosseum",
        location: "Rome, Italy",
        description: "Ancient Roman amphitheatre — a symbol of imperial Rome.",
        imageUrl:
        "https://assets.thelocal.com/cdn-cgi/rs:fit:1200/quality:75/plain/https://apiwp.thelocal.com/wp-content/uploads/2023/03/000_1WO2GS.jpg@webp",
        rating: 4.8,
        reviewsCount: 4320,
        tags: ["Ancient", "Roman", "UNESCO"],
      ),
    ],
    DestinationType.wildlife: [
      Place(
        id: "8",
        name: "Sundarbans National Park",
        location: "West Bengal, India",
        description: "Largest mangrove forest with Royal Bengal tiger sightings.",
        imageUrl:
        "https://static.toiimg.com/thumb/msid-95010467,width-1070,height-580,resizemode-75/95010467,pt-32,y_pad-40/95010467.jpg",
        rating: 4.7,
        reviewsCount: 810,
        tags: ["Tigers", "Mangrove", "Boat Safaris"],
      ),
      Place(
        id: "9",
        name: "Serengeti National Park",
        location: "Tanzania",
        description: "Famous for the Great Migration and big-cat sightings.",
        imageUrl:
        "https://www.contiki.com/media/pcxhri4o/26d44ac0-cc24-11ee-8b86-a3339ba36ad5-1-8.jpg?center=0.501195655171701%2C0.537294746674557&format=webp&mode=crop&width=720&height=405&quality=80",
        rating: 4.9,
        reviewsCount: 2190,
        tags: ["Safari", "Migration", "Big Five"],
      ),
    ],
    DestinationType.hillStations: [
      Place(
        id: "10",
        name: "Darjeeling",
        location: "West Bengal, India",
        description: "Tea gardens, toy train & views of Kanchenjunga.",
        imageUrl:
        "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=1200",
        rating: 4.5,
        reviewsCount: 1250,
        tags: ["Tea", "Train", "Sunrise"],
      ),
      Place(
        id: "11",
        name: "Shimla",
        location: "Himachal Pradesh, India",
        description: "Colonial architecture, mall road and mountain walks.",
        imageUrl:
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200",
        rating: 4.4,
        reviewsCount: 1790,
        tags: ["Colonial", "Walks", "Snow"],
      ),
    ],
    DestinationType.honeymoon: [
      Place(
        id: "12",
        name: "Santorini",
        location: "Greece",
        description: "Whitewashed houses, blue domes, world-class sunsets.",
        imageUrl:
        "https://excursionmania.com/cdn-cgi/image/quality=75,format=webp,w=auto,h=auto,fit=scale-down,trim=border/https://excursionmania.com/supplier/uploads/excursions/excursions/ex-3605/santorini-private-oia-village-17559335252.png",
        rating: 4.9,
        reviewsCount: 3400,
        tags: ["Sunset", "Romance", "Caldera"],
      ),
    ],
    DestinationType.pilgrimage: [
      Place(
        id: "13",
        name: "Varanasi Ghats",
        location: "Varanasi, India",
        description: "Spiritual ghats along the Ganges, ancient rituals and temples.",
        imageUrl:
        "https://www.ghumney.com/uploads/0000/19/2021/11/12/boating-in-varanasi-h.jpg",
        rating: 4.6,
        reviewsCount: 980,
        tags: ["Spiritual", "Ganga Aarti", "Temples"],
      ),
      Place(
        id: "14",
        name: "Mecca (Masjid al-Haram)",
        location: "Mecca, Saudi Arabia",
        description: "Islam's holiest city and destination for Hajj and Umrah.",
        imageUrl:
        "https://static.independent.co.uk/2023/06/27/06/Hajj_Living_in_Mecca_58907.jpg?quality=75&width=640&height=614&fit=bounds&format=pjpg&crop=16%3A9%2Coffset-y0.5&auto=webp",
        rating: 4.8,
        reviewsCount: 5000,
        tags: ["Hajj", "Pilgrimage", "Holy"],
      ),
    ],
  };

  // News for each destination type (multiple items, relative times)
  static final Map<DestinationType, List<NewsItem>> _mockNews = {
    DestinationType.beaches: [
      NewsItem(
        id: "n1",
        title: "Goa introduces eco-friendly beach shacks for 2026",
        source: "The Hindu",
        imageUrl: "https://goavillagioresort.com/wp-content/webp-express/webp-images/uploads/2025/07/Discover-top-places-to-stay-in-Goa-at-GoaVillagio-Candolim-Resort%E2%80%94ideal-for-families-couples-and-business-travelers-scaled.jpg.webp",
        publishTime: DateTime.now().subtract(const Duration(hours: 5)),
        url: "https://example.com/goa-eco-shacks-2026",
      ),
      NewsItem(
        id: "n2",
        title: "Maldives plans surge in sustainable tourism partnerships",
        source: "BBC Travel",
        imageUrl: "https://untoday.org/wp-content/uploads/2025/03/15_LEISURE-1.webp",
        publishTime: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        url: "https://example.com/maldives-sustainable-tourism",
      ),
      NewsItem(
        id: "n3",
        title: "Bondi Beach lifeguards launch safety campaign for summer",
        source: "Sydney Morning Herald",
        imageUrl: "https://wp.viacation.com/wp-content/uploads/2025/02/925522.webp",
        publishTime: DateTime.now().subtract(const Duration(days: 2, hours: 6)),
        url: "https://example.com/bondi-safety-campaign",
      ),
    ],
    DestinationType.heritage: [
      NewsItem(
        id: "n4",
        title: "Hawa Mahal restoration project receives grants",
        source: "Times of India",
        imageUrl: "https://www.safarmentor.com/img/gallery/hawa-mahal-in-jaipur-1982.webp",
        publishTime: DateTime.now().subtract(const Duration(hours: 12)),
        url: "https://example.com/hawa-mahal-restoration",
      ),
      NewsItem(
        id: "n5",
        title: "New visitor rules announced at Machu Picchu to preserve ruins",
        source: "National Geographic",
        imageUrl: "https://www.alpacaexpeditions.com/wp-content/webp-express/webp-images/uploads/hikking-Inca-Trail-to-Machu-Picchu-5Days-4Nights.jpg.webp",
        publishTime: DateTime.now().subtract(const Duration(days: 4)),
        url: "https://example.com/machu-picchu-visitor-rules",
      ),
      NewsItem(
        id: "n6",
        title: "Colosseum to open limited night tours this summer",
        source: "Rome Today",
        imageUrl: "https://assets.thelocal.com/cdn-cgi/rs:fit:1200/quality:75/plain/https://apiwp.thelocal.com/wp-content/uploads/2023/03/000_1WO2GS.jpg@webp",
        publishTime: DateTime.now().subtract(const Duration(days: 10)),
        url: "https://example.com/colosseum-night-tours",
      ),
    ],
    DestinationType.wildlife: [
      NewsItem(
        id: "n7",
        title: "Sundarbans boat safari season extended amid better sightings",
        source: "Hindustan Times",
        imageUrl: "https://static.toiimg.com/thumb/msid-95010467,width-1070,height-580,resizemode-75/95010467,pt-32,y_pad-40/95010467.jpg",
        publishTime: DateTime.now().subtract(const Duration(hours: 20)),
        url: "https://example.com/sundarbans-season-extended",
      ),
      NewsItem(
        id: "n8",
        title: "Serengeti reports healthy numbers in the Great Migration 2025",
        source: "Reuters",
        imageUrl: "https://www.contiki.com/media/pcxhri4o/26d44ac0-cc24-11ee-8b86-a3339ba36ad5-1-8.jpg?center=0.501195655171701%2C0.537294746674557&format=webp&mode=crop&width=720&height=405&quality=80",
        publishTime: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
        url: "https://example.com/serengeti-migration-2025",
      ),
    ],
    DestinationType.hillStations: [
      NewsItem(
        id: "n9",
        title: "Darjeeling tea festival returns with live tastings",
        source: "The Telegraph India",
        imageUrl: "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=800",
        publishTime: DateTime.now().subtract(const Duration(hours: 8)),
        url: "https://example.com/darjeeling-tea-festival",
      ),
      NewsItem(
        id: "n10",
        title: "Shimla gets upgraded walking paths and signage",
        source: "Himachal Herald",
        imageUrl: "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800",
        publishTime: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
        url: "https://example.com/shimla-paths-upgrade",
      ),
    ],
    DestinationType.honeymoon: [
      NewsItem(
        id: "n11",
        title: "Santorini announces new cliffside viewpoints for visitors",
        source: "Greece Travel",
        imageUrl: "https://excursionmania.com/cdn-cgi/image/quality=75,format=webp,w=auto,h=auto,fit=scale-down,trim=border/https://excursionmania.com/supplier/uploads/excursions/excursions/ex-3605/santorini-private-oia-village-17559335252.png",
        publishTime: DateTime.now().subtract(const Duration(days: 1, hours: 10)),
        url: "https://example.com/santorini-viewpoints",
      ),
      NewsItem(
        id: "n12",
        title: "Couples prefer off-season honeymoons to avoid crowds",
        source: "Travel Weekly",
        imageUrl: "https://c.ndtvimg.com/2025-11/htncbook_honeymoon_625x300_22_November_25.jpg?im=FeatureCrop,algorithm=dnn,width=1200,height=738",
        publishTime: DateTime.now().subtract(const Duration(days: 7)),
        url: "https://example.com/off-season-honeymoons",
      ),
    ],
    DestinationType.pilgrimage: [
      NewsItem(
        id: "n13",
        title: "Varanasi authorities increase Ganga Aarti arrangements for pilgrims",
        source: "Indian Express",
        imageUrl: "https://www.ghumney.com/uploads/0000/19/2021/11/12/boating-in-varanasi-h.jpg",
        publishTime: DateTime.now().subtract(const Duration(hours: 6)),
        url: "https://example.com/varanasi-ganga-aarti-arrangements",
      ),
      NewsItem(
        id: "n14",
        title: "Masjid al-Haram improves crowd flow systems ahead of Hajj",
        source: "Arab News",
        imageUrl: "https://static.independent.co.uk/2023/06/27/06/Hajj_Living_in_Mecca_58907.jpg?quality=75&width=640&height=614&fit=bounds&format=pjpg&crop=16%3A9%2Coffset-y0.5&auto=webp",
        publishTime: DateTime.now().subtract(const Duration(days: 2)),
        url: "https://example.com/masjid-al-haram-crowd-flow",
      ),
    ],
  };

  // Groups for each destination type (new map)
  static final Map<DestinationType, List<Group>> _mockGroups = {
    DestinationType.beaches: [
      Group(
        id: "g1",
        name: "Beach Party Planners",
        destinationType: DestinationType.beaches,
        description: "Group for party lovers — beach events, DJs and recommendations.",
        imageUrl:
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1000",
        membersCount: 12453,
        tags: ["Party", "Events", "Nightlife"],
        placeIds: ["1", "5"], // Goa, Bondi
      ),
      Group(
        id: "g2",
        name: "Calm Shores & Snorkel",
        destinationType: DestinationType.beaches,
        description: "For travelers who love snorkeling, sunsets and quiet shores.",
        imageUrl:
        "https://images.unsplash.com/photo-1509587584298-0b4a9f8bf7be?w=1000",
        membersCount: 3820,
        tags: ["Snorkel", "Sunset", "Relax"],
        placeIds: ["2", "4"], // Andaman, Maldives
      ),
    ],
    DestinationType.heritage: [
      Group(
        id: "g3",
        name: "World Heritage Walks",
        destinationType: DestinationType.heritage,
        description: "Share tips, itineraries and guided-walk meetups for heritage sites.",
        imageUrl:
        "https://images.unsplash.com/photo-1526772662000-3f88f10405ff?w=1000",
        membersCount: 6730,
        tags: ["Walking Tours", "UNESCO", "History"],
        placeIds: ["3", "6", "7"], // Hawa Mahal, Machu Picchu, Colosseum
      ),
      Group(
        id: "g4",
        name: "Heritage Photography",
        destinationType: DestinationType.heritage,
        description: "Focus on capturing heritage architecture and preservation stories.",
        imageUrl:
        "https://images.unsplash.com/photo-1549893070-6f7a7d19d7f0?w=1000",
        membersCount: 1890,
        tags: ["Photography", "Architecture"],
        placeIds: ["3", "7"],
      ),
    ],
    DestinationType.wildlife: [
      Group(
        id: "g5",
        name: "Big Five Trackers",
        destinationType: DestinationType.wildlife,
        description: "Safari stories, best guides, packing lists and conservation news.",
        imageUrl:
        "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1000",
        membersCount: 9021,
        tags: ["Safari", "Conservation"],
        placeIds: ["9"],
      ),
      Group(
        id: "g6",
        name: "Mangrove & Wetland Enthusiasts",
        destinationType: DestinationType.wildlife,
        description: "Boat-safari tips, local guides & mangrove protection campaigns.",
        imageUrl:
        "https://images.unsplash.com/photo-1535914254981-b5012eebbd15?w=1000",
        membersCount: 420,
        tags: ["Boats", "Conservation", "Birding"],
        placeIds: ["8"],
      ),
    ],
    DestinationType.hillStations: [
      Group(
        id: "g7",
        name: "Tea Trails & Mountain Hikes",
        destinationType: DestinationType.hillStations,
        description: "Hiking partners, tea garden tours, sunrise meetup coordination.",
        imageUrl:
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1000",
        membersCount: 2340,
        tags: ["Hiking", "Tea", "Sunrise"],
        placeIds: ["10", "11"],
      ),
      Group(
        id: "g8",
        name: "Hillstation Foodies",
        destinationType: DestinationType.hillStations,
        description: "Local cafes, must-eat street food and hidden bakeries in hill towns.",
        imageUrl:
        "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=1000",
        membersCount: 1120,
        tags: ["Food", "Cafes"],
        placeIds: ["10"],
      ),
    ],
    DestinationType.honeymoon: [
      Group(
        id: "g9",
        name: "Romantic Getaways",
        destinationType: DestinationType.honeymoon,
        description: "Couples share itineraries, villas and offbeat romantic spots.",
        imageUrl:
        "https://images.unsplash.com/photo-1505765053248-1a6d2f7d3e7f?w=1000",
        membersCount: 15890,
        tags: ["Couples", "Villas", "Sunsets"],
        placeIds: ["12"],
      ),
      Group(
        id: "g10",
        name: "Budget Honeymoon Hacks",
        destinationType: DestinationType.honeymoon,
        description: "How to plan memorable honeymoons without breaking the bank.",
        imageUrl:
        "https://images.unsplash.com/photo-1505765053248-1a6d2f7d3e7f?w=1000",
        membersCount: 2380,
        tags: ["Budget", "Deals"],
        placeIds: ["12"],
      ),
    ],
    DestinationType.pilgrimage: [
      Group(
        id: "g11",
        name: "Ganga Aarti & Pilgrim Tips",
        destinationType: DestinationType.pilgrimage,
        description: "Logistics, best times to visit and respect etiquette at ghats and temples.",
        imageUrl:
        "https://images.unsplash.com/photo-1523289333742-bea57e52f1de?w=1000",
        membersCount: 4700,
        tags: ["Aarti", "Etiquette"],
        placeIds: ["13"],
      ),
      Group(
        id: "g12",
        name: "Hajj & Umrah Planning",
        destinationType: DestinationType.pilgrimage,
        description: "Visa tips, packing lists, and health requirements for pilgrims.",
        imageUrl:
        "https://images.unsplash.com/photo-1549893070-6f7a7d19d7f0?w=1000",
        membersCount: 12000,
        tags: ["Hajj", "Umrah", "Guides"],
        placeIds: ["14"],
      ),
    ],
  };


}