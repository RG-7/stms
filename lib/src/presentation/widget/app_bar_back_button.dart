import 'package:flutter/cupertino.dart';
import '../../../export.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        CupertinoIcons.arrow_left,
        color: AppColor.lightBlue,
        size: 25,
      ),
    );
  }
}
