import 'package:provider/provider.dart';
import 'package:ttms_student/src/data/provider/auth.dart';
import 'package:ttms_student/src/presentation/widget/otp_boxes.dart';

import '../../../../export.dart';

class OTP extends StatefulWidget {
  final String email;
  const OTP({super.key, required this.email});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: AppBarBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // otp verification tile
              Text(
                AppData.otpVerificationTitle,
                style: h1StyleBlack.copyWith(fontSize: 30),
              ),

              // text of line
              Text(
                AppData.otpSentDesc,
                style: bodyStyle2Grey.copyWith(fontSize: 15),
              ),
              Text(
                widget.email,
                style: bodyStyle2.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 35.0,
              ),

              // boxes
              otpBoxes(context, authProvider, _formKey),

              const SizedBox(
                height: 25.0,
              ),
              // verify button
              LightBlueTextButton(
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider.handleSubmitOtp(context, widget.email);
                  }
                },
                text: AppData.verifyCodeTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
