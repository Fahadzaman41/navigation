import 'package:flutter/material.dart';
import 'simple_page.dart';

// =====================================================
// PROGRAM 7 - DRAWER AND LISTVIEW
// =====================================================

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Drawer Navigation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: const Text(
                'Fahad Developer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: const Text(
                'student@example.com',
                style: TextStyle(color: Colors.white70),
              ),
              currentAccountPicture: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFEEF2FF),
                  child: Icon(
                    Icons.person_rounded,
                    size: 38,
                    color: Color(0xFF4F46E5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  _buildDrawerTile(
                    icon: Icons.home_rounded,
                    title: 'Home',
                    color: const Color(0xFF4F46E5),
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerTile(
                    icon: Icons.cake_rounded,
                    title: 'Birthdays',
                    color: const Color(0xFFEC4899),
                    onTap: () => openPage(
                      context,
                      const SimplePage(title: 'Birthdays'),
                    ),
                  ),
                  _buildDrawerTile(
                    icon: Icons.sentiment_very_satisfied_rounded,
                    title: 'Gratitude',
                    color: const Color(0xFFF59E0B),
                    onTap: () => openPage(
                      context,
                      const SimplePage(title: 'Gratitude'),
                    ),
                  ),
                  _buildDrawerTile(
                    icon: Icons.notifications_active_rounded,
                    title: 'Reminders',
                    color: const Color(0xFF3B82F6),
                    onTap: () => openPage(
                      context,
                      const SimplePage(title: 'Reminders'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  _buildDrawerTile(
                    icon: Icons.settings_rounded,
                    title: 'Settings',
                    color: const Color(0xFF64748B),
                    onTap: () => openPage(
                      context,
                      const SimplePage(title: 'Settings'),
                    ),
                  ),
                  _buildDrawerTile(
                    icon: Icons.info_rounded,
                    title: 'About',
                    color: const Color(0xFF0EA5E9),
                    onTap: () => openPage(
                      context,
                      const SimplePage(title: 'About'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
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
                      color: const Color(0xFFEEF2FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.menu_open_rounded,
                      size: 48,
                      color: Color(0xFF4F46E5),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Drawer Navigation',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Swipe from left or tap top-left menu icon to open drawer.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 24),
                  Builder(
                    builder: (context) {
                      return OutlinedButton.icon(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF4F46E5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        icon: const Icon(Icons.menu_rounded, color: Color(0xFF4F46E5)),
                        label: const Text(
                          'Open Drawer',
                          style: TextStyle(
                            color: Color(0xFF4F46E5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 20,
          color: Color(0xFF94A3B8),
        ),
        onTap: onTap,
      ),
    );
  }
}
