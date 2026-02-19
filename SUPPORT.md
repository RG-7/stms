# Support & Documentation

## Getting Help

### Documentation
- 📚 [README.md](README.md) - Project overview and quick start
- 🏗️ [Architecture Overview](docs/architecture.md) - System design and structure
- ⚙️ [Setup Guide](docs/setup.md) - Installation and configuration
- 🔌 [API Documentation](docs/api.md) - API endpoints and usage
- 📖 [Contributing Guide](CONTRIBUTING.md) - How to contribute

### Support Channels

1. **GitHub Issues** - Bug reports and feature requests
   - [Bug Report](https://github.com/dev-ratn/app_frontend/issues/new?template=bug_report.md)
   - [Feature Request](https://github.com/dev-ratn/app_frontend/issues/new?template=feature_request.md)
   - [Documentation](https://github.com/dev-ratn/app_frontend/issues/new?template=documentation.md)

2. **Email Support** - For urgent issues
   - General: **support@sliet.edu**
   - Security: **security@sliet.edu**

3. **GitHub Discussions** - Community help and discussions

## FAQ

### Installation Issues

**Q: Flutter not found**
```bash
# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor
```

**Q: Dependency conflicts**
```bash
flutter pub get
flutter pub upgrade
flutter pub outdated
```

### Application Issues

**Q: App won't start**
- Clear app cache: `flutter clean`
- Rebuild: `flutter run`
- Check logs: `flutter logs`

**Q: API connection error**
- Check internet connection
- Verify `assets/env` configuration
- Check API server status

**Q: Email validation fails**
- Use @sliet.edu email address
- Ensure no extra spaces
- Try lowercase format

### Platform-Specific

**Android:**
- Minimum API: 21+
- Target API: 34+
- Gradle: 8.0+

**iOS:**
- Minimum: iOS 12+
- Pod update: `pod repo update`

**Web:**
- Tested browsers: Chrome, Firefox, Safari, Edge
- Clear browser cache if issues persist

## Performance

### Optimization Tips

1. **Mobile**: Close background apps
2. **Web**: Use modern browser
3. **Desktop**: Ensure adequate RAM
4. **Network**: Use stable connection

### Troubleshooting

- Check developer console for errors
- Review app logs: `flutter logs`
- Monitor memory usage
- Check network in DevTools

## Development Help

### Common Tasks

```bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run with logs
flutter run -v

# Build release
flutter build apk --release

# Run tests
flutter test

# Check code quality
flutter analyze

# Format code
dart format lib/
```

### Debugging

```bash
# Enable debug logging
flutter run -v

# Use debugger
flutter run -v --debug

# Flutter DevTools
flutter pub global activate devtools
devtools
```

## Reporting Issues

### Good Issue Report

✅ Clear title describing the problem
✅ Steps to reproduce
✅ Expected vs actual behavior
✅ Screenshots/logs if applicable
✅ Device/OS information
✅ App version

### Bad Issue Report

❌ Vague title
❌ No reproduction steps
❌ No error details
❌ Multiple unrelated issues in one report

## Updates & Releases

- **Release Schedule**: Version releases when ready
- **Update Notifications**: Check GitHub releases page
- **Breaking Changes**: Documented in CHANGELOG
- **Security Updates**: Deployed immediately

## Resources

- 📖 [Flutter Documentation](https://flutter.dev/docs)
- 🎓 [Flutter Tutorials](https://flutter.dev/docs/get-started/learn-more)
- 🐛 [File an Issue](https://github.com/dev-ratn/app_frontend/issues)
- 💬 [Discussions](https://github.com/dev-ratn/app_frontend/discussions)

## Contact

- **Project Lead**: Amritanshu Prashar
- **Email**: amritanshu@sliet.edu
- **GitHub**: [@dev-ratn](https://github.com/dev-ratn)

---

**Last Updated**: 2024-02-20

*For urgent matters, please contact support directly.*
