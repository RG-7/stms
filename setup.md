# Development Setup Guide

## Prerequisites

- Flutter 3.x.x or later
- Dart SDK
- Android SDK (for Android development)
- Xcode (for iOS development)
- VS Code or Android Studio

## Installation

1. Clone the repository
   ```bash
   git clone <repo-url>
   cd app_frontend
   git checkout sliet
   ```

2. Get dependencies
   ```bash
   flutter pub get
   ```

3. Setup environment
   ```bash
   cp assets/env.example assets/env
   # Edit assets/env with your configuration
   ```

4. Run the app
   ```bash
   flutter run
   ```

## Configuration

Create `assets/env` file with:
```
BASE_URL=https://your-api-endpoint.com
API_KEY=your-api-key
```

## Building

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Windows/Linux/macOS
```bash
flutter build windows --release
flutter build linux --release
flutter build macos --release
```

## Testing

```bash
flutter test
flutter test --coverage
```

## Code Analysis

```bash
flutter analyze
dart format lib/
```
