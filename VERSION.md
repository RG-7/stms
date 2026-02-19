# Version History

## Release Tags

All official releases are tagged using semantic versioning format: `v[MAJOR].[MINOR].[PATCH]`

### Current Stable

- **v1.0.0** (2024-02-20) - Initial release with SLIET/STMS branding migration

### Versioning Strategy

We follow [Semantic Versioning 2.0.0](https://semver.org/):

```
MAJOR.MINOR.PATCH
```

- **MAJOR** version (X.0.0) - Incompatible API changes or major feature releases
- **MINOR** version (0.X.0) - New features added in backward-compatible manner
- **PATCH** version (0.0.X) - Backward-compatible bug fixes

### Pre-release Versions

Pre-release versions may be tagged as:
- `v1.0.0-alpha` - Alpha release
- `v1.0.0-beta` - Beta release
- `v1.0.0-rc.1` - Release candidate

### Build Metadata

Build metadata may include:
- `v1.0.0+1` - Build number
- `v1.0.0+20240220` - Build date

## Migration Guide

### From Pre-SLIET to SLIET (v1.0.0+)

This release includes breaking changes:

**Email Validation:**
```dart
// Before: Any email pattern accepted
isValidEmail("test@example.com") // ✓ Accepted

// After: SLIET domain only (@sliet.edu)
isValidEmail("test@sliet.edu") // ✓ Accepted
isValidEmail("test@example.com") // ✗ Rejected
```

**Database:**
If upgrading from pre-1.0.0 versions:
1. Clear app cache
2. Re-login with @sliet.edu email
3. Resync all data

## Future Releases

See [CHANGELOG.md](CHANGELOG.md) for detailed feature announcements.
