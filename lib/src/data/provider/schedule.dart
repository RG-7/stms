// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/src/data/provider/user.dart';
import '/export.dart';
import '/src/services/schedule.dart';
import '../model/schedule.dart'; // Import Schedule model

class ScheduleProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Widgets for navigation
  final List<Widget> _body = [
    // const SchedulePage(),
    const HomePage(),
    const SchedulePage(),
    const ProfilePage(),
  ];

  List<Widget> get body => _body;

  final List<IconData> _icons = [
    CupertinoIcons.home,
    Icons.calendar_month_rounded,
    CupertinoIcons.person_alt_circle,
  ];

  List<IconData> get icons => _icons;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Selected Subgroup
  String? _selectedSubGroup;
  String? get selectedSubGroup => _selectedSubGroup;

  // List of groups/subgroups
  final List<String> groups = [
    '2E1A',
    '2E1B',
    '2E1C',
    '2D1A',
    '2D1B',
    '2D1C',
    '2S1A',
    '2S1B',
    '2S1C',
    '2S1D',
    '2S1E',
    '2H1A',
    '2H1B',
    '2H1C',
    '2IUNSW',
    '2A1A',
    '2A1B',
    '2G1A',
    '2G1B',
    '2G1C',
    '2G1D',
    '2G1E',
    '2J1A',
    '2R1A',
    '2R1B',
    '2R1C',
    '2V1A',
    '2V1B',
    '2V1C',
  ];

  // Schedule data stored as a list of Schedule objects
  List<Schedule> _schedule = [];
  List<Schedule> get schedule => _schedule;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  final ScheduleService _scheduleService =
      ScheduleService(); // API service instance

  // Update selected subgroup
  void updateSelectedSubGroup(String group) async {
    if (_selectedSubGroup != group) {
      _selectedSubGroup = group;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedSubGroup', selectedSubGroup!);
      notifyListeners();
    }
  }

  void clearSelectedSubGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedSubGroup', '');
    _selectedSubGroup = null;
    notifyListeners();
  }

  // get selected group from sharedprefrences
  Future<void> getSelectedSubGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedGroup = prefs.getString('selectedSubGroup');
    if (selectedGroup != null && selectedGroup.isNotEmpty) {
      _selectedSubGroup = selectedGroup;
      notifyListeners();
    }
  }

  // Fetch schedule from API and update provider
  Future<void> fetchSubGroupSchedule(BuildContext context) async {
    // Check only subgroup selection (No lecture group needed)
    if (_selectedSubGroup == null) {
      _error = 'Please select a subgroup';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Fetch data for the selected subgroup and date
      final result = await _scheduleService.fetachDateScheduleBySubGroup(
          selectedDate.toIso8601String().split('T')[0], context);

      // Update schedule
      _schedule = result;
      sortScheduleByStartTime();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTTOfFcaultyByDateAndCode(BuildContext context, String fc) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Fetch data for the selected subgroup and date
      final result =
          await _scheduleService.fetchFacultyTTByDateAndCode(context,fc);

      // Update schedule
      _schedule = result;
      sortScheduleByStartTime();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Date management
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  // Update Date
  void updateDate(DateTime date, BuildContext context) {
    if (_selectedDate != date) {
      _selectedDate = date;
      notifyListeners();
    }

    final user = Provider.of<UserProvider>(context, listen: false);
    if (user.user.designation == 'Professor') {
      final facultyCode = user.user.facultyCode;
      if (facultyCode.isNotEmpty) {
        fetchTTOfFcaultyByDateAndCode(context, facultyCode);
      }
    } else {
      fetchSubGroupSchedule(context);
    }
  }

  // Reset Date
  void resetDate() {
    _selectedDate = DateTime.now();
    notifyListeners();
  }

  Future<void> showDatePickerCard(BuildContext context) async {
    // Open date picker with the current selected date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Default to today
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
      builder: (context, child) {
        return Dialog(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9, // 90% width
              maxHeight: MediaQuery.of(context).size.height * 0.7, // 70% height
            ),
            child: child,
          ),
        );
      },
    );

    // Confirm selected date
    if (pickedDate != null) {
      updateDate(pickedDate, context);
    }
  }

  // Default student type
  bool _isTeacher = false;
  bool get isTeacher => _isTeacher;

  // Update teacher flag
  void updateAsTeacher() {
    _isTeacher = true;
    notifyListeners();
  }

  void updateAsTeacherFalse() {
    _isTeacher = false;
    notifyListeners();
  }

  // sort
  // Method to sort schedules based on start time
  void sortScheduleByStartTime() {
    // Sort _schedule list by start time (e.g., "08:00 AM")
    _schedule.sort((a, b) {
      // Assuming `a.startTime` and `b.startTime` are in the "hh:mm a" format (e.g., "08:00 AM")
      DateTime aTime = _parseTime(a.startTime);
      DateTime bTime = _parseTime(b.startTime);
      return aTime.compareTo(bTime);
    });

    notifyListeners(); // Notify listeners after sorting
  }

  // Method to parse time string into DateTime object
  DateTime _parseTime(String timeStr) {
    // Parse the time string into a DateTime object
    // You can adjust the DateTime format if needed, just ensure you correctly match the "hh:mm a" format
    final DateFormat formatter = DateFormat('hh:mm a');
    final DateTime parsedTime = formatter.parse(timeStr);

    // Return the parsed DateTime (just the time part is considered, not the date)
    return DateTime(2025, 1, 1, parsedTime.hour, parsedTime.minute);
  }
}
