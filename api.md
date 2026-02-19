# API Integration

## Authentication

### Login
- **Endpoint:** POST `/login`
- **Body:** `{ "email": "user@sliet.edu", "password": "password" }`
- **Response:** `{ "token": "...", "faculty": {...} }`

### OTP Verification
- **Endpoint:** POST `/api/user/otp`
- **Body:** `{ "email": "user@sliet.edu" }`

### Reset Password
- **Endpoint:** POST `/reset-password`
- **Body:** `{ "email": "user@sliet.edu", "newPassword": "..." }`

## User Data

### Get User Data
- **Endpoint:** GET `/faculty/:id`
- **Headers:** `{ "x-auth-token": "token" }`

## Schedule

### Get Schedule
- **Endpoint:** GET `/schedule`
- **Headers:** `{ "x-auth-token": "token" }`

### Update Schedule Group
- **Endpoint:** POST `/schedule/group`
- **Body:** `{ "groupId": "..." }`

## Error Handling

All endpoints return error responses in format:
```json
{
  "msg": "Error message",
  "error": "error_code"
}
```

Status codes:
- `200`: Success
- `400`: Bad Request
- `500`: Server Error
