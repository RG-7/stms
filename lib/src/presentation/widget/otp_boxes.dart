import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ttms_student/src/data/provider/auth.dart';

Widget otpBoxes(BuildContext context, AuthProvider authProvider,
    GlobalKey<FormState> formKey) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOTPField(context, authProvider.otpController1),
            _buildOTPField(context, authProvider.otpController2),
            _buildOTPField(context, authProvider.otpController3),
            _buildOTPField(context, authProvider.otpController4),
          ],
        ),
      ],
    ),
  );
}

Widget _buildOTPField(BuildContext context, TextEditingController controller) {
  return SizedBox(
    height: 68,
    width: 64,
    child: TextFormField(
      controller: controller,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      decoration: InputDecoration(
        enabled: true,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 53, 194, 193),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
    ),
  );
}
