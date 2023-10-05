# Work Trial

A Flutter test project.

## Getting Started

1. Clone this repository.
2. Make sure your Flutter & Dart version is compatible with this repository.
3. Run command `flutter pub get` to fetch Flutter package dependencies.
4. Make sure your test device (virtual/physical) is connected and ready for testing.
5. To run the app, use the command `flutter run`.

## Architecture
Clean Architecture

## Folder Structure
```
⁞
│
└── lib (The root directory for your application's source code.)
     │
     │
     ├── common (Holds core functionality that is independent of the application's business logic.)
     │    │
     │    ├── client (Stores and instantiate client classes (e.g GraphQL).)
     │    │
     │    ├── colors (App constant colors.)
     │    │
     │    ├── constants (Stores constant values used across the application.)
     │    │
     │    ├── dependency_injection (Provide a component with the dependencies.)
     │    │
     │    ├── functions (Contains utility functions that provide common functionality.)
     │    │
     │    ├── resources (Manages assets like images, fonts, etc.)
     │    │
     │    └── usecase (Defines application-specific use cases that interact with the domain.)
     │
     │   
     └── features (Contains individual features of the application, each in its own subdirectory.)
          │
          └── [feature_name]  (Represents a specific feature module.)
              │
              ├── data (Handles data-related operations, such as API calls or local database interactions.)
              │
              ├── domain (Contains domain entities and business logic interfaces for the feature.)
              │
              └── presentation (Manages the UI and user interactions for the feature.)
```
