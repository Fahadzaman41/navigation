import 'package:flutter/material.dart';
import 'simple_page.dart';

// =====================================================
// PROGRAM 2 - NAMED ROUTES
// =====================================================

class NamedHomePage extends StatelessWidget {
  const NamedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NamedRoutesPage(),
        '/about': (context) => const SimplePage(title: 'About'),
        '/contact': (context) => const SimplePage(title: 'Contact'),
        '/help': (context) => const SimplePage(title: 'Help'),
      },
    );
  }
}

class NamedRoutesPage extends StatelessWidget {
  const NamedRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Named Routes Navigation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAlignment.stretch,
            children: [
              // Banner Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0284C7), Color(0xFF2563EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0284C7).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.alt_route_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Named Routes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Navigate effortlessly between screens using string route names like "/about", "/contact", and "/help".',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'Registered Routes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 16),

              _buildRouteTile(
                context,
                title: 'Open About Route',
                routeName: '/about',
                icon: Icons.info_outline_rounded,
                color: const Color(0xFF4F46E5),
              ),
              const SizedBox(height: 12),
              _buildRouteTile(
                context,
                title: 'Open Contact Route',
                routeName: '/contact',
                icon: Icons.contact_support_outline_rounded,
                color: const Color(0xFF0D9488),
              ),
              const SizedBox(height: 12),
              _buildRouteTile(
                context,
                title: 'Open Help Route',
                routeName: '/help',
                icon: Icons.help_outline_rounded,
                color: const Color(0xFFEA580C),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRouteTile(
    BuildContext context, {
    required String title,
    required String routeName,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        subtitle: Text(
          'Route: $routeName',
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Color(0xFF94A3B8),
        ),
        onTap: () => Navigator.pushNamed(context, routeName),
      ),
    );
  }
}
