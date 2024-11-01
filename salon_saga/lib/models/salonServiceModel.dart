
class Salon {
  final String name;
  final String location;
  final List<String> services;
  final String imageURL;
  final String startFrom;
  final String placeID;
  Map<String, double> serviceRatings;
  final num ratings;
  final int ratingnumbers;
  // Services provided by this salon

  Salon({required this.name, required this.location, required this.services,
    required this.imageURL, required this.startFrom, required this.placeID,
    required this.ratings, required this.ratingnumbers, required this.serviceRatings
  });
  double getServiceRating(String service) {
    return serviceRatings[service] ?? ratings.toDouble(); // Return service-specific rating or fallback to overall rating
  }
}
final List<Salon> salons = [
  Salon(name: "Black Hair & Beauty Salon", location: "Nikol",
      services: ["Hair Cut", "Shaving", "Facial"], imageURL: "assets/SalonAppAssets/SalonImages/blackSalonImage.jpg", placeID: 'ChIJj6fGWT9M4DsRpopOAPB35II',
      startFrom: "From ₹100", ratings: 3.5, ratingnumbers: 89,
      serviceRatings: {
        "Hair Cut": 3.8,
        "Shaving": 3.5,
        "Facial": 3.2,
      }),
  Salon(name: "Herik Unisex Salon", location: "Naroda",
    services: ["Hair Cut", "Hair Color", "Hair Spa", "Pedicure", "Menicure"], imageURL: "assets/SalonAppAssets/SalonImages/herikSalonImage.jpg", placeID: 'ChIJBd4g2iiHXjkRWoWPBX4-mXE',
      startFrom: "From ₹200", ratings: 4.3, ratingnumbers: 135,
      serviceRatings: {
        "Hair Cut": 4.2,
        "Hair Color": 4.2,
        "Hair Spa": 4.0,
        "Pedicure": 4.8,
        "Menicure": 4.3,
      }),
  Salon(name: "Enrich Unisex Beauty & Care", location: "Chandkheda",
    services: ["Hair Cut", "Facial", "Hair Spa", "Straightening", "Menicure"], imageURL: "assets/SalonAppAssets/SalonImages/enrichSalonImage.jpg", placeID: 'ChIJg6_0GsabXjkR6ioPW03CdZk',
      startFrom: "From ₹199", ratings: 4, ratingnumbers: 102,
      serviceRatings: {
        "Hair Cut": 3.9,
        "Facial": 4.7,
        "Hair Spa": 4.0,
        "Straightening": 3.5,
        "Menicure": 3.8
      }),
  Salon(name: "Friends Hair & Beauty Salon", location: "CG Road",
      services: ["Hair Cut", "Hair Color", "Straightening"], imageURL: "assets/SalonAppAssets/SalonImages/friendsSalonImage.jpg", placeID: 'ChIJ0bpMpFojXDkRX74w6bDlx3c',
      startFrom: "From ₹100", ratings: 4, ratingnumbers: 40,
      serviceRatings: {
        "Hair Cut": 3.9,
        "Color": 4.5,
        "Straightening": 3.6,
      }
  ),
  Salon(name: "Raj Unisex Salon", location: "Maninagar",
      services: ["Hair Cut", "Hair Spa", "Eye Brow", "Pedicure"], imageURL: "assets/SalonAppAssets/SalonImages/rajSalonImage.jpg", placeID: 'ChIJDV0Ts5ibXjkRq6uAF5drTgU',
      startFrom: "From ₹59", ratings: 3, ratingnumbers: 154,
      serviceRatings: {
        "Hair Cut": 3.5,
        "Hair Spa": 2.7,
        "Eye Brow": 3.1,
        "Pedicure": 3,
      }
  ),
  Salon(name: "The Forest Salon", location: "Vishramnagar",
      services: ["Hair Cut", "Hair Spa", "Eye Brow", "Facial"], imageURL: "assets/SalonAppAssets/SalonImages/theForestSalonImage.jpg", placeID: 'ChIJ_2rgssibXjkRUuGmtvtEqho',
      startFrom: "From ₹159", ratings: 4.2, ratingnumbers: 63,
      serviceRatings: {
        "Hair Cut": 4.2,
        "Hair Spa": 3.8,
        "Eye Brow": 4.2,
        "Facial": 4,
      }),
  Salon(name: "Maya Beauty Care", location: "Bopal",
      services: ["Hair Cut", "Hair Spa", "Straightening", "Eye Brow"], imageURL: "assets/SalonAppAssets/SalonImages/mayaSalonImage.jpg", placeID: 'ChIJF9Z06KyDXjkRi6AoNhDzgW8',
      startFrom: "From ₹100", ratings: 4.5, ratingnumbers: 122,
      serviceRatings: {
        "Hair Cut": 4.4,
        "Hair Spa": 3.9,
        "Straightening": 4.4,
        "Eye Brow": 5,
      }),
  Salon(name: "Arrow Hair & Care", location: "Prahladnagar",
      services: ["Hair Cut", "Shaving", "Eye Brow"], imageURL: "assets/SalonAppAssets/SalonImages/arrowSalonImage.jpg", placeID: 'ChIJlza39eSHXjkRjpfQ8pg_oFw',
      startFrom: "From ₹90", ratings: 3.9, ratingnumbers: 96,
      serviceRatings: {
        "Hair Cut": 3.6,
        "Shaving": 4.3,
        "Eye Brow": 3.8,
      }),
  Salon(name: "Bela's Beauty Care", location: "Nikol",
      services: ["Hair Cut", "Hair Spa", "Eye Brow", "Pedicure", "Menicure", "Eye Brow"], imageURL: "assets/SalonAppAssets/SalonImages/belasSalonImage.jpg", placeID: 'ChIJ41ndaUSHXjkR8IKIOL_DbKU',
      startFrom: "From ₹190", ratings: 4.1, ratingnumbers: 28,
      serviceRatings: {
        "Hair Cut":4.1,
        "Hair Spa": 4.5,
        "Eye Brow": 4.0,
        "Pedicure": 4.9,
        "Menicure": 4.1,
        "Eye Brow": 4.7,
      }),
  Salon(name: "Kite Salon", location: "Motera",
      services: ["Hair Cut", "Facial", "Straightening", "Eye Brow"], imageURL: "assets/SalonAppAssets/SalonImages/kiteSalonImage.jpg", placeID: 'ChIJlW1o5MeHXjkRRjyqEF_Dw2U',
      startFrom: "From ₹150", ratings: 4.7, ratingnumbers: 193,
      serviceRatings: {
        "Hair Cut":4.4,
        "Facial": 4.5,
        "Straightening": 4.9,
        "Eye Brow": 4.7,
      }),

  Salon(name: "Kalpana's Salon", location: "Parvati nagar",
      services: ["Hair Cut", "Hair Spa", "Straightening", "Menicure"], imageURL: "assets/SalonAppAssets/SalonImages/kalpanasSalonImage.jpg", placeID: 'ChIJW-vPh8-DXjkRsR81TDnpSto',
      startFrom: "From ₹100", ratings: 4.4, ratingnumbers: 79,
      serviceRatings: {
        "Hair Cut": 4.0,
        "Hair Spa": 4.8,
        "Straightening": 4.8,
        "Menicure": 3.9,
      })
  // Add more salons as needed
];

