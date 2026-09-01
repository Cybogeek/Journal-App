# Fruits Explorer

A modern Flutter application that demonstrates **API integration** using a **clean architecture template**, with a polished UI and responsive layout.

This app uses the **Fruityvice API** to fetch fruit information and display:

- a full list of fruits
- detailed information for each fruit
- nutrition values
- search by fruit name
- theme toggle support
- adaptive layouts for different screen sizes

---

## Demo Purpose

This project is built to demonstrate:

- consuming a public REST API in Flutter
- parsing both **single object** and **list** JSON responses
- structuring a Flutter app using **clean architecture**
- managing app state with **Riverpod**
- building a modern and attractive UI using **Material UI**
- creating adaptive layouts using **LayoutBuilder** and `MediaQuery`
- improving UX with shimmer loading, pull-to-refresh, search, animations, and theme switching

---

## API Used

This app uses the **Fruityvice API**.

### Endpoints

- Get all fruits  
  `https://www.fruityvice.com/api/fruit/all`

- Get fruit by id  
  `https://www.fruityvice.com/api/fruit/{id}`

### Sample Response

```json
{
  "name": "Banana",
  "id": 1,
  "family": "Musaceae",
  "order": "Zingiberales",
  "genus": "Musa",
  "nutritions": {
    "calories": 96,
    "fat": 0.2,
    "sugar": 17.2,
    "carbohydrates": 22,
    "protein": 1
  }
}
```

## Architecture

The project follows a clean architecture template to keep the code scalable, maintainable, and easy to test.

### Layers

1. Presentation
   Handles:

- screens
- widgets
- state management
- UI interactions

2. Domain
   Handles:

- entities
- repository contracts
- use cases

3. Data
   Handles:

- models
- remote data sources
- repository implementations
- API communication

## Project Structure

```bash
lib/
├── core/
│   ├── constants/
│   ├── error/
│   └── theme/
│
├── data/
│   ├── datasource/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/
│   ├── providers/
│   ├── screens/
│   └── widgets/
│
└── main.dart
```

## Main Packages Used

| Package          | Purpose                                    |
| ---------------- | ------------------------------------------ |
| flutter_riverpod | State management                           |
| http             | API calls and REST communication           |
| shimmer          | Loading effect while data is being fetched |
| material         | Modern Material UI components              |

## Key Features

- Fetch all fruits from API
- Fetch individual fruit details
- Clean architecture implementation
- Riverpod state management
- Search fruits by name
- Theme toggle
- Shimmer loading effect
- Pull to refresh
- Retry button on error
- Hero animation between list and details screen
- Grid layout on tablet
- Adaptive UI with LayoutBuilder and MediaQuery

## Adaptive UI

The app is designed to be responsive across multiple screen sizes.

### Responsive techniques used

- LayoutBuilder for screen-based layout changes
- MediaQuery for dynamic spacing and sizing
- list layout on smaller screens
- grid layout on tablet and larger screens
- Search Feature
- The app includes a local search feature that allows users to quickly filter fruits by name.

### Example

- typing app can filter results such as Apple
- search updates the UI dynamically

### Theme Toggle

The app supports theme switching for a better user experience.

### Included modes

- Light theme
- Dark theme
  This improves usability and gives the app a more polished and modern feel.

## API Demonstration with Clean Architecture

This app is a simple but effective example of how to demonstrate API usage in Flutter with a clean template-based architecture.

### Flow

1. UI requests data through a provider
2. Provider calls a use case
3. Use case communicates with repository
4. Repository gets data from remote data source
5. Remote data source calls API using http
6. JSON response is parsed into model classes
7. Model data is returned back through domain and shown in UI

This structure keeps:

- business logic separated from UI
- networking isolated from presentation
- code reusable and maintainable

## Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- Android Studio / VS Code / IntelliJ

## Installation

```bash
git clone <your-repository-url>
cd fruits_explorer
flutter pub get
flutter run
```

## Future Improvements

Possible future enhancements:

- persistent theme selection
- debounced search
- offline caching
- favorites
- unit testing
- widget testing

## Screenshots

| Home Screen    | Search Feature     |
| -------------- | ------------------ |
| -------------- | ------------------ |
| Details Screen | Dark Theme         |
| -------------- | ------------------ |
| -------------- | ------------------ |
| Tablet Grid    | Layout Error State |
| -------------- | ------------------ |
| -------------- | ------------------ |
