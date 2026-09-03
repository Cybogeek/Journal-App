# Todo App

A modern Flutter TODO application built with **clean architecture**, **Riverpod**, and **Firebase**.

This app allows authenticated users to manage their personal todo items with a polished UI, responsive layouts, theme customization, and account-isolated cloud storage.

---

## Overview

The app is designed to demonstrate:

- clean and scalable Flutter architecture
- Firebase Authentication
- Cloud Firestore integration
- Riverpod 3.x state management
- adaptive UI using `LayoutBuilder` and `MediaQuery`
- theme switching and theme color selection
- responsive task management experience

Each user can:

- sign up
- log in
- create todos
- view todos
- edit todos
- delete todos
- toggle completion state
- search todos
- customize theme mode and accent color

---

## Architecture

This project follows a layered clean architecture approach:

- `core`
- `data`
- `domain`
- `presentation`

### Layer Responsibilities

#### 1. Core

Contains shared app-wide utilities such as:

- constants
- theme setup
- exceptions
- local preference storage helpers

#### 2. Data

Responsible for:

- Firebase data sources
- models
- repository implementations
- mapping Firestore/Auth data into app objects

#### 3. Domain

Responsible for:

- entities
- repository contracts
- use cases

#### 4. Presentation

Responsible for:

- Riverpod providers/controllers
- screens
- widgets
- UI interaction and state rendering

---

## Project Structure

```bash
lib/
├── core/
│   ├── constants/
│   ├── error/
│   ├── storage/
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
├── firebase_options.dart
└── main.dart
```

## Main Packages Used

| Package            | Purpose                              |
| ------------------ | ------------------------------------ |
| flutter_riverpod   | State management using Riverpod 3.x  |
| firebase_core      | Firebase initialization              |
| firebase_auth      | User authentication                  |
| cloud_firestore    | Cloud database for todos             |
| shared_preferences | Local persistence for theme settings |
| shimmer            | Loading placeholder effects          |
| google_fonts       | Improved typography                  |
| material           | Modern Material UI components        |

## Core Features

### Authentication

- email/password signup
- email/password login
- logout
- auth-based route handling

### Todo Management

- create todo
- edit todo
- delete todo using Dismissible
- toggle complete/incomplete
- show details in modal bottom sheet

### Search

- local search/filter by title or description

### Theme Customization

- light and dark mode
- theme toggle
- color picker popup for accent/theme color
- theme persistence

### UI / UX

- shimmer loading states
- retry on error
- empty state UI
- responsive layout for phone and tablet
- modern Material style

## Riverpod State Management

This app uses Riverpod 3.x style provider patterns.

### Provider Types Used

- _Provider_
  - dependency injection
  - Firebase instances
  - repositories
  - use cases
  - helpers

- _StreamProvider_
  - authentication state
  - live todo stream from Firestore

- _NotifierProvider_
  - local UI state like search query

- _AsyncNotifierProvider_

- _async mutable operations such as:_
- login
- signup
- logout
- add todo
- update todo
- delete todo
- toggle todo state
- theme loading and persistence

## Firestore Structure

_text_

```bash
users/{uid}
users/{uid}/todos/{todoId}
```

### User Document Example

```json
{
  "uid": "user_uid_here",
  "email": "user@example.com",
  "createdAt": "timestamp"
}
```

### Todo Document Example

```json
{
  "userId": "user_uid_here",
  "title": "Buy groceries",
  "description": "Milk, fruits, eggs, bread",
  "isCompleted": false,
  "createdAt": "timestamp",
  "updatedAt": "timestamp",
  "dueDate": null,
  "colorValue": 4283215696
}
```

### Why this structure is used?

- keeps user data isolated
- simplifies secure Firestore rules
- makes per-user queries clean and efficient
- fits real-world multi-user app behavior

### Search Behavior

The home screen includes a search bar to filter todos locally.

Search checks:

- todo title
- todo description
  This helps users quickly find relevant tasks.

### Theme Behavior

The app supports:

- light mode
- dark mode
- theme color selection
  Theme settings are persisted locally and can be scoped based on user logic.

### Firebase Security

The app is designed to work with secure Firestore rules so that:

- only authenticated users can access data
- users can only read/write their own documents
- todo data cannot be accessed across accounts

## Version 2 Planning

Version 2 will extend this app with reminders and notifications.

_Planned Features_

- set reminder time for a todo
- local notification support
- optional Firebase Cloud Messaging support
- push notification handling
- scheduled reminder alerts
- reminder-ready todo model fields

### Expected Additions

- reminderAt or notificationTime field in todo model/entity
- local notification service
- notification permission handling
- background notification scheduling
- reminder toggle in add/edit todo screen

### Possible Tech Options

- flutter_local_notifications for local scheduled reminders
- Firebase Cloud Messaging for remote push notifications

## Goal of Version 2

Allow users not only to manage tasks, but also to get reminded at the right time through notifications.

### Future Improvements

_Possible later enhancements:_

- due date picker
- task priority
- categories/tags
- offline cache
- profile settings
- reminder history
- recurring tasks
- widget tests and unit tests

## Screenshots

| Screen         | Preview             |
| -------------- | ------------------- |
| Signup         | Signin              |
| ----           | -------             |
| Home light     | Home dark           |
| ----           | -------             |
| Search Success | Not Found           |
| ----           | -------             |
| Add Todo       | Edit Todo           |
| ----           | -------             |
| Todo Details   | Color Picker Dialog |
