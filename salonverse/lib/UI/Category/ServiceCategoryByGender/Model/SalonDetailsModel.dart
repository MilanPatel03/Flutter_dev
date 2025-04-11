
class SalonDetails {
  final String name;
  final String description;
  final String operatingHours;
  final String address;
  final String contactNumber;
  final List<String> stylists;
  final List<String> products;
  final List<String> productsPrices;
  final List<String> timeSlots;

  SalonDetails({
    required this.description,
    required this.operatingHours,
    required this.address,
    required this.contactNumber,
    required this.stylists,
    required this.products,
    required this.productsPrices,
    required this.timeSlots,
    required this.name,
  });
}

final List<SalonDetails> salonDetailsList = [
  SalonDetails(
      name: "Black Hair & Beauty Salon",
      description: "Black Hair & Beauty Salon offers a classic grooming experience with expert haircuts, shaves, and facials. Our skilled team ensures you leave refreshed and confident.",
      operatingHours: "Monday-Saturday: 9 AM to 8 PM, Sunday: 10 AM to 6 PM",
      address: "Nikol Main Road, Nikol, Ahmedabad, Gujarat 382350, India",
      contactNumber: "+919123456701",
      stylists: ["Amit Patel", "Priya Sharma", "Vikram Singh"],
      products: ["Black Hair Basic Package", "Black Hair Grooming Kit", "Black Hair Premium Package"],
      productsPrices: ["500", "700", "1200"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
  ),
  SalonDetails(
      name: "Herik Unisex Salon",
      description: "Herik Unisex Salon provides a wide range of beauty services for all, from haircuts and coloring to luxurious hair spas and pedicures. Step in for a complete makeover!",
      operatingHours: "Monday-Sunday: 10 AM to 9 PM",
      address: "Naroda Road, Naroda, Ahmedabad, Gujarat 382330, India",
      contactNumber: "+919123456702",
      stylists: ["Neha Jain", "Rahul Desai", "Komal Patel"],
      products: ["Herik Hair Care Package", "Herik Spa Special", "Herik Unisex Deluxe Package"],
      productsPrices: ["600", "850", "1300"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
  ),
  SalonDetails(
      name: "Enrich Unisex Beauty & Care",
      description: "Enrich Unisex Beauty & Care is your one-stop destination for haircuts, facials, hair spas, and more. We focus on enhancing your natural beauty with top-notch care.",
      operatingHours: "Tuesday-Sunday: 10 AM to 8 PM, Monday: Closed",
      address: "Chandkheda Highway, Chandkheda, Ahmedabad, Gujarat 382424, India",
      contactNumber: "+919123456703",
      stylists: ["Suman Verma", "Karan Shah", "Pooja Mehta"],
      products: ["Enrich Beauty Essentials", "Enrich Hair Spa Package", "Enrich Premium Care"],
      productsPrices: ["550", "800", "1250"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"]
  ),
  SalonDetails(
      name: "Friends Hair & Beauty Salon",
      description: "Friends Hair & Beauty Salon brings you stylish haircuts, vibrant hair coloring, and straightening services in a friendly environment. Perfect for a quick style upgrade!",
      operatingHours: "Monday-Saturday: 9 AM to 9 PM, Sunday: 11 AM to 7 PM",
      address: "CG Road, Navrangpura, Ahmedabad, Gujarat 380009, India",
      contactNumber: "+919123456704",
      stylists: ["Riya Kapoor", "Jignesh Patel", "Anjali Rao"],
      products: ["Friends Style Package", "Friends Color Boost", "Friends Straight & Shine"],
      productsPrices: ["500", "750", "1100"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
  ),
  SalonDetails(
      name: "Raj Unisex Salon",
      description: "Raj Unisex Salon offers affordable yet quality services like haircuts, hair spas, eyebrow grooming, and pedicures. A great choice for everyday beauty needs.",
      operatingHours: "Monday-Sunday: 8 AM to 8 PM",
      address: "Maninagar East, Maninagar, Ahmedabad, Gujarat 380008, India",
      contactNumber: "+919123456705",
      stylists: ["Mohan Lal", "Shalini Gupta", "Tina Shah"],
      products: ["Raj Budget Package", "Raj Spa & Care", "Raj Complete Grooming"],
      productsPrices: ["400", "700", "1000"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"]
  ),
  SalonDetails(
      name: "The Forest Salon",
      description: "The Forest Salon combines nature-inspired ambiance with services like haircuts, hair spas, eyebrow shaping, and facials. Relax and rejuvenate with us!",
      operatingHours: "Tuesday-Saturday: 10 AM to 9 PM, Sunday: 11 AM to 6 PM, Monday: Closed",
      address: "Vishramnagar, Memnagar, Ahmedabad, Gujarat 380052, India",
      contactNumber: "+919123456706",
      stylists: ["Deepak Nair", "Swati Joshi", "Rakesh Patel"],
      products: ["The Forest Relaxation Package", "The Forest Hair Care", "The Forest Facial Kit"],
      productsPrices: ["650", "900", "1500"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
  ),
  SalonDetails(
      name: "Maya Beauty Care",
      description: "Maya Beauty Care specializes in haircuts, hair spas, straightening, and eyebrow grooming, delivering stunning results with a personal touch.",
      operatingHours: "Monday-Saturday: 10 AM to 8 PM, Sunday: 12 PM to 6 PM",
      address: "Bopal Road, Bopal, Ahmedabad, Gujarat 380058, India",
      contactNumber: "+919123456707",
      stylists: ["Kavita Singh", "Arjun Patel", "Meera Desai"],
      products: ["Maya Hair Essentials", "Maya Straightening Package", "Maya Beauty Deluxe"],
      productsPrices: ["500", "950", "1250"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "04:00 PM", "05:00 PM", "06:00 PM"]
  ),
  SalonDetails(
      name: "Arrow Hair & Care",
      description: "Arrow Hair & Care specializes in precision haircuts and grooming, offering a modern and efficient experience for all clients. Our team is dedicated to using top-tier products to ensure you leave looking your best.",
      operatingHours: "Monday-Saturday: 9 AM to 9 PM, Sunday: Closed",
      address: "Prahladnagar Road, Prahladnagar, Ahmedabad, Gujarat 380015, India",
      contactNumber: "+919123456708",
      stylists: ["Ravi Patel", "Neha Shah", "Kiran Desai"],
      products: ["Arrow ready to go package", "Arrow Premium package", "Arrow low cost package"],
      productsPrices: ["450", "1000", "350"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "06:00 PM", "07:00 PM", "08:00 PM"]
  ),
  SalonDetails(
      name: "Bela's Beauty Care",
      description: "Bela's Beauty Care offers a comprehensive beauty experience with haircuts, hair spas, pedicures, manicures, and eyebrow grooming. Pamper yourself with us!",
      operatingHours: "Monday-Sunday: 10 AM to 9 PM",
      address: "New Nikol, Nikol, Ahmedabad, Gujarat 382350, India",
      contactNumber: "+919123456709",
      stylists: ["Bela Patel", "Suresh Kumar", "Nisha Vyas"],
      products: ["Bela's Pamper Package", "Bela's Nail Care Kit", "Bela's Hair & Spa Combo"],
      productsPrices: ["700", "500", "1350"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"]
  ),
  SalonDetails(
      name: "Kite Salon",
      description: "Kite Salon provides top-quality haircuts, facials, straightening, and eyebrow services, ensuring you soar with confidence after every visit.",
      operatingHours: "Tuesday-Sunday: 10 AM to 8 PM, Monday: Closed",
      address: "Motera Stadium Road, Motera, Ahmedabad, Gujarat 380005, India",
      contactNumber: "+919123456710",
      stylists: ["Vivek Sharma", "Priti Patel", "Anil Mehta"],
      products: ["Kite Style Package", "Kite Facial Glow", "Kite Straight & Sleek"],
      productsPrices: ["600", "750", "1000"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"]
  ),
  SalonDetails(
      name: "Kalpana's Salon",
      description: "Kalpana's Salon is your go-to for haircuts, hair spas, straightening, and manicures, offering personalized care in a welcoming setting.",
      operatingHours: "Monday-Saturday: 9 AM to 8 PM, Sunday: 11 AM to 5 PM",
      address: "Parvati Nagar, Vastral, Ahmedabad, Gujarat 382418, India",
      contactNumber: "+919123456711",
      stylists: ["Kalpana Shah", "Rohan Patel", "Sneha Gupta"],
      products: ["Kalpana's Hair Care Package", "Kalpana's Straightening Kit", "Kalpana's Mani-Pedi Combo"],
      productsPrices: ["750", "900", "950"],
      timeSlots: ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM"]
  ),
];
