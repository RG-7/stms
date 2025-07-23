// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ttms_student/main.dart';
import 'package:ttms_student/src/data/provider/schedule.dart';
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
      http.Response res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }), // This is the correct way.
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          //print('\n\n\n${jsonDecode(res.body)['token']}\n\n\n');
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          getUserData(context);
          ScheduleProvider schedProvider =
              Provider.of<ScheduleProvider>(context, listen: false);
          schedProvider.updateIndex(0);
          schedProvider.clearSelectedSubGroup();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
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
          getUserData(context);
          ScheduleProvider schedProvider =
              Provider.of<ScheduleProvider>(context, listen: false);
          schedProvider.updateIndex(0);
          schedProvider.clearSelectedSubGroup();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context,'Unable to send OTP. Please check your email');
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
