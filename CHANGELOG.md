# STMS Student App - Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-02-20

### Added

#### Branding & Organization
- Complete rebranding from Thapar/TTMS to SLIET/STMS
- Organization ID migration to `dev.ratn.stms` across all platforms
- Updated app name and icons with SLIET branding

#### Features
- Strict `@sliet.edu` email validation system
- Auto-normalization of email input (lowercase + trim)
- Responsive mobile device frame mockup on web (iPhone 13)
- OTP-based authentication flow
- Schedule management with group selection
- Multi-platform support:
  - Android (APK & AAB)
  - iOS
  - Web
  - Windows
  - Linux
  - macOS

#### Improvements
- Enhanced error handling with styled SnackBars
  - White text on black87 background
  - 3-second visibility duration
- Improved UI/UX with device frame wrapper
- Better state management with Provider pattern
- Dependency upgrades for stability

#### Infrastructure
- GitHub Actions CI/CD pipelines
- Automated build workflows
- Release automation
- Code quality monitoring
- Documentation generation
- Security audits
- Dependency update automation

### Changed
- Password hint: `'Tiet@1234'` → `'Enter your password'`
- Email validation centralized in `AppData.isValidSlietEmail()`
- SnackBar styling for better visibility

### Security
- Email validation now strictly `@sliet.edu` only
- Improved token management
- Secure credential storage

### Bug Fixes
- Fixed black error popup visibility issue
- Removed residual "Tiet" branding strings
- Fixed email input auto-normalization

### Dependencies
- `connectivity_plus`: ^6.0.0 → ^7.0.0
- `flutter_dotenv`: ^5.0.0 → ^6.0.0
- `google_fonts`: ^6.0.0 → ^8.0.2
- `flutter_lints`: ^5.0.0 → ^6.0.0
- **New**: `device_frame`: ^1.4.0

---

## Semantic Versioning

This project uses semantic versioning: `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

## Upcoming

### Planned for v1.1.0
- Push notifications
- Attendance tracking
- Faculty feedback system
- Enhanced schedule search
- Dark mode support

### Planned for v2.0.0
- Offline mode with sync
- Advanced analytics
- API v2 migration
- Database refactoring

---

**Note**: See [Git Tags](https://github.com/dev-ratn/app_frontend/tags) for all releases.
