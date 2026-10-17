import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 900;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 80 : 24,
            vertical: 60,
          ),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Text Section
                    Expanded(
                      flex: 1,
                      child: _buildTextContent(),
                    ),
                    const SizedBox(width: 60),
                    // Right Image Section
                    Expanded(
                      flex: 1,
                      child: _buildImageSection(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextContent(),
                    const SizedBox(height: 40),
                    _buildImageSection(),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Empowering Women\nThrough Driving',
          style: GoogleFonts.playfairDisplay(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0B2545),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'At Parwaaz Driving Institute, we believe that every woman deserves the freedom to drive. Our mission is to provide safe, comfortable and professional driving lessons exclusively for females in Vehari.',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: const Color(0xFF4A5568),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'We are committed to building confident drivers by focusing on practical training, personalized attention and a supportive learning environment.',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: const Color(0xFF4A5568),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main Image Container with rounded corners
        Container(
          height: 380,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/about_car.png', // User can add their image here
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Sisterhood Floating Badge at Bottom Right
        Positioned(
          bottom: -20,
          right: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEEF3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFFF2E63).withValues(alpha: 0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'More than just driving school..\nIt\'s a sisterhood! ',
                  style: GoogleFonts.caveat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0B2545),
                    height: 1.1,
                  ),
                ),
                const Text(
                  '❤️',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
