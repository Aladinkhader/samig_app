import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/english_page.dart';
import 'screens/courses_page.dart';
import 'screens/jobs_page.dart';
import 'screens/opportunities_page.dart';
import 'screens/settings_page.dart';
import 'theme/app_theme.dart';

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

  final List<Widget> _pages = const [
    HomePage(),
    EnglishPage(),
    CoursesPage(),
    JobsPage(),
    OpportunitiesPage(),
    SettingsPage(),
  ];

  void _changePage(int index) {
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _changePage,
        backgroundColor: Colors.white,
        elevation: 8,
        height: 70,
        indicatorColor: const Color(0xFFEDE4FF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.language_outlined),
            selectedIcon: Icon(Icons.language_rounded),
            label: 'الإنجليزية',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school_rounded),
            label: 'الكورسات',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline_rounded),
            selectedIcon: Icon(Icons.work_rounded),
            label: 'الوظائف',
          ),
          NavigationDestination(
            icon: Icon(Icons.public_outlined),
            selectedIcon: Icon(Icons.public_rounded),
            label: 'الفرص',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}
