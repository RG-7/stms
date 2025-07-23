
import 'package:provider/provider.dart';
import 'package:ttms_student/src/presentation/widget/common_loader.dart';

import '../../../../export.dart';
import '../../../data/model/schedule.dart';
import '../../../data/provider/schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final sched = Provider.of<ScheduleProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: width <= 360 ? 25 : 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF9F9FB),
                  AppColor.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 0.3],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: width <= 360 ? 10 : 20),
                GestureDetector(
                  onTap: () async {
                    await sched.showDatePickerCard(context);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColor.lightGrey,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          text: _getMonthString(sched.selectedDate),
                          style: h1StyleBlue,
                          children: [
                            TextSpan(
                              text: ' ${_getYearString(sched.selectedDate)}',
                              style: bodyStyle1.copyWith(
                                color: AppColor.darkBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          sched.resetDate();
                        },
                        child: Text(
                          'Today',
                          style: bodyStyle1.copyWith(color: AppColor.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: width <= 360 ? 80 : 150,
            child: Container(
              height: MediaQuery.of(context).size.height - width <= 360
                  ? 510
                  : 1000,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: width <= 360 ? 10 : 25),
              decoration: const BoxDecoration(
                color: AppColor.white,
                // color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Consumer<ScheduleProvider>(
                    builder: (context, sched, child) {
                      return DateRow(
                        key: ValueKey(
                          sched.selectedDate.toIso8601String(),
                        ),
                        initialDate: sched.selectedDate,
                        onDateSelected: (newDate) {
                          sched.updateDate(newDate, context);
                        },
                        isScheduling: false,
                        middleIndex: 3,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.1),
                  ),
                  Consumer<ScheduleProvider>(
                    builder: (context, scheduleProvider, child) {
                      // Loading state
                      if (scheduleProvider.isLoading) {
                        return const Center(child: CommonLoader());
                      }

                      // Error state
                      if (scheduleProvider.error != null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                              ),
                              Text(
                                scheduleProvider.error!,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }

                      // No data available
                      if (scheduleProvider.schedule.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                              ),
                              const Text(
                                'No schedule available!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }

                      return Flexible(
                        child: ListView.builder(
                          itemCount: scheduleProvider.schedule.length,
                          itemBuilder: (context, index) {
                            Schedule schedule =
                                scheduleProvider.schedule[index];
                            return ScheduleCard2(schedule: schedule);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthString(DateTime date) {
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[date.month - 1];
  }

  String _getYearString(DateTime date) {
    return date.year.toString();
  }
}
