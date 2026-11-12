import 'package:flutter/material.dart';

// =====================================================
// PROGRAM 6 - TAB BAR
// =====================================================

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          title: const Text(
            'TabBar Navigation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF0F172A),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                isScrollable: true,
                labelColor: Color(0xFF4F46E5),
                unselectedLabelColor: Color(0xFF64748B),
                indicatorColor: Color(0xFF4F46E5),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(icon: Icon(Icons.cake_rounded), text: 'Birthdays'),
                  Tab(
                    icon: Icon(Icons.sentiment_very_satisfied_rounded),
                    text: 'Gratitude',
                  ),
                  Tab(
                    icon: Icon(Icons.notifications_active_rounded),
                    text: 'Reminders',
                  ),
                  Tab(icon: Icon(Icons.person_rounded), text: 'Profile'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _TabContentView(
              title: 'Birthdays Page',
              icon: Icons.cake_rounded,
              color: Color(0xFFEC4899),
            ),
            _TabContentView(
              title: 'Gratitude Page',
              icon: Icons.sentiment_very_satisfied_rounded,
              color: Color(0xFFF59E0B),
            ),
            _TabContentView(
              title: 'Reminders Page',
              icon: Icons.notifications_active_rounded,
              color: Color(0xFF3B82F6),
            ),
            _TabContentView(
              title: 'Profile Page',
              icon: Icons.person_rounded,
              color: Color(0xFF10B981),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabContentView extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _TabContentView({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 48, color: color),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Swipe left or right, or tap tabs above to switch views.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
