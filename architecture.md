# Architecture Overview

## Project Structure

```
lib/
├── core/              # Core utilities, styles, constants
├── src/
│   ├── data/          # Data layer (providers, repositories)
│   ├── services/      # Business logic (API calls, auth)
│   └── presentation/  # UI layer (screens, widgets)
└── main.dart          # App entry point
```

## State Management

We use **Provider** pattern for state management:
- `AuthProvider`: Authentication state
- `UserProvider`: User information
- `ScheduleProvider`: Schedule data
- `ConnectivityProvider`: Network connectivity

## Architecture Pattern

We follow **Clean Architecture** principles:

1. **Presentation Layer** (UI)
   - Stateless/Stateful widgets
   - Screen navigation
   - User interactions

2. **Business Logic Layer** (Services)
   - `AuthServices`: Authentication logic
   - `ScheduleServices`: Schedule operations
   - Error handling

3. **Data Layer** (Providers)
   - State management with Provider
   - Data persistence
   - API communication

## API Integration

- Base URL: Configured via `assets/env`
- Authentication: Token-based with SharedPreferences
- Email Validation: Strict @sliet.edu domain only
- Error Handling: Centralized error messages

## Security

- HTTPS enforcement
- Secure token storage
- Email domain validation
- Input sanitization
