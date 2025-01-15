import '../../../export.dart';

class DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DateCard({
    super.key,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Container(
      width: width <= 360 ? 50 : 55,
      height: 75,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.deepLightBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _getWeekdayInitial(date),
            style: bodyStyle2.copyWith(
                color: isSelected ? AppColor.white : AppColor.lightGrey),
          ),
          Text(
            date.day.toString(),
            style: bodyStyle2.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColor.white : AppColor.black,
            ),
          ),
        ],
      ),
    );
  }

  String _getWeekdayInitial(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'M';
      case DateTime.tuesday:
        return 'T';
      case DateTime.wednesday:
        return 'W';
      case DateTime.thursday:
        return 'T';
      case DateTime.friday:
        return 'F';
      case DateTime.saturday:
        return 'S';
      case DateTime.sunday:
        return 'S';
      default:
        return '';
    }
  }
}
