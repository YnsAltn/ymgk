import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const KasifApp());
}

class KasifApp extends StatelessWidget {
  const KasifApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dünya Kaşifi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}
