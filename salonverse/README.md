# salonverse

A new Flutter project.

### Salonverse: Salon Management Application
Salonverse is a comprehensive salon management solution developed as an internship project. This application is designed to streamline daily operations—including appointment scheduling, client management, and service tracking—while providing a modern, responsive user interface. My contributions to this project include designing and building the UI, implementing state management using GetX, and integrating a secure authentication process through a Postman API.

### Overview
Salonverse simplifies salon operations by providing a user-friendly platform for managing appointments, client records, and services. With a focus on delivering an engaging UI paired with robust backend integration, the application ensures both ease of use and security. The project leverages GetX for effective state management, ensuring that data flows seamlessly across the application, and utilizes Postman API testing to streamline the authentication process.

### Features
Intuitive User Interface: Designed for ease of use and optimized for multiple screen sizes.
Robust State Management: Utilizes the GetX package to ensure reactive and consistent data handling.
Secure Authentication: Integrates a secure login process using Postman API for backend verification.
Appointment Scheduling: Allows salon staff to efficiently manage bookings and appointments.
Client Management: Tracks client profiles, service histories, and preferences.
Technologies Used
Flutter & Dart: For developing a cross-platform, responsive user interface.
GetX: For state management, dependency injection, and routing.
Postman API: For testing, verifying, and integrating authentication endpoints.
RESTful API Integration: For communication with backend services.
### Installation
1. Clone the Repository:
   git clone https://github.com/your-username/salonverse.git
2. Navigate:
   cd salonverse
3. Install Dependencies
   flutter pub get
4. and run: flutter run


### Usage
Once installed, launch the application on your preferred device or emulator. Use the provided login interface to authenticate, then explore the features including appointment booking, client management, and more. The app has been optimized for responsiveness, ensuring a seamless experience across various devices.

### Development Challenges and Solutions
During the development of Salonverse, several challenges were encountered. Below is a summary of the key issues and how they were resolved:

#### 1. Authentication Process with Postman API
Challenge:
Integrating authentication was initially problematic due to inconsistent API responses. The authentication endpoint sometimes returned unexpected error messages and token-related issues, making user login unreliable.

Solution:

API Testing: Extensively used Postman to test and verify API endpoints, ensuring that request and response formats were well-understood.
Error Handling: Implemented comprehensive error handling in the authentication workflow, allowing the app to gracefully manage unexpected API responses.
Collaboration: Coordinated with the backend team to align on response structures and correct any discrepancies.
Refactoring: Adjusted parsing logic to accommodate slight deviations in API responses, ensuring a more robust and secure authentication process.
#### 2. UI Responsiveness and Layout Challenges
Challenge:
Designing a responsive UI that adapts smoothly to different screen sizes was challenging. Some components did not render correctly on smaller devices, leading to layout issues and a suboptimal user experience.

Solution:

Responsive Widgets: Leveraged Flutter’s responsive design widgets such as Flexible, Expanded, and MediaQuery to create adaptable layouts.
Testing Across Devices: Conducted thorough testing on various devices and emulators to identify layout inconsistencies.
Iterative Design: Made iterative design adjustments based on testing feedback, ensuring that the UI maintained its integrity and usability across all screen sizes.
#### 3. GetX State Management Complexities
Challenge:
Managing complex state transitions and ensuring data consistency across different components posed a significant challenge. There were instances where asynchronous updates led to temporary inconsistencies in the UI.

Solution:

Reactive Programming: Embraced GetX’s reactive programming model to ensure that UI components automatically updated in response to state changes.
Modular Code Structure: Refactored the codebase into modular components with clear separations of concern, simplifying the state management logic.
Debugging Tools: Implemented detailed logging and debugging mechanisms to trace state transitions, allowing for quick identification and resolution of issues.
Iterative Refinement: Continuously refined the state management approach, ensuring scalability and ease of maintenance for future development.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


## 📂 Project Structure

