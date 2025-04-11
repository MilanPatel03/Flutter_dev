# Salonverse

Salonverse is a comprehensive Flutter-based salon booking appointment app developed as an internship project. This app streamlines the booking process by guiding users through a step-by-step flow from category selection to final confirmation and booking history. It features a modern, responsive UI, robust state management using GetX, and custom data models to handle salon details and services.

---

## 🙌 Why I Built Salonverse

This project was built as part of an internship to solve real-world booking problems using Flutter. I wanted to apply clean architecture, responsive design, and robust state management (via GetX) in a modular and scalable way. This allowed me to gain hands-on experience building production-ready apps.

---

## Project Overview

Salonverse simplifies salon operations by providing a user-friendly platform where:

- **Users choose between Men or Women categories** on the Home Screen.
- **Available services** for the selected category are displayed.
- After selecting a service, a **list of available salons** is shown—the highest-rated salon is pinned at the top while others are scrollable.
- Upon selecting a salon, users view details across four tabs:
  1. **About Section:** Salon information.
  2. **Services Section:** Service selection.
  3. **Stylists Section:** Stylist selection.
  4. **Product Kit Section:** Package selection.
- Users then choose a **date and time slot** for their appointment.
- The **summary screen** displays all selections for review.
- A **success screen** confirms the booking.
- A **Booking History** is available via the hamburger menu.

---

## Technical Architecture

### Clean and Modular Structure

- **Commons:** Shared UI styles and reusable widgets.
- **Data:**  
  - **Repositories:** Abstract data sources.
  - **Services:** Business logic and API integrations (e.g., `api_services` and `salon_services`).
- **UI:** Organized in feature-based modules (Auth, Bookings, Category, Home, Profile) following the MVC pattern:
  - **Controllers:** Business logic (e.g., filtering, toggling selections).
  - **Models:** Data structures for salon details (`SalonDetails`, `Salon`).
  - **Screens/Widgets:** User interface components.
- **Test:** Contains unit and widget tests.

*For the detailed directory view, see the [Project Structure](#-project-structure) section.*

---

## Key Components & Core Logic

- **Data Models:**  
  - *SalonDetails Model:* Detailed salon information including products, prices, time slots.
  - *Salon Model:* Summary information and helper methods for service ratings and pricing.
- **ServiceController (GetX):**  
  - Handles filtering, state management (services, stylists, product selection, appointment details), and cost calculations.
  - Generates UI elements such as dynamic star ratings.

---

## Key Features

- Category-based service flow (Men/Women)
- Dynamic service-to-salon filtering with rating-based pinning
- Multi-tab salon details (About, Services, Stylists, Product Kits)
- Robust state management with GetX
- Seamless appointment and booking history flow

---

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **GetX**
- **MVC Architecture**
- **Local Data Models**

---

## Benefits

- **Separation of Concerns:** Simplifies debugging and scaling.
- **Scalability:** Easily add new features with modular design.
- **Robust State Management:** Seamless data flow with GetX.
- **Custom Data Models:** Efficient local development without relying on external APIs.
- **Superior User Experience:** Intuitive UI flow ensures a smooth booking process.

---

## Development Challenges & Solutions

- **API Failures:** Addressed through extensive Postman testing and error handling.
- **UI Responsiveness:** Enhanced using Flutter’s Flexible, Expanded, and MediaQuery.
- **State Complexity:** Managed via modular design and GetX’s reactive model.

---

## 📸 Screenshots

![Authentication To HomeScreen](salonverse/assets/SalonAppAssets/AuthToHome.mp4)

![HomeScreen To Booking-done](salonverse/assets/SalonAppAssets/HomeToBooking.mp4)

---

## 📂 Project Structure

```plaintext
lib/
├── main.dart                      # Entry point of the app
├── commons/                       # Shared styles and reusable widgets
│   ├── CommonColors.dart
│   ├── TextStyles.dart
│   └── CommonAppbar.dart
├── data/                          # Data layer: services and repositories
│   ├── repositories/
│   └── services/
│       ├── api_services/
│       │   └── ApiServices.dart
│       └── salon_services/
│           └── ServiceController.dart
├── ui/
│   ├── auth/
│   │   ├── controller/
│   │   │   ├── LoginController.dart
│   │   │   ├── OtpVerificationController.dart
│   │   │   └── RegisterController.dart
│   │   ├── model/
│   │   │   ├── LoginModel.dart
│   │   │   ├── OtpVerificationModel.dart
│   │   │   └── RegisterModel.dart
│   │   └── screens/
│   │       ├── LoginSignupScreen.dart
│   │       ├── OtpVerification.dart
│   │       └── SplashScreen.dart
│   ├── bookings/
│   │   ├── after_confirm/
│   │   │   ├── controller/
│   │   │   │   └── BookingController.dart
│   │   │   ├── model/
│   │   │   │   └── BookingModel.dart
│   │   │   └── screens/
│   │   │       ├── BookingHistory.dart
│   │   │       └── SuccessfulScreen.dart
│   │   └── appointment_process/
│   │       ├── BookAppointment.dart
│   │       └── BookingReview.dart
│   ├── category/
│   │   ├── salons_by_service_category/
│   │   │   ├── controller/                # (empty)
│   │   │   ├── model/
│   │   │   │   └── SalonsByServiceCategoryModel.dart
│   │   │   └── screen/
│   │   │       ├── mens/
│   │   │       │   └── MensSelectedServicesSalons.dart
│   │   │       └── womens/
│   │   │           └── WomensSelectedServicesSalons.dart
│   │   ├── selected_salon_procedure/
│   │   │   ├── SalonProceedScreen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── SelectedSalonInfo.dart
│   │   │   │   └── tabs/
│   │   │   │       ├── SelectedSalonTabbar.dart
│   │   │   │       └── tab_four_sections/
│   │   │   │           ├── AboutSection.dart
│   │   │   │           ├── ProductSection.dart
│   │   │   │           ├── ServiceSection.dart
│   │   │   │           └── StylistSection.dart
│   │   └── service_category_by_gender/
│   │       ├── controller/
│   │       │   └── GetServiceCategoryByGenderController.dart
│   │       ├── model/
│   │       │   ├── SalonDetailsModel.dart
│   │       │   └── GetServiceCategoryByGenderModel.dart
│   │       └── screens/
│   │           └── GetServicesByGenderScreen.dart
│   ├── home/
│   │   ├── controller/            # (empty)
│   │   ├── model/                 # (empty)
│   │   └── screens/
│   │       ├── HomeScreen.dart
│   │       └── widgets/
│   │           ├── AutoSwipeCard.dart
│   │           ├── GenderSelectionWidget.dart
│   │           ├── HomePageBodySection.dart
│   │           ├── NearBySalonsWidget.dart
│   │           └── SearchbarWidget.dart
│   └── profile/
│       ├── controller/
│       │   ├── EditProfileController.dart
│       │   └── GetProfileController.dart
│       ├── model/
│       │   ├── EditProfileModel.dart
│       │   └── GetProfileModel.dart
│       └── screens/
│           ├── editProfile.dart
│           └── myProfile.dart
└── test/                          # Unit and widget tests


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
