# The Law Library — Flutter App

A cross-platform mobile and desktop application for browsing and searching Brunei's Road Traffic Act (RTA) and Road Traffic Rules (RTR) laws. Built for Royal Brunei Police Force (RBPF) officers and administrators.

## Platforms

- Android
- Windows Desktop

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.0 or later
- Dart SDK 3.0 or later
- A running instance of the backend API (see [`api/`](../api/))

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app (connect a device or start an emulator first)
flutter run
```

## Configuration

The API base URL is set in `lib/utils/constants.dart`. The default points to Docker running locally. Uncomment the line that matches your setup:

```dart
// Android emulator — use this when running on an emulator:
// static const String baseUrl = 'http://10.0.2.2:8088';

// macOS / Windows desktop or Chrome web — Docker running locally:
static const String baseUrl = 'http://localhost:8088';
```

To start the API with Docker, run from the `docker/` folder:

```bash
docker compose up -d
```

## Features

- Browse and search Road Traffic Act laws by category
- View compound fine tables for each law
- Bilingual support (English & Malay)
- Favorites with offline persistence (SQLite)
- Offline mode with local cache fallback
- Dark / Light theme
- Admin panel — create, edit, and delete laws and users

## Project Structure

```
lib/
  main.dart          # App entry point, provider setup, localisation
  screens/           # All app screens (home, detail, admin, settings, etc.)
  components/        # Reusable UI widgets
  providers/         # State management (auth, laws, theme)
  models/            # Data models (Law, User)
  services/          # API and database services
  repositories/      # Data access layer
  theme/             # Colours, spacing, and theme configuration
  l10n/              # Localisation strings (EN, MS)
  utils/             # Helpers (encryption, validators, constants)
```
