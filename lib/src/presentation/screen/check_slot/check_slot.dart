import '/export.dart';

class CheckSlot extends StatefulWidget {
  const CheckSlot({super.key});

  @override
  State<CheckSlot> createState() => _CheckSlotState();
}

class _CheckSlotState extends State<CheckSlot> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
