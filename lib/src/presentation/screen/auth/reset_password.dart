import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '/core/constants/utlis.dart';
import '/src/data/provider/auth.dart';

import '../../../../export.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({
    super.key,
    required this.email,
  });

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),

              // set a pass
              Text(
                AppData.setAPassTitle,
                style: h1StyleBlack.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),

              AppTextField(
                icon: CupertinoIcons.lock,
                controller: auth.newPasswordController,
                hintText: 'New Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              AppTextField(
                icon: CupertinoIcons.lock_open,
                controller: auth.verifyPasswordController,
                hintText: 'Re-enter your password',
              ),
              const SizedBox(
                height: 25,
              ),

              LightBlueTextButton(
                onpressed: () {
                  if (auth.newPasswordController.text.trim().isNotEmpty &&
                      auth.verifyPasswordController.text.trim().isNotEmpty) {
                    if (auth.newPasswordController.text.trim() ==
                        auth.verifyPasswordController.text.trim()) {
                      auth.resetPassword(context, widget.email,
                          auth.newPasswordController.text.trim());
                    } else {
                      showSnackBar(context, "Pass Doesn't Match");
                    }
                  }
                },
                text: AppData.setPass,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
