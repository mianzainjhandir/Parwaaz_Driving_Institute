import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/parwaz_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedTab = 'Home';

  Future<void> _launchWhatsApp() async {
    // Phone number: 03234248524 -> international format: +923234248524
    final Uri url = Uri.parse('https://wa.me/923234248524?text=Hello%20Parwaaz%20Driving%20Institute,%20I%20would%20like%20to%20inquire%20about%20your%20driving%20courses.');
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch WhatsApp')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening WhatsApp: $e')),
        );
      }
    }
  }

  void _onBookNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Book Now clicked!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF0B2545);
    final accentPink = const Color(0xFFFF2E63);
    final whatsappGreen = const Color(0xFF25D366);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ParwaazAppBar(
        onMenuItemSelected: (title) {
          setState(() {
            _selectedTab = title;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: $title')),
          );
        },
        onBookNowPressed: _onBookNow,
        onWhatsAppPressed: _launchWhatsApp,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parwaaz',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'DRIVING INSTITUTE',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            ...['Home', 'About', 'Courses', 'Gallery', 'Reviews', 'Contact'].map(
                  (item) => ListTile(
                title: Text(
                  item,
                  style: GoogleFonts.montserrat(
                    fontWeight: _selectedTab == item ? FontWeight.bold : FontWeight.w500,
                    color: _selectedTab == item ? accentPink : primaryColor,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedTab = item;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $item')),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _onBookNow();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentPink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _launchWhatsApp();
                      },
                      icon: const Icon(Icons.chat, color: Colors.white),
                      label: Text(
                        'WhatsApp Chat',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whatsappGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          '$_selectedTab Page',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