| Directory / File                           | Description |
|-------------------------------------------|-------------|
| **lib/**                                   | Main application source code |
| ├── **main.dart**                          | Entry point of the app |
| ├── **commons/**                           | Shared styles and widgets |
| │   ├── CommonColors.dart                  | App-wide color definitions |
| │   ├── TextStyles.dart                    | Common text styles used across the app |
| │   └── CommonAppbar.dart                  | Reusable custom app bar widget |
| ├── **data/**                              | Data-related files (models, repositories, services) |
| │   ├── **repositories/**                  | Data source logic and repository interfaces |
| │   └── **services/**                      | Business logic services |
| │       ├── **api_services/**              | API communication layer |
| │       │   └── ApiServices.dart           | Handles all API requests |
| │       └── **salon_services/**            | Domain-specific services |
| │           └── ServiceController.dart     | Controller for managing salon services |
| ├── **ui/**                                | User interface components |
| │   ├── **auth/**                          | Authentication module |
| │   │   ├── **controller/**                | Auth controllers |
| │   │   │   ├── LoginController.dart       | Controller for login logic |
| │   │   │   ├── OtpVerificationController.dart | Controller for OTP logic |
| │   │   │   └── RegisterController.dart    | Controller for registration |
| │   │   ├── **model/**                     | Auth models |
| │   │   │   ├── LoginModel.dart            | Login model class |
| │   │   │   ├── OtpVerificationModel.dart  | OTP model class |
| │   │   │   └── RegisterModel.dart         | Register model class |
| │   │   └── **screens/**                   | Auth UI screens |
| │   │       ├── LoginSignupScreen.dart     | Login & Sign-up screen |
| │   │       ├── OtpVerification.dart       | OTP screen |
| │   │       └── SplashScreen.dart          | Splash screen |
| │   ├── **bookings/**                      | Booking flow |
| │   │   ├── **after_confirm/**             | Post-confirmation process |
| │   │   │   ├── **controller/**            | BookingController.dart |
| │   │   │   ├── **model/**                 | BookingModel.dart |
| │   │   │   └── **screens/**               | BookingHistory.dart, SuccessfulScreen.dart |
| │   │   └── **appointment_process/**       | Booking appointment flow |
| │   │       ├── BookAppointment.dart       | Appointment selection screen |
| │   │       └── BookingReview.dart         | Final review before booking |
| │   ├── **category/**                      | Category-related screens |
| │   │   ├── **salons_by_service_category/**| Salons filtered by service |
| │   │   │   ├── **controller/**            | *(empty)* |
| │   │   │   ├── **model/**                 | SalonsByServiceCategoryModel.dart |
| │   │   │   └── **screen/**                | Gender-based service salons |
| │   │   │       ├── **mens/**              | MensSelectedServicesSalons.dart |
| │   │   │       └── **womens/**            | WomensSelectedServicesSalons.dart |
| │   │   ├── **selected_salon_procedure/**  | Flow after selecting a salon |
| │   │   │   ├── SalonProceedScreen.dart    | Main salon proceed UI |
| │   │   │   ├── **widgets/**               | Custom widgets used in salon flow |
| │   │   │   │   ├── SelectedSalonInfo.dart | Info display component |
| │   │   │   │   ├── SelectedSalonTabbar.dart | Tab bar for salon flow |
| │   │   │   │   └── **tab_four_sections/** | |
| │   │   │   │       ├── AboutSection.dart  | Salon details section |
| │   │   │   │       ├── ProductSection.dart| Salon product packages |
| │   │   │   │       ├── ServiceSection.dart| Salon services offered |
| │   │   │   │       └── StylistSection.dart| Stylist selection section |
| │   │   └── **service_category_by_gender/**| Gender-specific service logic |
| │   │       ├── **controller/**            | GetServiceCategoryByGenderController.dart |
| │   │       ├── **model/**                 | SalonDetailsModel.dart, GetServiceCategoryByGenderModel.dart |
| │   │       └── **screens/**               | GetServicesByGenderScreen.dart |
| │   ├── **home/**                          | Home screen content |
| │   │   ├── **controller/**                | *(empty)* |
| │   │   ├── **model/**                     | *(empty)* |
| │   │   └── **screens/**                   | |
| │   │       ├── HomeScreen.dart            | Main home screen |
| │   │       └── **widgets/**               | Home-specific widgets |
| │   │           ├── AutoSwipeCard.dart     | Auto-sliding card widget |
| │   │           ├── GenderSelectionWidget.dart | Gender selection UI |
| │   │           ├── HomePageBodySection.dart | Main body of home page |
| │   │           ├── NearBySalonsWidget.dart| Nearby salons carousel |
| │   │           └── SearchbarWidget.dart   | Search bar component |
| │   └── **profile/**                       | User profile management |
| │       ├── **controller/**                | EditProfileController.dart, GetProfileController.dart |
| │       ├── **model/**                     | EditProfileModel.dart, GetProfileModel.dart |
| │       └── **screens/**                   | editProfile.dart, myProfile.dart |
| └── **test/**                              | Unit and widget tests |


- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
