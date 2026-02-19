import 'package:flutter/cupertino.dart';
import '/src/data/provider/auth.dart';
import '../../../../export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthProvider authProvider = AuthProvider();

  // bool isValidEmail(String email) {
  //   final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@sliet\\.edu$');
  //   return regex.hasMatch(email);
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 25.0,
          ),
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (height > 650)
                    const SizedBox(
                      height: 50,
                    ),
                  // CIRCLE AVTAR OR LOGO
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: AppColor.lightGrey,
                      radius: 50,
                      child: Image.asset('assets/logo-1.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // APP NAME
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppData.appName,
                      style: h1StyleBlue,
                    ),
                  ),
                  if (height > 650)
                    const SizedBox(
                      height: 50.0,
                    ),

                  // LOGIN TEXT
                  Text(
                    AppData.loginTitle,
                    style: h2StyleBlack,
                  ),
                  const SizedBox(
                    height: 0.05,
                  ),

                  // LOGIN DESC
                  Text(
                    AppData.loginDesc,
                    style: bodyStyle2Grey,
                  ),
                  const SizedBox(
                    height: 20.0,
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
                  AppTextField(
                    controller: authProvider.emailController,
                    validator: AppData.isValidSlietEmail,
                    onChanged: (value) {
                      final normalizedValue = AppData.normalizeEmail(value);
                      if (normalizedValue != value) {
                        authProvider.emailController.value = TextEditingValue(
                          text: normalizedValue,
                          selection: TextSelection.collapsed(
                              offset: normalizedValue.length),
                        );
                      }
                    },
                    icon: CupertinoIcons.mail,
                    hintText: '***@sliet.edu',
                    errorMessage: AppData.emailErrorMessage,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  // PASSWORD TEXT
                  Text(
                    AppData.passwordTitle,
                    style: bodyStyle2,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  // PASSWORD TEXTFIELD
                  AppTextField(
                    controller: authProvider.passwordController,
                    icon: CupertinoIcons.lock,
                    validator: (value) {
                      return value.isNotEmpty;
                    },
                    isPassword: true,
                    hintText: 'Enter your password',
                    errorMessage: AppData.passwordErrorMessage,
                  ),

                  const SizedBox(
                    height: 7.0,
                  ),
                  // FORGOT PASSWORD ?
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassword(
                          authProvider: authProvider,
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text(
                          AppData.forgetPasswordTitle,
                          style: bodyStyle2.copyWith(
                            color: AppColor.lightBlue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  // LOGIN BUTTON
                  LightBlueTextButton(
                    onpressed: () => authProvider.login(context),
                    text: AppData.loginTitle,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),

                  // OR DIVIDER
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.lightGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          AppData.orTitle,
                          style: bodyStyle2.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),

                  // NEW HERE BUTTON
                  SimpleWhiteTextButton(
                    onpressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewHere(authProvider: authProvider),
                      ),
                    ),
                    text: AppData.newHereTile,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
