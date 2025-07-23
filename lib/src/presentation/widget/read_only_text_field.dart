
import 'package:flutter_svg/svg.dart';

import '../../../export.dart';


class ReadOnlyTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final String? svgPath;
  final bool? isSvg;
  const ReadOnlyTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isSvg, this.svgPath,
  });

  @override
  State<ReadOnlyTextField> createState() => _ReadOnlyTextFieldState();
}

class _ReadOnlyTextFieldState extends State<ReadOnlyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      style: textfieldStyle,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: widget.isSvg == true
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  widget.svgPath!, // Assuming hintText is the path to the SVG
                  colorFilter: const ColorFilter.mode(AppColor.lightBlue, BlendMode.srcIn),
                  width: 24,
                  height: 24,
                ),
              )
            : Icon(
                widget.icon,
                color: AppColor.lightBlue,
              ),
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
        hintStyle: textfieldHintTextStyle.copyWith(
            color: AppColor.black, fontWeight: FontWeight.bold),
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
    );
  }
}
