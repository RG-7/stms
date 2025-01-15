// ignore_for_file: use_build_context_synchronously

import '../../../../export.dart';

class OTPVerified extends StatefulWidget {
  final String email;
  const OTPVerified({super.key, required this.email});

  @override
  State<OTPVerified> createState() => _OTPVerifiedState();
}

class _OTPVerifiedState extends State<OTPVerified> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword(email: widget.email,)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // tick
            const Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(191, 193, 252, 1),
                    radius: 100,
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(93, 96, 239, 1),
                    radius: 75,
                  ),
                  Icon(
                    Icons.check,
                    color: AppColor.white,
                    size: 75,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            // Text
            Align(
              alignment: Alignment.center,
              child: Text(
                'OTP\nVerified\nSuccessfully',
                style: h1StyleBlack.copyWith(
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
