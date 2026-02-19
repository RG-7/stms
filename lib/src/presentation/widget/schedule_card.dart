import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../.././../export.dart';
import '../../data/model/schedule.dart';
import '../../data/provider/schedule.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;
  const ScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final sched = Provider.of<ScheduleProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(schedule.startTime, style: bodyStyle2),
              // Text('AM', style: bodyStyle2Grey),
            ],
          ),
          VerticalDivider(
            color: schedule.type == 'L'
                ? AppColor.red
                : schedule.type == 'P'
                    ? AppColor.green
                    : AppColor.blue,
            thickness: 1,
            width: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Measurement Science and Techniques (UMA035)',
                    schedule.courseCode,
                    style: bodyStyle1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.pin_fill,
                        color: AppColor.lightGrey,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        // 'LT401',
                        schedule.venue,
                        style: bodyStyle2Grey.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sched.isTeacher
                          ? const Icon(
                              CupertinoIcons.group_solid,
                              color: AppColor.lightGrey,
                              size: 30,
                            )
                          : Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        sched.isTeacher
                            ? schedule.subGroup
                            : schedule.facultyCode,
                        style: bodyStyle2Grey.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleCard2 extends StatefulWidget {
  final Schedule schedule;
  const ScheduleCard2({super.key, required this.schedule});

  @override
  State<ScheduleCard2> createState() => _ScheduleCard2State();
}

class _ScheduleCard2State extends State<ScheduleCard2> {
  bool isTeacher = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Common.palletTimeRow(
            time: widget.schedule.startTime,
            type: widget.schedule.type,
          ),
          Container(
            width: double.infinity,
            height: isTeacher ? 200 : 200,
            margin: EdgeInsets.symmetric(
                vertical: 0, horizontal: width <= 360 ? 15 : 25),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColor.lightGrey.withValues(alpha: 0.6), width: 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.schedule.courseCode,
                        style: h1StyleBlack.copyWith(fontSize: 18),
                      ),
                      Text(
                        widget.schedule.courseCode,
                        style: bodyStyle2Grey.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isTeacher
                              ? const Icon(
                                  CupertinoIcons.group_solid,
                                  color: AppColor.lightGrey,
                                  size: 30,
                                )
                              : Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isTeacher
                                    ? widget.schedule.courseCode
                                    : widget.schedule.facultyCode,
                                style: bodyStyle1.copyWith(fontSize: 16),
                              ),
                              Text(
                                isTeacher
                                    ? widget.schedule.subGroup
                                    : widget.schedule.facultyCode,
                                style: bodyStyle2Grey.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.pin_fill,
                            color: AppColor.lightGrey,
                            size: 25,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lecture Theatre',
                                style: bodyStyle1.copyWith(fontSize: 16),
                              ),
                              Text(
                                widget.schedule.venue,
                                style: bodyStyle2Grey.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isTeacher
                    ? Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColor.lightBlue,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: bodyStyle1.copyWith(
                                        color: AppColor.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColor.lightOrange,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Re-schedule',
                                    style: bodyStyle1.copyWith(
                                        color: AppColor.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard3 extends StatefulWidget {
  const ScheduleCard3({super.key});

  @override
  State<ScheduleCard3> createState() => _ScheduleCard3State();
}

class _ScheduleCard3State extends State<ScheduleCard3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Common.palletTimeRow(),
          Container(
            width: double.infinity,
            height: 170,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColor.lightGrey.withValues(alpha: 0.6), width: 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Computer Science & Engineering',
                        style: h1StyleBlack.copyWith(fontSize: 18),
                      ),
                      Text(
                        'Computer Architecture and Organization (UCS415)',
                        style: bodyStyle2Grey.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.group_solid,
                            color: AppColor.lightGrey,
                            size: 30,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Computer Engingeering',
                                style: bodyStyle1.copyWith(fontSize: 16),
                              ),
                              Text(
                                '3CO 6-10',
                                style: bodyStyle2Grey.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.pin_fill,
                            color: AppColor.lightGrey,
                            size: 25,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lecture Theatre',
                                style: bodyStyle1.copyWith(fontSize: 16),
                              ),
                              Text(
                                'LT401,4th Floor',
                                style: bodyStyle2Grey.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
