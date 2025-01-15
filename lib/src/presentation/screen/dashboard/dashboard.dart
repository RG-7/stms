import 'package:provider/provider.dart';

import '/export.dart';
import '/src/data/provider/schedule.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final sched = Provider.of<ScheduleProvider>(context);
    return Scaffold(
      body: sched.body[sched.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(
          0XFFF9F9FB,
        ),
        onTap: sched.updateIndex,
        currentIndex: sched.currentIndex,
        items: List.generate(
          sched.icons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              sched.icons[index],
              color: sched.currentIndex == index
                  ? Colors.blueGrey
                  : AppColor.lightGrey,
            ),
            label: '',
          ),
        ),
      ),
    );
  }
}
