import 'package:flutter/cupertino.dart';
import 'package:ttms_student/src/data/provider/auth.dart';

import '../../../../export.dart';

class NewHere extends StatefulWidget {
  final AuthProvider authProvider;
  const NewHere({super.key, required this.authProvider});

  @override
  State<NewHere> createState() => _NewHereState();
}

class _NewHereState extends State<NewHere> {
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
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // congrats title
              Text(
                AppData.congratulationsTitle,
                style: h1StyleBlack.copyWith(fontSize: 30),
              ),

              // new_here desc
              Text(
                AppData.firstTimeDesc,
                style: bodyStyle2Grey.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 20.0,
              ),

              // email text
              Text(
                AppData.emailTitle,
                style: bodyStyle2,
              ),
              const SizedBox(
                height: 16.0,
              ),

              // EMAIL TEXTFIELD
              AppTextField(
                controller: widget.authProvider.emailController,
                validator: (value) {
                  final RegExp regex =
                      RegExp(r'^[a-zA-Z0-9._%+-]+@thapar\.edu$');
                  return regex.hasMatch(value);
                },
                icon: CupertinoIcons.mail,
                hintText: '***@thapar.edu',
                errorMessage: AppData.emailErrorMessage,
              ),
              const SizedBox(
                height: 15.0,
              ),

              // policy
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    CupertinoIcons.info,
                    color: AppColor.lightOrange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      AppData.agreeDesc,
                      style: bodyStyle2Grey.copyWith(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),

              // submit button
              LightBlueTextButton(
                onpressed: () {
                  widget.authProvider.sendOTP(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTP(
                        email: widget.authProvider.emailController.text.trim(),
                      ),
                    ),
                  );
                },
                text: AppData.getOTPTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
