import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parwaz/widgets/parwaz_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parwaaz Driving Institute',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B2545)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedTab = 'Home';

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF0B2545);
    final accentPink = const Color(0xFFFF2E63);

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
        onBookNowPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Book Now clicked!')),
          );
        },
        onWhatsAppPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('WhatsApp chat opened!')),
          );
        },
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
