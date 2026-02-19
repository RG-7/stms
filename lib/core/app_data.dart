class AppData {
  const AppData._();

  static final RegExp _slietEmailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@sliet\.edu$');

  static String normalizeEmail(String value) => value.trim().toLowerCase();

  static bool isValidSlietEmail(String value) {
    final normalizedValue = normalizeEmail(value);
    return _slietEmailRegex.hasMatch(normalizedValue);
  }

  static const onBoardingHead1 = 'Welcome to SCHED';
  static const onBoardingHead2 = 'Real-Time Collaboration';
  static const onBoardingHead3 = 'Flexibility Empowered';
  static const onBoardingHead4 = 'Centralized Control';
  static const onBoardingHead5 = 'Automatic Reflection';

  static const onBoardingDesc1 =
      'Streamline academic planning with real-time updates, centralized control, and automatic reflection.';
  static const onBoardingDesc2 =
      'Make instant updates to class schedules and inform everyone in real-time.';
  static const onBoardingDesc3 =
      'Empower educators to respond efficiently to unexpected events and manage class schedules.';
  static const onBoardingDesc4 =
      'Oversee the entire schedule and ensure a synchronized and well-organized academic calendar.';
  static const onBoardingDesc5 =
      'Eliminate manual updates and guarantee accuracy and consistency in scheduling information.';

  static const ohoh = 'oh oh !';
  static const noInternetDesc = 'Looks like you don’t have internet connection';

  static const appName = 'STMS';

  // login
  static const loginTitle = 'Login';
  static const setPass = 'Set Password';
  static const setAPassTitle = 'Set a Password !';
  static const otpVerificationTitle = 'OTP Verification !';
  static const otpSentDesc = 'Enter the OTP sent on ';
  static const otpVerifiedSuccess = 'OTP Verified Successfully';
  static const verifyCodeTitle = 'Verify Code';
  static const getOTPTitle = 'Get OTP';
  static const loginDesc = 'Let\'s get to work';
  static const emailTitle = 'Email';
  static const passwordTitle = 'Password';
  static const forgetPasswordTitle = 'Forget Password?';
  static const orTitle = 'OR';
  static const newHereTile = 'New Here ?';

  static const emailErrorMessage = 'Enter your SLIET email address!';
  static const passwordErrorMessage = 'Password Can\'t be empty!';

  static const congratulationsTitle = 'Congratulations!';
  static const dontWorryTitle = 'Don\'t Worry !';
  static const agreeDesc =
      'On submitting you agree to receive automatic generated email.';
  static const firstTimeDesc =
      'To access your profile you just need to type your SLIET Email. We will reach out to you within no time.';
  static const forgetPassDesc =
      'Just type your SLIET\'s valid email. Will Send you a reset link shortly.';
  static const regNumber = 'Regestration Number';
  static const staffIdNumber = 'Staff Identification Number';
  static const mobileNumber = 'Mobile Number';
  static const branchTitle = 'Branch';
  static const departmentTitle = 'Department';
  static const groupTitle = 'Group';
  static const avaTitle = 'Available At';
  static const msg = 'Message';
  static const optional = 'optional';
  static const type = 'Type';
  static const class_ = 'Class';
  static const subject = 'Subject';
}
