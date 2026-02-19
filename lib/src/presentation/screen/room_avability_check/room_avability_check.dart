import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import '/src/presentation/widget/time_row2.dart';
import '../../../../export.dart';

class RoomAvabilityCheck extends StatefulWidget {
  const RoomAvabilityCheck({super.key});

  @override
  State<RoomAvabilityCheck> createState() => _RoomAvabilityCheckState();
}

class _RoomAvabilityCheckState extends State<RoomAvabilityCheck> {
  DateTime selectedDate = DateTime.now();
  String selectedBuildingId = allBuilding.first.buildingId;
  bool active = false;

  Future<void> _showDatePicker() async {
    // Open the picker with the current selected date
    final List<DateTime?>? pickedDates = await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            selectedDayHighlightColor: Colors.blue,
          ),
          value: [selectedDate], // Pass the selected date as initial value
          onValueChanged: (dates) {
            // Use setState() immediately when a date is selected
            if (dates.isNotEmpty) {
              setState(() {
                selectedDate = dates[0];
              });
            }
          },
        ),
      ),
    );

    // Final confirmation when dialog closes
    if (pickedDates != null &&
        pickedDates.isNotEmpty &&
        pickedDates[0] != null) {
      setState(() {
        selectedDate = pickedDates[0]!; // Update the selected date
      });
    }
  }

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9FB),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: AppBarBackButton(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
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
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    await _showDatePicker();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColor.lightGrey,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                            text: _getMonthString(selectedDate),
                            style: h1StyleBlue,
                            children: [
                              TextSpan(
                                  text: ' ${_getYearString(selectedDate)}',
                                  style: bodyStyle1.copyWith(
                                      color: AppColor.darkBlue))
                            ]),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = DateTime.now();
                          });
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
            top: 75,
            child: Container(
              height: MediaQuery.of(context).size.height - 230,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  DateRow(
                    key: ValueKey(selectedDate), // Forces widget to rebuild
                    initialDate:
                        selectedDate, // Update initial date dynamically
                    onDateSelected: (newDate) {
                      setState(() {
                        selectedDate = newDate; // Update date on selection
                      });
                    },
                    isScheduling: false,
                    middleIndex: 3, // Ensure 3 before and 3 after
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Common.sideOrangePallet(),
                      Common.rightSideOrangePallet(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Common.sideOrangePallet(),
                      Common.rightSideOrangePallet(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RoomRow(
                      buildingId: selectedBuildingId,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Common.sideOrangePallet(),
                      Common.rightSideOrangePallet(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: TimeRow2(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Common.sideOrangePallet(),
                      Common.rightSideOrangePallet(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ScheduleCard3(),
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
