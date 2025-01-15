import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttms_student/src/data/model/user.dart';
import 'package:ttms_student/src/data/provider/schedule.dart';

import '/export.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    type: '',
    token: '',
    availableAt: '',
    contactNumber: '',
    deptId: '',
    empId: '',
    designation: '',
    facultyCode: '',
  );

  String? _token;

  User get user => _user;
  String? get token => _token;

  void setUser(String useraN) {
    try {
      // Decode the JSON string into a Map
      final Map<String, dynamic> userMap = jsonDecode(useraN);

      // Use fromMap to populate the User object
      _user = User.fromMap(userMap);

      notifyListeners();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  // clear
  void clearUser() {
    _user = User(
      id: '',
      name: '',
      email: '',
      type: '',
      token: '',
      availableAt: '',
      contactNumber: '',
      deptId: '',
      empId: '',
      designation: '',
      facultyCode: '',
    );
    _token = null;
    notifyListeners();
  }

  // get initals
  String getInitials() {
    if (user.name.isNotEmpty) {
      List<String> parts = user.name.split(' ');
      if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
      return parts.map((part) => part[0].toUpperCase()).join();
    }

    ScheduleProvider sched = ScheduleProvider();
    return sched.selectedSubGroup ?? 'N/A';
  }

  Future<void> getToken() async {
    if (_token != null) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('x-auth-token') ?? '';
    notifyListeners();
  }
}
