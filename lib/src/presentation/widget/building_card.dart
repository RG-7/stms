import '../../../export.dart';

class BuildingCard extends StatelessWidget {
  final bool isSelected;
  final Building building;

  const BuildingCard(
      {super.key, required this.building, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.lightBlue
            : const Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          building.abbreviation,
          style: bodyStyle1.copyWith(
              fontSize: 16,
              color: isSelected ? AppColor.white : AppColor.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
