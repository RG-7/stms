import '../../../export.dart';

class TimeCard extends StatelessWidget {
  final String time;
  final bool isSelected;
  final bool isAlreadyOccupied;

  const TimeCard({
    super.key,
    required this.time,
    this.isAlreadyOccupied = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.deepLightBlue
            : isAlreadyOccupied
                ? Colors.red
                : const Color.fromARGB(255, 0, 202, 20),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          time,
          style: bodyStyle1.copyWith(fontSize: 16, color: AppColor.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
