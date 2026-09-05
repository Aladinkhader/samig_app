import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/english_page.dart';
import 'screens/courses_page.dart';
import 'screens/jobs_page.dart';
import 'screens/opportunities_page.dart';
import 'screens/settings_page.dart';
import 'theme/app_theme.dart';
import 'widgets/animated_bottom_bar.dart';

void main() {
  runApp(const SamigTreasureApp());
}

class SamigTreasureApp extends StatelessWidget {
  const SamigTreasureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samig Treasure',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    EnglishPage(),
    CoursesPage(),
    JobsPage(),
    OpportunitiesPage(),
    SettingsPage(),
  ];

  void _changePage(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedBottomBar(
        currentIndex: _currentIndex,
        onTap: _changePage,
      ),
    );
  }
}
