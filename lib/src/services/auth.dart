// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '/main.dart';
import '/src/data/provider/schedule.dart';
import '/src/presentation/screen/selection/selection.dart';
import '../../core/constants/error_handling.dart';
import '../../core/constants/utlis.dart';
import '../../export.dart';
import '../data/provider/user.dart';

class AuthServices {
  final baseUrl = dotenv.env['API_KEY'];
  // to login
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      debugPrint('Logging in with email: $email and password: $password');
      debugPrint('Base URL: $baseUrl');

      http.Response res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      // Debug: Show full details of the response
      debugPrint('Status Code: ${res.statusCode}');
      debugPrint('Response Body: ${res.body}');

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () async {
          debugPrint('Login successful, processing data...');

          SharedPreferences prefs = await SharedPreferences.getInstance();
          final responseData = jsonDecode(res.body);

          // Store the token
          await prefs.setString('x-auth-token', responseData['token']);
          debugPrint('Token saved: ${responseData['token']}');

          // Store faculty data in provider
          Provider.of<UserProvider>(context, listen: false)
              .setUser(jsonEncode(responseData['faculty']));

          // Optionally store faculty in SharedPreferences
          await prefs.setString(
            'faculty-data',
            jsonEncode(responseData['faculty']),
          );
          debugPrint('Faculty data saved: ${responseData['faculty']}');

          // Reset ScheduleProvider
          ScheduleProvider schedProvider =
              Provider.of<ScheduleProvider>(context, listen: false);
          schedProvider.updateIndex(0);
          schedProvider.clearSelectedSubGroup();

          // Determine user type
          final userDesignation =
              responseData['faculty']['designation'].toString().toLowerCase();

          final isFaculty = userDesignation.contains('professor') ||
              userDesignation.contains('dean') ||
              userDesignation.contains('hod') ||
              userDesignation.contains('faculty');

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isFaculty ? const DashBoard() : const SelectionScreen()),
            (route) => false,
          );
        },
      );
    } catch (e) {
      debugPrint('Exception during login: $e');
      showSnackBar(
        context,
        'Unable to login. Please check your email and password',
      );
    }
  }

  //
  // Send OTP
  Future<void> sendOTP({
    required BuildContext context,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/user/otp'),
        body: jsonEncode({'email': email}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'OTP sent successfully to $email');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          //print('\n\n\n${jsonDecode(res.body)['token']}\n\n\n');
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          if (res.statusCode == 200 && jsonDecode(res.body)['user'] != null) {
            var userProvider =
                Provider.of<UserProvider>(context, listen: false);
            var schedProvider =
                Provider.of<ScheduleProvider>(context, listen: false);

            schedProvider.updateAsTeacher();

            // Convert response['user'] (Map) to JSON string
            String userJson = jsonEncode(jsonDecode(res.body)['user']);
            userProvider.setUser(userJson);
          }
          ScheduleProvider schedProvider =
              Provider.of<ScheduleProvider>(context, listen: false);
          schedProvider.updateIndex(0);
          schedProvider.clearSelectedSubGroup();
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          debugPrint(userProvider.user.toJson());
          debugPrint('User token: ${userProvider.token}');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
              (route) => false);

          // print user data
        },
      );
    } catch (e) {
      showSnackBar(context, 'Unable to send OTP. Please check your email');
    }
  }

  // Verify OTP
  Future<void> verifyOTP({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    // to store message from res.body and status code from res.statusCode
    String message = '';
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/user/otp/verify'),
        body: jsonEncode({'email': email, 'otp': otp.toString()}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      message = jsonDecode(res.body)['message'];

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPVerified(
                email: email,
              ),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, message);
    }
  }

  // Reset password
  Future<void> resetPassword({
    required BuildContext context,
    required String email,
    required String newPassword,
  }) async {
    String message = '';
    String error = '';
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/user/setPassword'),
        body: jsonEncode(
            {'email': email.toString(), 'password': newPassword.toString()}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      message = jsonDecode(res.body)['message'];

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Password reset successfully');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      // error = e.toString();
      showSnackBar(context, message.isEmpty ? error : message);
    }
  }

  // to get user if it is already verified !
  Future<void> getUserData(BuildContext context) async {
    // print(baseUrl);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';

      var tokenRes = await http.post(
        Uri.parse('$baseUrl/api/tokenIsValid'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (tokenRes.statusCode == 200 && response['user'] != null) {
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        var schedProvider =
            Provider.of<ScheduleProvider>(context, listen: false);

        schedProvider.updateAsTeacher();

        // Convert response['user'] (Map) to JSON string
        String userJson = jsonEncode(response['user']);
        userProvider.setUser(userJson);
      } else {
        throw Exception('Invalid response from server');
      }
    } catch (e) {
      showSnackBar(context, 'Unable to get user data');
    }
  }
}
