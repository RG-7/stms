// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Schedule {
  String? id;
  String courseCode;
  String facultyCode;
  String date;
  String startTime;
  String type;
  String subGroup;
  String venue;

  // Constructor
  Schedule({
    required this.courseCode,
    this.id,
    required this.facultyCode,
    required this.date,
    required this.startTime,
    required this.type,
    required this.subGroup,
    required this.venue,
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
      courseCode: map['courseCode'] ?? '',
      id: map['_id'] ?? '',
      facultyCode: map['facultyCode'] ?? '',
      date: map['date'] ?? '',
      startTime: map['startTime'] ?? '',
      type: map['type'] ?? '',
      subGroup: map['subGroup'] ?? '',
      venue: map['venue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);
}
