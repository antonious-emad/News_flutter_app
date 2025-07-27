# News Flutter App

A comprehensive, production-ready Flutter news application demonstrating professional architecture, clean code practices, advanced state management, localization, and integration with modern Flutter technologies. This project is designed to be a portfolio-level showcase of your mobile development and architectural skills.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [UI & Theming](#ui--theming)
- [Localization](#localization)
- [How to Run](#how-to-run)
- [Screenshots](#screenshots)
- [Contributions](#contributions)
- [License](#license)

---

## Overview

**News Flutter App** is a modern mobile application built with Flutter that enables users to browse, search, and read news articles in a clean, responsive interface. It utilizes advanced state management, persistent storage, theming, and localization to provide a robust user experience. The codebase is structured for scalability and maintainability, following established software architecture patterns.

---

## Features

### 📰 News Browsing

- Browse news articles categorized by topics (politics, sports, health, business, environment, science, and more).
- Rich news cards with images, titles, sources, and publication dates.
- Pull news from external APIs with asynchronous loading and error handling.

### 🔍 Search

- Powerful real-time search functionality to find news articles by keywords.
- Responsive search UI with instant feedback and suggestions.

### 🗂 Categories & Drawer Navigation

- Custom drawer menu for easy navigation between categories and settings.
- Dynamic category switching with state preservation.

### 🌍 Localization

- Multi-language support using Flutter's localization system (`flutter_gen`).
- Localized UI strings and category names.

### ⚙️ Settings

- User settings tab for theme switching and app customization.

### 📄 News Details & Web View

- Detailed view for articles with image, author, source, and description.
- "View Full Article" in-app web view using `webview_flutter`.

### 🧩 State Management

- Uses Provider for reactive UI updates and state sharing.
- Bloc observer integrated for scalable state/event tracking.

### 💾 Persistent Storage

- Save user preferences (such as theme) with `shared_preferences`.

### 🖼 Custom Theming & Typography

- Consistent look and feel across the app using custom color palettes and Google Fonts.

---

## Architecture

### Clean Architecture & MVVM Principles

The app is structured to follow **Clean Architecture** and **MVVM** (Model-View-ViewModel) principles for maximum separation of concerns, testability, and scalability.

- **Model Layer:** 
  - Data models for News, Categories, and API responses.
  - Handles serialization/deserialization from APIs.

- **View Layer:** 
  - Flutter `Widget`s responsible for rendering UI.
  - Includes screens, cards, dialogs, and navigation elements.

- **ViewModel/Provider Layer:** 
  - Uses `Provider` for state management and dependency injection.
  - `MyProvider` and `Bloc` observer manage app state, theme, and user preferences.

- **Data Layer:** 
  - API integration in `ApiManager` (not shown in this summary).
  - Local storage utilities via `PrefsHelper`.

- **Routing & Navigation:** 
  - Centralized route definitions for easy navigation and deep linking.

#### Key Advantages:
- **Testable:** Logic is separated from UI, making unit testing straightforward.
- **Scalable:** Easy to extend new features or screens.
- **Maintainable:** Clear boundaries between UI, business logic, and data sources.

---

## Project Structure

```
lib/
├── layout/               # Main app layouts and navigation
│   └── home_layout.dart
├── models/               # Data models for API responses, categories, etc.
├── provider/             # State management (Provider, Bloc observer)
├── screens/              # Screens (Categories, Drawer, Settings, etc.)
│   ├── drawer.dart
│   ├── settings_tab/
│   │   ├── news_tab.dart
│   │   └── settings_tab.dart
├── shared/               # Shared resources (styles, theming, colors, network)
│   ├── styles/
│   │   ├── colors.dart
│   │   ├── text_styles.dart
│   │   └── theming.dart
│   └── network/
├── news_card_item.dart   # News card widget
├── news_details.dart     # News details view
├── search_screen.dart    # Search UI and logic
├── web_screen.dart       # In-app web view for articles
├── prefs_helper.dart     # Persistent storage using shared_preferences
├── main.dart             # Entry point
├── observer.dart         # Bloc observer for state management
```

---

## Technologies Used

| Technology                 | Purpose                                      |
|----------------------------|----------------------------------------------|
| **Flutter**                | Cross-platform mobile app framework          |
| **Dart**                   | Programming language for Flutter             |
| **Provider**               | State management                             |
| **Bloc**                   | Event/state observer for debugging           |
| **Google Fonts**           | Beautiful custom typography                  |
| **WebView Flutter**        | In-app web page rendering                    |
| **Shared Preferences**     | Persistent key-value storage                 |
| **Cached Network Image**   | Efficient image loading and caching          |
| **Flutter Localization**   | Multi-language/localization support          |
| **Material Design**        | UI and widgets                              |

**Other notable integrations:**
- **Custom Theming:** Light/Dark theme with color constants and theme data.
- **Custom Drawer:** For categories and app settings.
- **API Integration:** Fetches news from a remote API (see `ApiManager`).

---

## UI & Theming

- All UI elements use a consistent color palette (see `lib/shared/styles/colors.dart`).
- Responsive layouts, rounded corners, and image assets for a modern look.
- Theming is handled via `MyThemeData` and can be switched at runtime.
- Typography is unified with Google Fonts (Poppins, Exo, Inter, El Messiri).

---

## Localization

- Uses `flutter_gen` and `AppLocalizations` for multi-language support.
- Easily add more languages by updating ARB files and rebuilding.

---

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/antonious-emad/News_flutter_app.git
   cd News_flutter_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **(Optional) Generate localization and assets:**
   ```bash
   flutter gen-l10n
   ```

---

## Screenshots

![image alt](https://github.com/antonious-emad/News_flutter_app/blob/master/news.jpg?raw=true)

---

## Contributions

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## License

This project is licensed under the MIT License.

---

## Author

- **Antonious Emad**  
  [GitHub](https://github.com/antonious-emad)

---

## Portfolio Highlights

- Advanced Flutter architecture (Clean Architecture & MVVM)
- Production-quality app design
- Modern UI & UX
- Full localization and theming
- State management with Provider & Bloc
- Persistent storage and API integration
- Custom components and code organization

---

_This README was generated to provide a comprehensive overview and detailed technical showcase of the News Flutter App for portfolio and professional presentation purposes._
