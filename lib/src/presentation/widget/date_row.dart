import '../../../../export.dart';

class DateRow extends StatefulWidget {
  final DateTime initialDate;
  final bool? isScheduling;
  final ValueChanged<DateTime> onDateSelected;
  final int middleIndex;

  const DateRow({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    this.middleIndex = 3, // Keep the middle index
    this.isScheduling,
  });

  @override
  DateRowState createState() => DateRowState();
}

class DateRowState extends State<DateRow> {
  late List<DateTime> dates;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    // Set the selectedDate to the initialDate
    selectedDate = widget.initialDate;

    // Generate initial dates with selected date at the middle index
    _generateDatesAroundSelected();
  }

  /// Generates dates with the selected date at the middle index
  void _generateDatesAroundSelected() {
    dates = [];

    // Generate dates from (selectedDate - middleIndex) to (selectedDate + middleIndex)
    for (int i = -widget.middleIndex; i <= widget.middleIndex; i++) {
      dates.add(selectedDate.add(Duration(days: i)));
    }
  }

  /// Updates the selected date and regenerates dates with the new selected date at the middle
  void _onDateSelected(int index) {
    setState(() {
      selectedDate = dates[index]; // Update selected date
      _generateDatesAroundSelected(); // Recenter the selected date
    });

    widget.onDateSelected(selectedDate); // Notify the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dates.length, (index) {
        return GestureDetector(
          onTap: () => _onDateSelected(index),
          child: DateCard(
            date: dates[index],
            isSelected: dates[index] == selectedDate,
          ),
        );
      }),
    );
  }
}
