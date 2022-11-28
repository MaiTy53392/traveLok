import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/Onboard/OnboardPage.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {

    var splashHome = const Duration(seconds: 5);

    // delayed 3 seconds to next page
    Future.delayed(splashHome, () {
      // to next page and close this page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OnboardPage();
          },
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(new Color(0xFF42A5F5)), (new Color(0xFF448AFF))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          const Center(
            child: Text(
              "TraveloK Vietnam",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
