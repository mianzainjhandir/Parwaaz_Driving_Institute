import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 900;

        return Container(
          color: const Color(0xFFFAFAFA),
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 80 : 24,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(isWide),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose the Right Course for You',
          style: GoogleFonts.playfairDisplay(
            fontSize: isWide ? 38 : 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0B2545),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'We offer flexible and customized driving lessons for women of all skill levels.\nWhether you\'re a complete beginner or want to improve your skills, we\'ve got you covered.',
          style: GoogleFonts.montserrat(
            fontSize: isWide ? 16 : 14,
            color: const Color(0xFF4A5568),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
