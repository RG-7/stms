import 'package:flutter/cupertino.dart';

import '../../../export.dart';

class ClassType {
  final String classType;
  final Icon classIcon;

  const ClassType(this.classType, this.classIcon);
}

List<ClassType> classType = [
  const ClassType(
    'Tutorial',
    Icon(CupertinoIcons.smallcircle_fill_circle, color: Colors.blue),
  ), 
  const ClassType(
    'Lab',
    Icon(CupertinoIcons.smallcircle_fill_circle, color: Colors.red),
  ),
  const ClassType(
    'Lecture',
    Icon(CupertinoIcons.smallcircle_fill_circle, color: Colors.grey),
  ),
];


class Classes{
  final String department;
  final String branch;
  final String year;
  final String subgroup;

  const Classes(this.department, this.branch, this.year, this.subgroup);
}

List<Classes> allClasses = [
  const Classes('CSE', 'COE', '1', 'CO-10'),
  const Classes('CSE', 'COE', '2', 'CO-1'),
  const Classes('ME', 'CAF', '2', 'CAF-3'),
  const Classes('CSE', 'COE', '1', 'CO-10'),
  const Classes('CSE', 'COE', '2', 'CO-1'),
  const Classes('ME', 'CAF', '2', 'CAF-3'),
];

class Subject{
  final String subjectName;
  final String subjectCode;

  const Subject(this.subjectName, this.subjectCode);
}

List<Subject> allSubjects = [
  const Subject('Discreter Mathematics', 'UMA035'),
  const Subject('Machine Learning', 'UCS504'),
  const Subject('Cloud Computing', 'UCS415'),
  const Subject('Humanities', 'UMA004'),

];