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

| Home Screen | Increment | Decrement |
| ----------- | --------- | --------- |
|<img alt="counter-home" src="https://github.com/user-attachments/assets/1ff31896-d422-4667-9e24-362ed3031485" />|<img alt="counter-increment" src="https://github.com/user-attachments/assets/473bb8bb-cca8-473c-a2f5-c2563612694f" />|<img alt="counter decrement" src="https://github.com/user-attachments/assets/92ac0516-deb7-4c97-bf71-85a3dc3d4769" />|

## Demo Video

| [counter-app.webm](https://github.com/user-attachments/assets/aeb3775b-b2fe-48e8-9266-e516d74ab6c3)|
