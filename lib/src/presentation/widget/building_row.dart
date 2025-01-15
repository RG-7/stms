import '../../../export.dart';

class BuildingRow extends StatefulWidget {
  final ValueChanged<String> onBuildingSelected;
  const BuildingRow({super.key, required this.onBuildingSelected});

  @override
  State<BuildingRow> createState() => _BuildingRowState();
}

class _BuildingRowState extends State<BuildingRow> {
  int selectedBuildingIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(allBuilding.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBuildingIndex = index;
              });
              widget.onBuildingSelected(allBuilding[index].buildingId);
            },
            child: BuildingCard(
              isSelected: selectedBuildingIndex == index,
              building: allBuilding[index],
            ),
          );
        }),
      ),
    );
  }
}
