# Simple Dynamic Mini Counter App

A simple Flutter counter app with persistent storage and reactive state management.

## Features

- Increment and manage the counter dynamically.
- Persist counter data locally with `shared_preferences`.
- Efficiently retrieve and update data using Flutter Riverpod notifiers and providers.
- Restore the saved counter value when the app is reopened.

## Tech Stack

- [Flutter](https://flutter.dev/)
- [Flutter Riverpod](https://riverpod.dev/)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## How It Works

The counter state is managed by a Riverpod notifier. Whenever the value changes, it is saved to `SharedPreferences`. The notifier loads the persisted value when the app starts, allowing the counter to remain available across app launches.

## Getting Started

1. Ensure Flutter is installed and configured.
2. Clone this repository.
3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Screenshots

<!-- Add screenshots here. Example: ![Counter app screenshot](screenshots/counter.png) -->

| Home Screen | Increment | Decrement | Reset |
| ----------- | --------- | --------- | ----- |
|             |           |           |       |

## Demo Video

<!-- Add a short video or link here. Example: [Watch the app demo](path/to/demo-video.mp4) -->

| |
