# Responsive Adaptive Flutter App

A Flutter app with a clean, modern UI that works well on mobile, tablet, and large screens. The layout adapts using `MediaQuery` and `LayoutBuilder`, with responsive navigation and subtle animations for a better user experience.

## Features

- Responsive UI for mobile, tablet, and large screens
- Adaptive navigation:
  - Bottom navigation on smaller screens
  - Navigation rail on large screens
- Clean dashboard-style layout
- Smooth animations and touch feedback
- Organized and scalable folder structure

## Folder Structure

```text
lib/
├── main.dart
├── screens/
| ├──components/
├── util/
└── widgets/
```

## Responsive Techniques Used

- MediaQuery for screen size detection and adaptive spacing
- LayoutBuilder for layout changes based on available width
- Breakpoints for mobile, tablet, and large screen layouts
- Adaptive navigation widgets for different screen sizes
- Scroll-safe UI to avoid overflow issues

## UI and UX

The app keeps the interface clean by using:

- consistent spacing
- simple visual hierarchy
- responsive grids and sections
- subtle animations with touch feedback

## Screens

- Dashboard
- Reports
- Settings

## Getting Started

Clone the repo:

```bash
git clone [<your-repository-url>](https://github.com/Cybogeek/Journal-App/tree/main/responsive_app)

```

Go to the project folder:

```bash
cd <your-project-folder>
Install dependencies:
```

```bash
flutter pub get
Run the app:
```

```bash
flutter run
```

## Reuse This Project

To use this project as a starter:

1. Clone the repository
2. Rename the project if needed
3. Update pubspec.yaml
4. Run flutter pub get
5. Start customizing the screens, widgets, and utilities

## Screenshots

| Mobile | Tablet | Large Screen |
|--------|--------|--------------|
|<img alt="res-adp-mobile" src="https://github.com/user-attachments/assets/29713bf1-da6c-4deb-bbfd-25dd3e45c4c3" /> |<img alt="res-adp-tablet" src="https://github.com/user-attachments/assets/cf9eb282-0516-431d-9a2d-dc0cd7bdce3b" />|<img alt="res-adp-desktop" src="https://github.com/user-attachments/assets/65b7cb21-8056-49c4-bc83-9dfa41380096" />|

| Dashboard | Report | Settings |
|-----------|--------|----------|
|<img alt="res-adp-dash" src="https://github.com/user-attachments/assets/822f188d-a31f-4a15-8fa4-ec903098dd05" />|<img alt="res-adp-report" src="https://github.com/user-attachments/assets/2c598bb9-10ac-492b-bc1d-2f285c27f4cc" />|<img alt="res-adp-settings" src="https://github.com/user-attachments/assets/33319e20-45c3-4f43-a516-308d3d800be5" />|
