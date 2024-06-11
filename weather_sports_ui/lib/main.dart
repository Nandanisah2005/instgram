import 'package:flutter/material.dart';
import 'package:weather_sports_ui/sports_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SportsViewScreen(),
    );
  }
}
