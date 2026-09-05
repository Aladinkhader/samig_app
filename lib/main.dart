import 'package:flutter/material.dart';

void main() {
  runApp(const SamigTreasuresApp());
}

class SamigTreasuresApp extends StatelessWidget {
  const SamigTreasuresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'كنوز سامغ',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F6FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B21B6),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كنوز سامغ'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'مرحبًا بك في كنوز سامغ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
