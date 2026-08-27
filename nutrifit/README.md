# NutriFit

NutriFit is a Flutter app for exploring nutrition and fitness topics. It provides
a simple two-screen experience: users can browse topics on the home screen and
read the selected topic on its detail screen.

## Features

- Browse available nutrition and fitness topics.
- Open a topic to view its detailed information.
- Consistent Material Design interface.
- Reactive state management with Riverpod.

## App Screens

### Home Screen

The home screen is the starting point of the app. It displays the available
topics in an easy-to-browse layout. Selecting a topic navigates the user to its
detail screen.

### Detail Screen

The detail screen presents the content for the selected topic. It includes the
topic title and supporting information, with navigation back to the home screen.

## Technology and Plugins

- **Flutter** – Cross-platform UI toolkit and application framework.
- **Dart** – Programming language used to build the app.
- **Riverpod** – State management and dependency injection. It keeps topic data
  and UI updates predictable and testable.
- **Material Design** – Flutter's Material widgets and theming system, used for
  layout, navigation, typography, and visual consistency.

## Project Setup

### Prerequisites

- Flutter SDK installed and configured.
- An Android emulator, iOS simulator, or physical device.
- A code editor such as Android Studio or Visual Studio Code.

### Run the App

```bash
git clone [<repository-url>](https://github.com/Cybogeek/Journal-App/tree/main/nutrifit)
cd nutrifit
flutter pub get
flutter run
```

Run the following command to verify the project:

```bash
flutter analyze
```

## Suggested Structure

The project can be organized into the following areas:

```text
lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   └── detail_screen.dart
├── providers/
├── data/
└── models/
```

## Future Updates

- Add search, filtering, and topic categories.
- Add user profiles, favourites, and progress tracking.
- Include images, videos, recipes, and workout plans.
- Add personalised nutrition and fitness recommendations.
- Support offline content and local data persistence.
- Add reminders, notifications, and daily goals.
- Expand automated tests and accessibility support.

## Screenshots

Add screenshots of the working app below:

| Home Screen                            | Detail Screen                              |
| -------------------------------------- | ------------------------------------------ |
| <img alt="nutrifit-home" src="https://github.com/user-attachments/assets/c36333a1-76ec-476e-84f9-b2f12ecacc2c" />| <img alt="nutrifit-details" src="https://github.com/user-attachments/assets/cd246c72-a620-4243-a36e-1da8378726da" />|

| Filter Screen                            | Filter Screen                              |
| -------------------------------------- | ------------------------------------------ |
| <img alt="nutrifit-filter" src="https://github.com/user-attachments/assets/04fbab11-22ec-4833-b2a1-fd62a4764c2f" />|<img alt="nutrifit-cate" src="https://github.com/user-attachments/assets/767bb395-28d3-4ddf-9b7b-c28a9ab9a57b"/>|



## Resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Riverpod documentation](https://riverpod.dev/)
- [Material Design](https://m3.material.io/)
