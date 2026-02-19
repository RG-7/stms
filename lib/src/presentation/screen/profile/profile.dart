// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/src/data/provider/user.dart';
import '/src/presentation/screen/selection/selection.dart';

import '../../../../export.dart';
import '../../../data/provider/schedule.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ScheduleProvider scheduleP; // Use context-provided instance later

  @override
  void initState() {
    super.initState();
    scheduleP = context.read<ScheduleProvider>(); // Access provider directly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scheduleP.isTeacher
          ? Teacher(isTeacher: scheduleP.isTeacher)
          : const SelectSubGroup(),
    );
  }
}

class Teacher extends StatelessWidget {
  const Teacher({
    super.key,
    required this.isTeacher,
  });

  final bool isTeacher;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    final sched = Provider.of<ScheduleProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app exit
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // Clear token and other user-related data from SharedPreferences
                  await prefs.remove('x-auth-token');

                  // Clear user data from UserProvider
                  user.clearUser();

                  sched.updateAsTeacherFalse();
                  sched.updateIndex(0);

                  // Navigate to SelectionScreen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: AppColor.lightBlue,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // profile picture
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(105),
                  border: Border.all(width: 1, color: AppColor.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.4),
                      blurRadius: 15,
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
            ),
            const SizedBox(
              height: 25,
            ),

            // name
            Align(
              alignment: Alignment.center,
              child: Text(
                user.user.name,
                style: h1StyleBlue.copyWith(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // EMAIL TEXT
            Text(
              AppData.emailTitle,
              style: bodyStyle2,
            ),
            const SizedBox(
              height: 16.0,
            ),

            // EMAIL TEXTFIELD
            ReadOnlyTextField(
              icon: CupertinoIcons.mail,
              hintText: user.user.email,
            ),
            const SizedBox(
              height: 15.0,
            ),

            // Reg No TEXT
            Text(
              isTeacher ? AppData.staffIdNumber : AppData.regNumber,
              style: bodyStyle2,
            ),
            const SizedBox(
              height: 16.0,
            ),

            // Reg No TEXTFIELD
            ReadOnlyTextField(
              icon: Icons.card_giftcard,
              hintText: isTeacher ? user.user.empId : user.user.facultyCode,
              isSvg: true,
              svgPath: 'assets/svg/id_card.svg',
            ),
            const SizedBox(
              height: 15.0,
            ),

            // Phone No TEXT
            Text(
              AppData.mobileNumber,
              style: bodyStyle2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Phone TEXTFIELD
            ReadOnlyTextField(
              icon: Icons.phone_outlined,
              hintText: '+91 - ${user.user.contactNumber}',
            ),
            const SizedBox(
              height: 15.0,
            ),

            // Branch TEXT
            Text(
              isTeacher ? AppData.departmentTitle : AppData.branchTitle,
              style: bodyStyle2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Branch TEXTFIELD
            ReadOnlyTextField(
              icon: Icons.school_outlined,
              hintText: user.user.deptId,
            ),
            const SizedBox(
              height: 15.0,
            ),

            // Group TEXT
            Text(
              isTeacher ? AppData.avaTitle : AppData.groupTitle,
              style: bodyStyle2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Group TEXTFIELD
            ReadOnlyTextField(
              // icon: Icons.group,
              icon: isTeacher
                  ? Icons.meeting_room_outlined
                  : CupertinoIcons.group_solid,
              hintText: isTeacher ? user.user.availableAt! : '3CS-10',
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
