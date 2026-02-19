import 'package:lottie/lottie.dart';
import '/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/loading.json', // Path to your Lottie file
                width: 200, // Optional: Set width
                height: 200, // Optional: Set height
                fit: BoxFit.contain, // Optional: Adjust fit
              ),
              //const SizedBox(height: 20),
              Text(
                'STMS',
                style: GoogleFonts.montserrat(
                  color: AppColor.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
