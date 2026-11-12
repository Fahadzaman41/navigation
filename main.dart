import 'package:flutter/material.dart';
import 'program1.dart';
import 'program2.dart';
import 'program3.dart';
import 'program4.dart';
import 'program5.dart';
import 'program6.dart';
import 'program7.dart';
import 'bonus.dart';

void main() {
  runApp(const MyApp());
}

// =====================================================
// MAIN APPLICATION
// =====================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Practicals',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          primary: const Color(0xFF4F46E5),
          secondary: const Color(0xFF0D9488),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0F172A),
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
        ),
      ),
      home: const MainMenu(),
    );
  }
}

// =====================================================
// MAIN MENU
// =====================================================

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  final List<Map<String, dynamic>> programs = const [
    {
      'title': 'Program 1 - Navigator',
      'subtitle': 'Basic push & pop screen navigation',
      'category': 'Basics',
      'icon': Icons.navigation_rounded,
      'color': Color(0xFF4F46E5),
    },
    {
      'title': 'Program 2 - Named Routes',
      'subtitle': 'Route table navigation system',
      'category': 'Routes',
      'icon': Icons.alt_route_rounded,
      'color': Color(0xFF0284C7),
    },
    {
      'title': 'Program 3 - Hero Animation',
      'subtitle': 'Shared element transition effects',
      'category': 'Animations',
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFF7C3AED),
    },
    {
      'title': 'Program 4 - Bottom Navigation',
      'subtitle': 'Multi-tab screen switcher bar',
      'category': 'Layouts',
      'icon': Icons.space_dashboard_rounded,
      'color': Color(0xFF0D9488),
    },
    {
      'title': 'Program 5 - Bottom App Bar',
      'subtitle': 'Notched bar & Floating Action Button',
      'category': 'Components',
      'icon': Icons.view_headline_rounded,
      'color': Color(0xFFEA580C),
    },
    {
      'title': 'Program 6 - TabBar View',
      'subtitle': 'Swipeable tab bar controller',
      'category': 'Tabs',
      'icon': Icons.tab_rounded,
      'color': Color(0xFFEC4899),
    },
    {
      'title': 'Program 7 - Drawer Menu',
      'subtitle': 'Side navigation drawer & ListView',
      'category': 'Drawer',
      'icon': Icons.menu_rounded,
      'color': Color(0xFF2563EB),
    },
    {
      'title': 'Bonus - Return Data',
      'subtitle': 'Pass and receive data between screens',
      'category': 'Data',
      'icon': Icons.assignment_return_rounded,
      'color': Color(0xFF10B981),
    },
  ];

  void openProgram(BuildContext context, int index) {
    final pages = [
      const NavigatorPage(),
      const NamedHomePage(),
      const HeroHomePage(),
      const BottomNavigationPage(),
      const BottomBarPage(),
      const TabsPage(),
      const DrawerHomePage(),
      const ReturnDataPage(),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Navigation Practicals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4F46E5).withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '8 Modules Completed',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Flutter Navigation Hub',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Explore practical navigation patterns, routes, animations, bottom bars, and interactive widgets.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Practicals List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 16),

              // Program List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: programs.length,
                itemBuilder: (context, index) {
                  final item = programs[index];
                  final color = item['color'] as Color;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: color,
                          size: 26,
                        ),
                      ),
                      title: Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          item['subtitle'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F5F9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      onTap: () => openProgram(context, index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
