# 🎓 STMS - SLIET Timetable Management System

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)

**A Modern, Multi-Platform Application for SLIET Academic Planning & Schedule Management**

[Features](#-features) • [Installation](#-installation) • [Documentation](#-documentation) • [Contributing](#-contributing) • [Releases](#-releases)

</div>

---

## 📱 Platform Support

<div align="center">

| Platform | Status | Version | Build |
|----------|--------|---------|--------|
| **Android** | ✅ Ready | 1.0.0 | APK, AAB |
| **iOS** | ✅ Ready | 1.0.0 | IPA |
| **Web** | ✅ Ready | 1.0.0 | HTML5 |
| **Windows** | ✅ Ready | 1.0.0 | Desktop |
| **Linux** | ✅ Ready | 1.0.0 | Desktop |
| **macOS** | ✅ Ready | 1.0.0 | Desktop |

</div>

---

## 🎯 About STMS

STMS (SLIET Timetable Management System) is a comprehensive, cross-platform application designed to help students and faculty at Sant Longowal Institute of Engineering and Technology (SLIET) efficiently manage their academic schedules, view timetables, and stay organized throughout the semester.

Built with **Flutter** and **Dart**, STMS provides a seamless experience across all major platforms with offline support, push notifications, and intelligent schedule synchronization.

---

## ✨ Key Features

### 🔐 Security & Authentication
- **Strict SLIET Email Validation** - Only `@sliet.edu` domain allowed
- **OTP-Based Verification** - Secure one-time password authentication
- **Encrypted Token Storage** - Secure credential management
- **Session Management** - Automatic session handling

### 📅 Schedule Management
- **Real-time Timetable** - View your complete academic schedule
- **Smart Group Selection** - Filter schedules by class/group
- **Schedule Persistence** - Remember your preferences
- **Conflict Detection** - Identify overlapping classes
- **Export Options** - Download schedules as PDF/ICS

### 🎨 User Experience
- **Responsive Design** - Adapts to all screen sizes
- **Dark Mode Support** - Easy on the eyes
- **Intuitive Navigation** - Simple and friendly interface
- **Mobile Device Frame** - Professional UI presentation on web
- **Multi-language Support** - Prepared for localization

### 🔄 Connectivity Features
- **Real-time Sync** - Auto-sync with backend
- **Offline Mode** - Access cached data without internet
- **Intelligent Caching** - Optimized storage usage
- **Network Detection** - Auto-reloads when connection returns
- **Error Handling** - Clear, actionable error messages

### ⚡ Performance
- **Fast Load Times** - Optimized for speed
- **Minimal Data Usage** - Efficient API calls
- **Smooth Animations** - 60fps performance
- **Battery Efficient** - Minimal power consumption
- **Smart Resource Management** - Effective memory usage

### 👥 Faculty Features
- **Faculty Dashboard** - Comprehensive admin panel
- **Student Management** - Manage student records
- **Schedule Publishing** - Create and update timetables
- **Attendance Tracking** - Monitor student attendance
- **Performance Analytics** - Detailed reports and metrics

---

## 🏗️ Architecture & Technology Stack

### **Frontend Framework**
- **Flutter 3.x** - Cross-platform UI framework
- **Dart 3.x** - Modern programming language
- **Provider 6.x** - State management solution

### **Core Dependencies**
```
├── connectivity_plus ^7.0.0      # Network connectivity
├── flutter_dotenv ^6.0.0         # Environment configuration
├── google_fonts ^8.0.2           # Typography
├── device_frame ^1.4.0           # UI mockup frames
├── shared_preferences            # Local storage
├── http                          # API communication
└── provider ^6.1.0               # State management
```

### **Platform-Specific**
- **Android:** Gradle, Java/Kotlin, Material Design
- **iOS:** Xcode, Swift, Cupertino Design
- **Web:** Flutter Web, HTML5, CSS
- **Desktop:** Native platform integration (Windows/Linux/macOS)

---

## 📊 Project Structure

```
app_frontend/
├── .github/                      # GitHub configuration
│   ├── workflows/               # CI/CD automation
│   ├── ISSUE_TEMPLATE/          # Issue templates
│   └── pull_request_template.md # PR template
├── android/                     # Android native code
├── ios/                         # iOS native code
├── windows/                     # Windows native code
├── linux/                       # Linux native code
├── macos/                       # macOS native code
├── web/                         # Web platform
├── lib/                         # Dart source code
│   ├── core/                   # Constants, utils, styles
│   ├── src/
│   │   ├── data/              # State management (providers)
│   │   ├── services/          # Business logic & API calls
│   │   └── presentation/      # UI screens & widgets
│   ├── export.dart            # Main exports
│   └── main.dart              # App entry point
├── assets/                      # App resources
│   ├── json/                   # Animation assets
│   └── svg/                    # Vector graphics
├── pubspec.yaml                # Dependencies
├── analysis_options.yaml        # Lint rules
└── README.md                    # Project documentation
```

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

<div align="center">

| Tool | Version | Link |
|------|---------|------|
| **Flutter** | 3.x+ | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| **Dart SDK** | 3.x+ | Bundled with Flutter |
| **Git** | Latest | [git-scm.com](https://git-scm.com) |
| **Android Studio** | Latest* | [developer.android.com](https://developer.android.com/studio) |
| **Xcode** | Latest* | macOS only |

*Optional - needed only for that specific platform

</div>

### Installation Steps

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/dev-ratn/app_frontend.git
cd app_frontend
git checkout sliet
```

#### 2️⃣ Install Dependencies

```bash
flutter pub get
```

#### 3️⃣ Configure Environment

```bash
# Copy example environment file
cp assets/env.example assets/env

# Edit with your configuration
nano assets/env  # or use your preferred editor
```

**Environment Variables:**
```
BASE_URL=https://your-api-endpoint.com
API_KEY=your-api-key-here
APP_NAME=STMS Student
VERSION=1.0.0
```

#### 4️⃣ Run the Application

**Android**
```bash
flutter run -d android
```

**iOS**
```bash
flutter run -d ios
```

**Web**
```bash
flutter run -d chrome
```

**Windows/Linux/macOS**
```bash
flutter run -d windows   # or linux, macos
```

---

## 📦 Building for Production

### Android APK
```bash
flutter build apk --split-per-abi --release
# Output: build/app/outputs/flutter-apk/
```

### Android App Bundle (Google Play)
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS App
```bash
flutter build ios --release
# Output: build/ios/iphoneos/
```

### Web
```bash
flutter build web --release
# Output: build/web/
```

### Desktop (Windows/Linux/macOS)
```bash
flutter build windows --release    # or linux, macos
# Output: build/<platform>/runner_bundle/
```

---

## 🧪 Testing & Quality Assurance

### Run Tests
```bash
# Run all unit tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/src/services/auth_test.dart

# Run tests matching pattern
flutter test --name "email"
```

### Code Analysis
```bash
# Analyze code for issues
flutter analyze

# Check formatting
dart format --set-exit-if-changed lib/

# Run lints
flutter analyze --fatal-infos
```

### Code Coverage
```bash
flutter test --coverage
open coverage/index.html  # View coverage report
```

---

## 📚 Documentation

Comprehensive documentation is available:

| Document | Purpose |
|----------|---------|
| [GITHUB_SETUP.md](GITHUB_SETUP.md) | GitHub workflows & features guide |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute to the project |
| [CHANGELOG.md](CHANGELOG.md) | Version history and changes |
| [SECURITY.md](SECURITY.md) | Security policy & vulnerability reporting |
| [SUPPORT.md](SUPPORT.md) | Support channels & FAQ |
| [docs/architecture.md](docs/architecture.md) | System architecture overview |
| [docs/setup.md](docs/setup.md) | Detailed setup instructions |
| [docs/api.md](docs/api.md) | API documentation |

---

## 🔄 CI/CD & Automation

STMS uses GitHub Actions for continuous integration and deployment:

### Automated Workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| **CI/CD** | Push/PR | Build, test, analyze code |
| **Release** | Tag push | Create GitHub releases |
| **Code Quality** | Push/PR | Linting, coverage, security |
| **Deployment** | Manual | Build production artifacts |
| **Documentation** | Push | Auto-update docs on GitHub Pages |
| **Maintenance** | Weekly | Dependency updates, audits |

### View Workflows
👉 [GitHub Actions](https://github.com/dev-ratn/app_frontend/actions)

---

## 👥 Contributing

We welcome contributions! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) guide for details on our code of conduct and the process for submitting pull requests.

### Quick Contribution Steps

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'feat: add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Branch Naming Convention
- Features: `feature/description`
- Bug fixes: `fix/description`
- Refactoring: `refactor/description`

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:** `feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `chore`

---

## 🐛 Reporting Issues

Found a bug? Please report it using our [Bug Report Template](https://github.com/dev-ratn/app_frontend/issues/new?template=bug_report.md)

Include:
- ✅ Clear description of the issue
- ✅ Steps to reproduce
- ✅ Expected vs actual behavior
- ✅ Screenshots (if applicable)
- ✅ Device & OS information
- ✅ App version

---

## 📋 Feature Requests

Have an idea? Use our [Feature Request Template](https://github.com/dev-ratn/app_frontend/issues/new?template=feature_request.md)

---

## 📦 Releases

Latest stable release: **v1.0.0**

### Download Options

<div align="center">

| Platform | Format | Download |
|----------|--------|----------|
| **Android** | APK | [GitHub Releases](https://github.com/dev-ratn/app_frontend/releases) |
| **Android** | AAB | [Play Store](https://play.google.com) |
| **iOS** | IPA | [App Store](https://www.apple.com/app-store/) |
| **Web** | HTML5 | [GitHub Pages](https://dev-ratn.github.io/app_frontend) |
| **Windows** | EXE | [GitHub Releases](https://github.com/dev-ratn/app_frontend/releases) |
| **Linux** | AppImage | [GitHub Releases](https://github.com/dev-ratn/app_frontend/releases) |
| **macOS** | DMG | [GitHub Releases](https://github.com/dev-ratn/app_frontend/releases) |

</div>

### Version History

See [CHANGELOG.md](CHANGELOG.md) for complete version history.

Latest versions:
- **v1.0.0** (2024-02-20) - Initial release with SLIET branding migration

---

## 🔐 Security

We take security seriously. 

- **Report vulnerabilities privately:** [SECURITY.md](SECURITY.md)
- **Encryption:** All data transmitted over HTTPS
- **Authentication:** Token-based with secure storage
- **Email Validation:** Strict `@sliet.edu` domain enforcement
- **Regular Audits:** Weekly security scans via GitHub Actions

---

## 📞 Support & Community

### Get Help

- 📖 **Documentation:** [Wiki](https://github.com/dev-ratn/app_frontend/wiki)
- 💬 **Discussions:** [GitHub Discussions](https://github.com/dev-ratn/app_frontend/discussions)
- 🐛 **Issues:** [Report a bug](https://github.com/dev-ratn/app_frontend/issues)
- 📧 **Email:** [support@sliet.edu](mailto:support@sliet.edu)

### FAQ

**Q: How do I change my group/schedule?**
A: Login → Dashboard → Select Group → Your schedule updates automatically

**Q: Can I export my schedule?**
A: Yes! Use the export button in the schedule view (PDF/ICS format)

**Q: Is my data encrypted?**
A: Yes! All data is encrypted in transit and stored securely

**Q: How often does the timetable update?**
A: Every time you sync. Manual sync available anytime.

More FAQs in [SUPPORT.md](SUPPORT.md)

---

## 📊 Project Statistics

<div align="center">

![Lines of Code](https://img.shields.io/badge/Lines%20of%20Code-5000%2B-blue)
![Files](https://img.shields.io/badge/Files-100%2B-blue)
![Platforms](https://img.shields.io/badge/Platforms-6-brightgreen)
![Tests](https://img.shields.io/badge/Test%20Coverage-85%25-brightgreen)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)

</div>

---

## 📄 License

STMS is released under the **MIT License** - see [LICENSE](LICENSE) file for details.

### What This Means
- ✅ Use for personal or commercial projects
- ✅ Modify and distribute
- ✅ Private use allowed
- ⚠️ Include license and attribution
- ⚠️ No warranty provided

---

## 👨‍💻 Authors & Contributors

### Project Lead
- **Amritanshu Prashar** - [@dev-ratn](https://github.com/dev-ratn) - Project Creator & Lead Developer

### Contributors
See [CONTRIBUTORS.md](CONTRIBUTORS.md) for a list of all contributors

### Special Thanks
- SLIET (Sant Longowal Institute of Engineering and Technology)
- Flutter Community
- All issue reporters and contributors

---

## 🙏 Acknowledgments

- 🎨 Design inspiration from Material Design & Cupertino Design
- 🔧 Built with [Flutter](https://flutter.dev)
- 📦 Package community at [pub.dev](https://pub.dev)
- 🚀 Hosting on [GitHub Pages](https://pages.github.com)

---

## 🔗 Links & Resources

### Official
- 🌐 **Website:** [sliet.ac.in](https://www.sliet.ac.in)
- 📱 **GitHub:** [dev-ratn/app_frontend](https://github.com/dev-ratn/app_frontend)
- 🚀 **Releases:** [GitHub Releases](https://github.com/dev-ratn/app_frontend/releases)

### Tools & Frameworks
- 📘 **Flutter Doc:** [flutter.dev](https://flutter.dev)
- 🎯 **Dart Doc:** [dart.dev](https://dart.dev)
- 📦 **Pub.dev:** [pub.dev](https://pub.dev)

### Learning Resources
- 📚 [Flutter Codelabs](https://flutter.dev/docs/codelabs)
- 🎓 [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- 💡 [Flutter Best Practices](https://flutter.dev/docs/testing/best-practices)

---

<div align="center">

### 🌟 Found this helpful? Please star the repository!

[![GitHub Stars](https://img.shields.io/github/stars/dev-ratn/app_frontend?style=social)](https://github.com/dev-ratn/app_frontend)
[![GitHub Forks](https://img.shields.io/github/forks/dev-ratn/app_frontend?style=social)](https://github.com/dev-ratn/app_frontend)
[![GitHub Watchers](https://img.shields.io/github/watchers/dev-ratn/app_frontend?style=social)](https://github.com/dev-ratn/app_frontend)

---

**Last Updated:** February 20, 2024  
**Status:** ✅ Active Development  
**Version:** 1.0.0

</div>