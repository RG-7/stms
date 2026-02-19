# CONTRIBUTING to STMS Student App

Thank you for your interest in contributing to the STMS Student App! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md). We are committed to providing a welcoming and inspiring community.

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Git
- A GitHub account

### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/app_frontend.git
   cd app_frontend
   ```

2. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

3. **Set up your environment**
   ```bash
   flutter pub get
   cp assets/env.example assets/env
   # Edit assets/env with your configuration
   ```

4. **Make your changes**
   - Follow the coding standards (see below)
   - Write tests for new features
   - Update documentation as needed

5. **Run tests and analysis**
   ```bash
   flutter test
   flutter analyze
   dart format lib/
   ```

## Naming Conventions

### Branch Names
- Feature branches: `feature/description` (e.g., `feature/add-schedule-export`)
- Bug fix branches: `fix/description` (e.g., `fix/login-validation`)
- Refactor branches: `refactor/description`
- Documentation: `docs/description`

### Commit Messages

Follow the Conventional Commits standard:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect code logic (formatting, missing semicolons, etc.)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to build process, dependencies, or tools

**Scope:** The part of the codebase being changed (e.g., auth, schedule, ui)

**Subject:** Use imperative mood, don't capitalize, no period at the end

**Examples:**
```
feat(auth): implement strict email validation
fix(schedule): resolve schedule loading timeout
docs(readme): update setup instructions
refactor(ui): extract common widget patterns
```

## Code Style

### Dart Style Guide
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dartfmt` for formatting: `dart format lib/`
- Run analysis: `flutter analyze`

### Best Practices

1. **File Structure**
   - One main class per file
   - Related utilities in same file only if tightly coupled
   - Use meaningful, descriptive names

2. **Comments**
   - Write clear, concise comments
   - Use `///` for public API documentation
   - Explain *why*, not *what*

3. **Error Handling**
   - Use try-catch blocks appropriately
   - Provide meaningful error messages
   - Log errors for debugging

4. **Widget Structure**
   - Prefer const constructors
   - Use const when possible
   - Extract large widgets into separate files

## Pull Request Process

1. **Update the README.md** with details of changes if applicable
2. **Update documentation** as needed
3. **Ensure all tests pass** locally
4. **Keep PR focused** - one feature/fix per PR
5. **Provide clear commit history** - one commit per logical change
6. **Write descriptive PR title and description**
7. **Link related issues** in the PR description

### PR Checklist
- [ ] Code follows style guidelines
- [ ] Changes generate no new warnings
- [ ] Tests added/updated and passing
- [ ] Documentation updated
- [ ] Branch is up to date with `sliet`
- [ ] Commit messages are clear and follow conventions

## Testing

### Writing Tests
```dart
void main() {
  group('Feature Name', () {
    test('should do something', () {
      // Arrange
      final input = 'test';
      
      // Act
      final result = functionUnderTest(input);
      
      // Assert
      expect(result, expected);
    });
  });
}
```

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/src/services/auth_test.dart

# Run tests matching pattern
flutter test --name "email"
```

## Platform-Specific Guidelines

### Android
- Test on API level 21+
- Check for memory leaks
- Verify app signature

### iOS
- Test on iOS 12+
- Check app store guidelines
- Verify code signing

### Web
- Test on latest browsers (Chrome, Firefox, Safari, Edge)
- Check responsive design
- Verify performance

## Reporting Bugs

Use the [Bug Report template](/.github/ISSUE_TEMPLATE/bug_report.md)

Include:
- Clear description of the bug
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs
- Device and OS information
- App version

## Suggesting Enhancements

Use the [Feature Request template](/.github/ISSUE_TEMPLATE/feature_request.md)

Include:
- Clear description of the feature
- Use case and motivation
- Proposed implementation (if applicable)
- Possible alternatives

## Questions?

- Check existing issues and documentation
- Read through closed issues
- Ask in GitHub Discussions (if available)

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes
- GitHub contributor graph

---

Thank you for contributing to STMS Student App! 🎉
