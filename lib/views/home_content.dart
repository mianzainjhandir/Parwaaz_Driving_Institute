import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 800;

        return Container(
          width: double.infinity,
          height: isWide ? 550 : 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF071A2E).withValues(alpha: 0.88),
                  const Color(0xFF0B2545).withValues(alpha: 0.65),
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 64 : 24,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Badge Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF2E63),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Female Only Driving School',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Title: Parwaaz Driving Institute
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Parwaaz\n',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isWide ? 52 : 36,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFFFF2E63),
                          height: 1.1,
                        ),
                      ),
                      TextSpan(
                        text: 'Driving Institute',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isWide ? 46 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Drive with Confidence.\nDrive Your Future.',
                  style: GoogleFonts.montserrat(
                    fontSize: isWide ? 22 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Text(
                    'Professional and safe driving lessons for women in Vehari. Learn at your own pace with experienced female instructors.',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Action Buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Book Your Lesson clicked!')),
                        );
                      },
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: Text(
                        'Book Your Lesson',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF2E63),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Our Courses clicked!')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1.5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Our Courses',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
