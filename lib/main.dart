import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const SilentSOSApp());
}

class SilentSOSApp extends StatelessWidget {
  const SilentSOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silent SOS',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
