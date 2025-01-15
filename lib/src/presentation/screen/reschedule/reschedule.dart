import '../../../../export.dart';

class Reschedule extends StatefulWidget {
  const Reschedule({super.key});

  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  DateTime selectedDate = DateTime.now();
  String selectedBuildingId =
      allBuilding.first.buildingId; // Default to the first building

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: AppBarBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScheduleCard3(),
            Common.sideOrangePallet(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DateRow(
                isScheduling: true,
                initialDate: selectedDate,
                onDateSelected: (newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
              ),
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
}
