import 'package:flutter/cupertino.dart';

import '../../../export.dart';

class AppTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final IconData icon;
  final String? hintText;
  final bool? isPassword;
  final ValueChanged<String>? onChanged;
  final bool Function(String)? validator;
  final String? errorMessage;
  final bool? obsecureText;

  const AppTextField({
    super.key,
    this.keyboardType,
    required this.icon,
    this.isPassword,
    this.hintText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.errorMessage,
    this.obsecureText,
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  String? _errorMessage;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            if (widget.validator != null) {
              final isValid = widget.validator!(value);
              if (!isValid) {
                setState(() {
                  _errorMessage = widget.errorMessage ?? 'Invalid input';
                });
              } else {
                setState(() {
                  _errorMessage = null;
                });
              }
            }
            widget.onChanged?.call(value);
          },
          controller: widget.controller,
          style: textfieldStyle,
          cursorColor: AppColor.lightGrey,
          maxLines: 1,
          keyboardType: widget.keyboardType,
          obscureText: widget.obsecureText ?? widget.isPassword == true
              ? _obscureText
              : false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: AppColor.lightBlue,
            ),
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: AppColor.lightGrey,
                    ),
                    onPressed: _toggleVisibility,
                  )
                : null,
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.lightGrey,
                width: 2.0,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: textfieldHintTextStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.lightGrey,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColor.lightGrey,
                width: 2.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        if (_errorMessage != null)
          TextFieldErrorMessage(message: _errorMessage!),
      ],
    );
  }
}

class TextFieldErrorMessage extends StatelessWidget {
  final String message;
  const TextFieldErrorMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        const Icon(
          CupertinoIcons.circle_fill,
          color: Colors.red,
          size: 6,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          message,
          style: smallErrorMessage,
        )
      ],
    );
  }
}
