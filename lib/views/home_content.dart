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
        bool isWide = constraints.maxWidth > 900;

        return Column(
          children: [
            // Hero Banner Section
            Container(
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
            ),

            // Features Highlights Bar with img_1, img_2, img_3
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: isWide ? 64 : 24,
              ),
              child: isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: _featureItem(
                            'assets/images/img_1.png',
                            'Female Only\nStudents',
                          ),
                        ),
                        _verticalDivider(),
                        Expanded(
                          child: _featureItem(
                            'assets/images/img_2.png',
                            'Safe & Supportive\nEnvironment',
                          ),
                        ),
                        _verticalDivider(),
                        Expanded(
                          child: _featureItem(
                            'assets/images/img_3.png',
                            'Experienced\nFemale Instructors',
                          ),
                        ),
                        _verticalDivider(),
                        Expanded(
                          child: _featureItem(
                            'assets/images/img_1.png',
                            'Home Pickup &\nMobile Service',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _featureItem(
                          'assets/images/img_1.png',
                          'Female Only Students',
                        ),
                        const SizedBox(height: 24),
                        _featureItem(
                          'assets/images/img_2.png',
                          'Safe & Supportive Environment',
                        ),
                        const SizedBox(height: 24),
                        _featureItem(
                          'assets/images/img_3.png',
                          'Experienced Female Instructors',
                        ),
                        const SizedBox(height: 24),
                        _featureItem(
                          'assets/images/img_1.png',
                          'Home Pickup & Mobile Service',
                        ),
                      ],
                    ),
            ),

            // Bottom Journey Banner matching user reference image
            Container(
              width: double.infinity,
              color: const Color(0xFFFFF5F7),
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 64 : 24,
                vertical: 40,
              ),
              child: isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your Journey to Independence\nStarts Here',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF0B2545),
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Get behind the wheel and gain the confidence to go wherever you want.',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: const Color(0xFF4A5568),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Text(
                                    'Learn  •  Drive  •  Fly',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 26,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF2E63),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.send_rounded,
                                    color: Color(0xFFFF2E63),
                                    size: 22,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/images/img_4.png',
                              height: 240,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your Journey to Independence Starts Here',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0B2545),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Get behind the wheel and gain the confidence to go wherever you want.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: const Color(0xFF4A5568),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Image.asset(
                          'assets/images/img_4.png',
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Learn  •  Drive  •  Fly',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF2E63),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.send_rounded,
                              color: Color(0xFFFF2E63),
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _featureItem(String imagePath, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEEF3),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFF2E63).withValues(alpha: 0.3), width: 2),
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0B2545),
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 60,
      width: 1,
      color: Colors.blueGrey.withValues(alpha: 0.2),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
