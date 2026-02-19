// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String type;
  final String token;
  final String contactNumber;
  final String empId;
  final String deptId;
  final String facultyCode;
  final String designation;

  final String? availableAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.token,
    required this.availableAt, // not required
    required this.contactNumber,
    required this.deptId,
    required this.empId,
    required this.designation, // not required
    required this.facultyCode, // not required
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'type': type,
      'token': token,
      'contactNumber': contactNumber,
      'empId': empId,
      'dept_id': deptId,
      'facultyCode': facultyCode,
      'designation': designation,
      'availableAt': availableAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      empId: map['emp_id'] ?? '',
      deptId: map['deptId'] ?? '',
      facultyCode: map['facultyCode'] ?? '',
      designation: map['designation'] ?? '',
      availableAt: map['availableAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
