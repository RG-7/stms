import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '/src/data/provider/schedule.dart';
import '/src/data/model/schedule.dart';
import '/src/data/provider/user.dart';
import '/src/presentation/screen/check_slot/check_slot.dart';
import '/src/presentation/screen/room_avability_check/room_avability_check.dart';
import '/src/presentation/widget/common_loader.dart';
import '../../../../export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ScheduleProvider scheduleP = context.read<ScheduleProvider>(); // Access provider directly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scheduleP.updateDate(DateTime.now(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sched = Provider.of<ScheduleProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    String initials = user.getInitials();
    return Scaffold(
      floatingActionButton: sched.isTeacher == true
          ? SpeedDial(
              backgroundColor: AppColor.black,
              animatedIcon: AnimatedIcons.menu_close,
              spacing: 12,
              spaceBetweenChildren: 25,
              overlayColor: AppColor.black,
              overlayOpacity: 0.4,
              animatedIconTheme: const IconThemeData(color: Colors.white),
              children: [
                SpeedDialChild(
                  child: const Icon(CupertinoIcons.add_circled,
                      color: AppColor.white),
                  backgroundColor: AppColor.darkBlue,
                  label: 'Add Class',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddClass(),
                      ),
                    );
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.meeting_room_rounded,
                      color: AppColor.white),
                  backgroundColor: Colors.lightGreen,
                  label: 'Check Avability',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoomAvabilityCheck(),
                      ),
                    );
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.group_rounded, color: AppColor.white),
                  backgroundColor: Colors.red,
                  label: 'Check Slot',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckSlot(),
                      ),
                    );
                  },
                ),
              ],
            )
          : null,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: width <= 360 ? 25 : 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFD4E7FE),
                  // Color(0xFFF0F0F0),
                  AppColor.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 0.3],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: width <= 360 ? 10 : 15),
                // date and day
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: DateFormat('E').format(DateTime.now()),
                      style: bodyStyle2.copyWith(
                        color: const Color(0XFF263064),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' ${DateFormat('d MMM').format(DateTime.now())}',
                          style: bodyStyle2.copyWith(
                            color: const Color(0XFF263064),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // row of image name and desc
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: AppColor.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withValues(alpha: 0.2),
                            blurRadius: 12,
                            spreadRadius: 8,
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi ${user.user.designation == "Professor" ? initials : sched.selectedSubGroup},',
                          style: h1StyleBlue.copyWith(fontSize: 30),
                        ),
                        Text(
                          'Here is a list of schedule',
                          style: bodyStyle2.copyWith(
                              color: Colors.blueGrey, fontSize: 12),
                        ),
                        Text(
                          'you need to check...',
                          style: bodyStyle2.copyWith(
                              color: Colors.blueGrey, fontSize: 12),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // positined
          Positioned(
            top: width <= 360 ? 150 : 185,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height - 245,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Consumer<ScheduleProvider>(
                builder: (context, scheduleProvider, child) {
                  // Loading state
                  if (scheduleProvider.isLoading) {
                    return const CommonLoader();
                  }

                  // Error state
                  if (scheduleProvider.error != null) {
                    return Center(
                      child: Text(
                        scheduleProvider.error!,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  // No data available
                  if (scheduleProvider.schedule.isEmpty) {
                    return const Center(
                      child: Text(
                        'No schedule available!',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: width <= 360 ? 10 : 15,
                        ),
                        // title row
                        Row(
                          children: [
                            Text(
                              'TODAY CLASSES',
                              style: bodyStyle2.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              ' (${sched.schedule.length})',
                              style: bodyStyle2Grey.copyWith(fontSize: 16),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => sched.updateIndex(1),
                              child: Text(
                                'See all',
                                style: bodyStyle2.copyWith(
                                  fontSize: 16,
                                  color: AppColor.lightBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(
                          height: width <= 360 ? 10 : 5,
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: scheduleProvider.schedule.length,
                          itemBuilder: (context, index) {
                            if (index < 0 ||
                                index >= scheduleProvider.schedule.length) {
                              return const SizedBox(); // Avoid range error
                            }
                            Schedule schedule =
                                scheduleProvider.schedule[index];
                            return ScheduleCard(schedule: schedule);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
