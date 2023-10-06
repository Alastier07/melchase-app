import 'package:flutter/material.dart';
import 'package:melchase_app/screens/home_screen.dart';

class MelchaseApp extends StatelessWidget {
  const MelchaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
