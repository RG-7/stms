// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../export.dart';

class LightBlueTextButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const LightBlueTextButton({
    super.key,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(
            double.infinity,
            55,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColor.lightBlue,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: whiteButtonTextStyle,
      ),
    );
  }
}

class SimpleWhiteTextButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const SimpleWhiteTextButton({
    super.key,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(
            double.infinity,
            55,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColor.white,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColor.lightGrey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: blackButtonTextStyle,
      ),
    );
  }
}
