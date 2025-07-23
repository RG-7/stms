import 'package:flutter/cupertino.dart';

import '../../../../export.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  DateTime selectedDate = DateTime.now();
  String selectedBuildingId = allBuilding.first.buildingId;

  ClassType selectedClassType = classType.first;
  String selectedClass =
      '${allClasses.first.department} ${allClasses.first.branch} ${allClasses.first.subgroup}';
  Subject selectedSubject = allSubjects.first;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return const Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: Text('Coming Soon!'),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: AppBarBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddClassMultiple(
              text: selectedClassType.classType,
              dispText: AppData.type,
              onTap: () => _showSelectionDialog(
                context,
                'Select Class Type',
                classType,
                (ClassType type) => type.classType,
                (ClassType type) => type.classIcon,
                (ClassType value) {
                  setState(() {
                    selectedClassType = value;
                  });
                },
              ),
              icon: selectedClassType.classIcon,
            ),
            AddClassMultiple(
              text: selectedClass,
              dispText: AppData.class_,
              onTap: () => _showSelectionDialog(
                context,
                'Select Class',
                allClasses,
                (Classes cls) => '${cls.year}_${cls.subgroup}',
                (Classes cls) => const Icon(
                  CupertinoIcons.group_solid,
                  color: AppColor.black,
                ),
                (Classes value) {
                  setState(() {
                    selectedClass = '${value.year}_${value.subgroup}';
                  });
                },
              ),
              icon: const Icon(
                CupertinoIcons.group_solid,
                color: AppColor.black,
              ),
            ),
            AddClassMultiple(
              text: selectedSubject.subjectName,
              dispText: AppData.subject,
              onTap: () => _showSelectionDialog(
                context,
                'Select Subject',
                allSubjects,
                (Subject subject) => subject.subjectName,
                (Subject subject) => const Icon(
                  Icons.cast_for_education_outlined,
                  color: AppColor.black,
                ),
                (Subject value) {
                  setState(() {
                    selectedSubject = value;
                  });
                },
              ),
              icon: const Icon(
                Icons.cast_for_education_outlined,
                color: AppColor.black,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            DateRow(
              initialDate: selectedDate,
              onDateSelected: (newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
            ),
            const SizedBox(height: 15),
            Common.sideOrangePallet(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BuildingRow(
                onBuildingSelected: (buildingId) {
                  setState(() {
                    selectedBuildingId = buildingId;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            Common.sideOrangePallet(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RoomRow(
                buildingId: selectedBuildingId,
              ),
            ),
            const SizedBox(height: 15),
            Common.sideOrangePallet(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: TimeRow(
                  times: const [
                    '08:00 AM',
                    '09:00 AM',
                    '10:00 AM',
                    '11:00 AM',
                    '12:00 PM',
                    '01:00 PM'
                  ],
                  onTimeSelected: (selectedTime) {
                    setState(() {
                      selectedTime = selectedTime;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            const MessageAndSubmit(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectionDialog<T>(
    BuildContext context,
    String title,
    List<T> options,
    String Function(T) getLabel,
    Widget Function(T) getLeading,
    ValueChanged<T> onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: h1StyleBlue,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final item = options[index];
                    return ListTile(
                      leading: getLeading(item),
                      title: Text(
                        getLabel(item),
                        style: bodyStyle2,
                      ),
                      onTap: () {
                        onSelected(item);
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddClassMultiple extends StatelessWidget {
  final Function() onTap;
  final String dispText;
  final String text;
  final Icon icon;
  const AddClassMultiple({
    super.key,
    required this.onTap,
    required this.dispText,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            dispText,
            style: bodyStyle2.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: AppColor.lightGrey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  icon,
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    text,
                    style: bodyStyle2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
