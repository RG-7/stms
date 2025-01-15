import '../../../../export.dart';

class RoomRow extends StatefulWidget {
  final String buildingId;
  const RoomRow({super.key, required this.buildingId});

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  int selectedRoomIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filteredRooms =
        allrooms.where((room) => room.buildingId == widget.buildingId).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(filteredRooms.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedRoomIndex = index;
              });
            },
            child: RoomCard(
              isSelected: selectedRoomIndex == index,
              room: filteredRooms[index],
            ),
          );
        }),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final bool isSelected;
  final Room room;
  const RoomCard({super.key, required this.isSelected, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 40,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.deepLightBlue
            : const Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          room.roomAbbreviation,
          style: bodyStyle1.copyWith(
              fontSize: 16,
              color: isSelected ? AppColor.white : AppColor.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
