import 'package:flutter/material.dart';
import 'Views/SplashHome/SplashHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TraveloK Vietnam App',
      theme: ThemeData(
        platform: TargetPlatform.iOS
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashHome(title: 'TraveloK Vietnam'),
    );
  }
}
