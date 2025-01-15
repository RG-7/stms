import '../../../export.dart';

class TimeRow2 extends StatefulWidget {
  final List<String> times;
  final ValueChanged<String> onTimeSelected;
  const TimeRow2({
    super.key,
    required this.times,
    required this.onTimeSelected,
  });

  @override
  State<TimeRow2> createState() => _TimeRow2State();
}

class _TimeRow2State extends State<TimeRow2> {
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.times.first;
  }

  void _onTimeSelected(int index) {
    setState(() {
      selectedTime = widget.times[index];
    });
    widget.onTimeSelected(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: List.generate(
        widget.times.length,
        (index) {
          return GestureDetector(
            onTap: () => _onTimeSelected(index),
            child: TimeCard(
              time: widget.times[index],
              isSelected: widget.times[index] == selectedTime,
              isAlreadyOccupied: false,
            ),
          );
        },
      ),
    );
  }
}
