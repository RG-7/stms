# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in STMS Student App, please email us at **security@sliet.edu** instead of using the issue tracker.

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Any suggested fixes

### Response Timeline

- **Initial Response**: Within 24 hours
- **Update**: Weekly until resolution
- **Resolution**: ASAP, typically within 1-2 weeks

## Security Best Practices

### For Users

1. **Keep the app updated** - Always use the latest version
2. **Use strong passwords** - Choose complex passwords
3. **Enable two-factor authentication** - When available
4. **Don't share credentials** - Keep your login information private
5. **Report suspicious activity** - Contact support immediately

### For Developers

1. **Validate all inputs** - Never trust user input
2. **Sanitize data** - Prevent injection attacks
3. **Use HTTPS only** - Always encrypt data in transit
4. **Secure storage** - Use platform-specific secure storage for sensitive data
5. **Keep dependencies updated** - Regular security audits
6. **Code review** - All changes reviewed before merging
7. **Minimize permissions** - Request only necessary permissions

## Security Features

### Authentication
- ✅ Token-based authentication
- ✅ @sliet.edu domain validation
- ✅ OTP verification
- ✅ Secure token storage

### Data Protection
- ✅ HTTPS enforcement
- ✅ Encrypted local storage
- ✅ Session management
- ✅ Input validation

### API Security
- ✅ Request signing
- ✅ Rate limiting
- ✅ CORS configuration
- ✅ API versioning

## Known Issues

Currently, no known security vulnerabilities.

## Security Advisories

We track security advisories for all dependencies. See our [Security Audit Workflow](/.github/workflows/maintenance.yml) for details.

## Bug Bounty

We do not currently have a formal bug bounty program, but we greatly appreciate security researchers who responsibly disclose vulnerabilities.

---

**Last Updated**: 2024-02-20
