import 'package:ttms_student/src/services/auth.dart';
import '/export.dart';

class AuthProvider extends ChangeNotifier {
  // email
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  // password
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  // otp controllers
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  // new password controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();

  // otp
  String _otps = '';
  String get otps => _otps;

  AuthServices authServices = AuthServices();

  //
  final formKey = GlobalKey<FormState>();

  // dispose
  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    newPasswordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  // update otp
  void updateOtps() {
    _otps = (otpController1.text).trim() +
        (otpController2.text).trim() +
        (otpController3.text).trim() +
        (otpController4.text).trim();
    notifyListeners();
  }

  // login
  void login(BuildContext context) {
    authServices.signInUser(
      context: context,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    notifyListeners();
  }

  // send OTP
  void sendOTP(BuildContext context) {
    authServices.sendOTP(
      context: context,
      email: emailController.text.toLowerCase().trim(),
    );
    notifyListeners();
  }

  // verify OTP
  void verifyOTP(BuildContext context, String emailS) {
    if (_otps.isNotEmpty) {
      authServices.verifyOTP(
        context: context,
        email: emailS,
        otp: otps.trim().toString(),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP cannot be empty.")),
      );
    }
  }

  // handle submit OTP
  void handleSubmitOtp(BuildContext context, String emailS) {
    updateOtps(); // Ensure _otps is updated

    // print type of otps

    if (_otps.length != 4) {
      // Only check the length
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all the OTP fields.")),
      );
      return;
    }

    verifyOTP(context, emailS); // Proceed if valid
  }

  // reset password
  void resetPassword(BuildContext context, String email, String newPass) {
    authServices.resetPassword(
      context: context,
      email: email,
      newPassword: newPass,
    );
    notifyListeners();
  }

  // Add listeners to OTP controllers
  AuthProvider() {
    otpController1.addListener(updateOtps);
    otpController2.addListener(updateOtps);
    otpController3.addListener(updateOtps);
    otpController4.addListener(updateOtps);
  }
}
