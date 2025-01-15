import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../../export.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/json/loading.json', // Path to your Lottie file
        width: 200, // Optional: Set width
        height: 200, // Optional: Set height
        fit: BoxFit.contain, // Optional: Adjust fit
      ),
    );
  }
}
