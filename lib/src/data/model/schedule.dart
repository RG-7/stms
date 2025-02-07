// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Schedule {
  String? id;
  String courseCode;
  String courseName;
  String facultyCode;
  String venue;
  String subGroup;
  String department;
  String startTime;
  String duration;
  String date;
  String type;

  // Constructor
  Schedule({
    this.id,
    required this.courseCode,
    required this.courseName,
    required this.facultyCode,
    required this.venue,
    required this.subGroup,
    required this.department,
    required this.startTime,
    required this.duration,
    required this.date,
    required this.type,
  });

  // Method to convert a TimeTable object to a Map (for storage)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'courseCode': courseCode,
      'facultyCode': facultyCode,
      'date': date,
      'startTime': startTime,
      'type': type,
      'subGroup': subGroup,
      'venue': venue,
    };
  }

  // Factory method to create a TimeTable object from a Map (for retrieval)
  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['ID'] ?? '',
      courseCode: map['CourseCode'] ?? '',
      courseName: map['CourseName'] ?? '',
      facultyCode: map['FacultyCode'] ?? '',
      venue: map['Venue'] ?? '',
      subGroup: map['Subgroup'] ?? '',
      department: map['Department'] ?? '',
      startTime: map['Time'] ?? '',
      duration: map['Duration'] ?? '',
      date: map['Date'] ?? '',
      type: map['Type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);
}
