import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import '../../../../export.dart';
import '../../../data/provider/connectivity.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({super.key});

  void _checkConnectivityAndNavigateBack(BuildContext context) {
    final connectivityProvider =
        Provider.of<ConnectivityProvider>(context, listen: false);

    // Check if the connection has been restored
    if (!connectivityProvider.connectionStatus
        .contains(ConnectivityResult.none)) {
      // Navigate back to the previous page
      Navigator.pop(context);
    } else {
      // Show a snackbar if the internet is still unavailable
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image asset for no internet
            Image.asset(
              AppAsset.noInternet,
            ),
            // "Oh Oh" Text
            Text(
              AppData.ohoh,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 85,
                ),
              ),
            ),
            // Description Text
            Text(
              AppData.noInternetDesc,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            // Try Again Button
            TextButton(
              onPressed: () => _checkConnectivityAndNavigateBack(context),
              child: Text(
                'Try Again',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: AppColor.lightOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
