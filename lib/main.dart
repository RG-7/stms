// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttms_student/src/data/provider/auth.dart';
import '/src/data/provider/user.dart';
import 'package:ttms_student/src/presentation/screen/extra/refresh_page.dart';
import 'package:ttms_student/src/services/auth.dart';
import 'src/data/provider/connectivity.dart';
import 'src/data/provider/schedule.dart';
import 'src/presentation/screen/selection/selection.dart';
import 'export.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ScheduleProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeApp();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? selectedGroup = prefs.getString('selectedSubGroup');
      if (selectedGroup != null) {
        Provider.of<ScheduleProvider>(context, listen: false)
            .updateSelectedSubGroup(selectedGroup);
      }
    });
  }

  Future<void> initializeApp() async {
    try {
      final authService = AuthServices();
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      // Fetch user data and token
      await authService.getUserData(context);
      await userProvider.getToken();
    } catch (e) {
      // Handle errors during initialization
    } finally {
      // Ensure UI updates after initialization
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userPro = Provider.of<UserProvider>(context);
    final sched = Provider.of<ScheduleProvider>(context);
    return Consumer<ConnectivityProvider>(
      builder: (context, connectivityProvider, child) {
        if (connectivityProvider.connectionStatus
            .contains(ConnectivityResult.none)) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: RefreshPage(), // Show No Internet Page
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: _isLoading
              ? const SplashScreen() // Show splash screen while app initializes
              : userPro.token != null && userPro.token!.isNotEmpty
                  ? (userPro.user.designation == 'Professor'
                      ? const DashBoard()
                      : const SelectionScreen())
                  : (sched.selectedSubGroup != null &&
                          sched.selectedSubGroup != '')
                      ? const DashBoard()
                      : const SelectionScreen(),
        );
      },
    );
  }
}
