# Journal App

#### Version: 0.1

A simple Flutter application for writing, organizing, and reviewing personal journal entries. The app provides a clean space to record thoughts, experiences, and daily reflections.

## Features

- Create and save journal entries
- View entries in a chronological list
- Read and delete existing entries
- Add a title, current date, and detailed journal content
- Search or filter entries (where implemented) --(will be implemented in the next update)
- Responsive layout for mobile screen sizes --(will be implemented in the next update)
- Simple, distraction-free user interface

## Tools and Technologies

- **Flutter** – cross-platform application framework
- **Dart** – programming language
- **Material Design** – UI components and visual styling
- **Android Studio or Visual Studio Code** – development environment
- **Git** – source control

The project can be extended with a local database such as SQLite, Hive, or shared preferences for persistent storage, depending on the configured implementation.

## App Structure

The application follows a typical Flutter structure:

```text
lib/
├── main.dart              # Application entry point
├── model/                 # Journal entry data models
├── screens/               # Application pages and screen layouts
├── widgets/               # Reusable UI components
├── provider/              # Flutter Riverpod provider and Notifier
├── theme/                 # Colors, typography, and app theme (*--will be implemented in next update)
└── data/                  # Sample Journal Data
```

## Getting Started

### Prerequisites

- Flutter SDK installed and configured
- Dart SDK included with Flutter
- An Android emulator, iOS simulator, or physical device

### Installation

```bash
git clone (https://github.com/Cybogeek/Journal-App/tree/main/journal_app)
cd journal_app
flutter pub get
flutter run
```

To verify the project setup, run:

```bash
flutter analyze
flutter test
```

## Usage

Launch the app, create a new entry, add the required details, and save it. Select an entry to view or delete it, or use the available slide-to-delete action to remove it.

## Future Improvements

- User authentication and private journals
- Mood and category tracking
- Rich text, images, and attachments
- Cloud synchronization and backup
- Notifications for journaling reminders
- Dark mode and additional themes

## Screenshots


### Home Screen

<img width="281" height="644" alt="no-entry-home" src="https://github.com/user-attachments/assets/82bcf393-4fb3-4750-afcb-73737d228205" />
<img width="280" height="646" alt="entry-home" src="https://github.com/user-attachments/assets/6c9c37c3-2c84-48c2-92e9-fc269ad0045a" />

### Journal Entry Screen

<img width="278" height="644" alt="journal-entry-form" src="https://github.com/user-attachments/assets/692f48c2-87e9-452c-8426-ea0efc8aea98" />?

### Entry Details

https://github.com/user-attachments/assets/017162b4-abdb-4809-92c8-08331b0c3769
