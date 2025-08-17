// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttms_student/core/constants/error_handling.dart';
import 'package:ttms_student/export.dart';
import 'package:ttms_student/src/data/provider/schedule.dart';
import 'package:ttms_student/src/data/model/schedule.dart';
import 'package:ttms_student/src/data/provider/user.dart';

import '../../core/constants/utlis.dart';

class ScheduleService {
  final baseUrl = dotenv.env['API_KEY'];
  //  get tt by date and subgroup
  Future<List<Schedule>> fetachDateScheduleBySubGroup(
      String date, BuildContext context) async {
    final sched = Provider.of<ScheduleProvider>(context, listen: false);
    List<Schedule> productList = [];
    final Uri url =
        Uri.parse('$baseUrl/tt/subgroup/${sched.selectedSubGroup}/2025-01-20');
    try {
      http.Response res = await http.get(
        Uri.parse('$url'),
      );

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Schedule.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, 'Unable to fetch schedule');
    }
    return productList;
  }

  // get tt by faculty codeby date
  Future<List<Schedule>> fetchFacultyTTByDateAndCode(
      BuildContext context, String fc) async {
    final sched = Provider.of<ScheduleProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    List<Schedule> productList = [];

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      final Uri url = Uri.parse('$baseUrl/timetable/faculty/$fc');
      print(url);
      http.Response res = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      );

      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');

      httpErrorhandle(
        resposne: res,
        context: context,
        onSuccess: () {
          final data = jsonDecode(res.body);
          for (var item in data) {
            productList.add(Schedule.fromJson(item));
          }
        },
      );
    } catch (e) {
      print('❌ Error fetching timetable: $e');
      showSnackBar(context, 'Unable to fetch schedule');
    }

    return productList;
  }
}
