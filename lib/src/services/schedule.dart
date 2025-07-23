// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
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
    final Uri url = Uri.parse('$baseUrl/tt/subgroup/${sched.selectedSubGroup}/2025-01-20');
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
      BuildContext context) async {
    final sched = Provider.of<ScheduleProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    List<Schedule> productList = [];

    final Uri url = Uri.parse('$baseUrl/api/user/day');
    try {
      String fc = user.user.facultyCode;
      http.Response res = await http.get(
        Uri.parse('$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'date': sched.selectedDate.toIso8601String().split('T')[0],
          'facultyCode':fc,
        },
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
}
