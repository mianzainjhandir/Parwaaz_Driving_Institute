import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 900;
        bool isCardWide = constraints.maxWidth > 750;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 80 : 24,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isWide
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
              const SizedBox(height: 60),
              _buildMissionVisionValuesCard(isCardWide),
              const SizedBox(height: 60),
              _buildWhyChooseUsSection(isWide),
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

  Widget _buildMissionVisionValuesCard(bool isWide) {
    final pinkBg = const Color(0xFFFFF0F5);
    final borderPink = const Color(0xFFFFD1DC);
    final iconCircleBg = const Color(0xFFFFE3EC);
    final iconColor = const Color(0xFFFF2E63);
    final titleColor = const Color(0xFF0B2545);
    final textColor = const Color(0xFF4A5568);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        color: pinkBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderPink, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildCardItem(
                    icon: Icons.verified_user_rounded,
                    title: 'Our Mission',
                    content: Text(
                      'To empower women\nwith driving skills and\nconfidence.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: textColor,
                        height: 1.5,
                      ),
                    ),
                    iconCircleBg: iconCircleBg,
                    iconColor: iconColor,
                    titleColor: titleColor,
                  ),
                ),
                _buildVerticalDivider(borderPink),
                Expanded(
                  child: _buildCardItem(
                    icon: Icons.settings_outlined,
                    title: 'Our Vision',
                    content: Text(
                      'To create a safer, more\nindependent community\nof female drivers.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: textColor,
                        height: 1.5,
                      ),
                    ),
                    iconCircleBg: iconCircleBg,
                    iconColor: iconColor,
                    titleColor: titleColor,
                  ),
                ),
                _buildVerticalDivider(borderPink),
                Expanded(
                  child: _buildCardItem(
                    icon: Icons.verified_user_rounded,
                    title: 'Our Values',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Safety   |   Respect',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Support   |   Progress',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    iconCircleBg: iconCircleBg,
                    iconColor: iconColor,
                    titleColor: titleColor,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                _buildCardItem(
                  icon: Icons.verified_user_rounded,
                  title: 'Our Mission',
                  content: Text(
                    'To empower women with driving skills and confidence.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: textColor,
                      height: 1.5,
                    ),
                  ),
                  iconCircleBg: iconCircleBg,
                  iconColor: iconColor,
                  titleColor: titleColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(color: borderPink, height: 1),
                ),
                _buildCardItem(
                  icon: Icons.settings_outlined,
                  title: 'Our Vision',
                  content: Text(
                    'To create a safer, more independent community of female drivers.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: textColor,
                      height: 1.5,
                    ),
                  ),
                  iconCircleBg: iconCircleBg,
                  iconColor: iconColor,
                  titleColor: titleColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(color: borderPink, height: 1),
                ),
                _buildCardItem(
                  icon: Icons.verified_user_rounded,
                  title: 'Our Values',
                  content: Text(
                    'Safety   |   Respect\nSupport   |   Progress',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      height: 1.5,
                    ),
                  ),
                  iconCircleBg: iconCircleBg,
                  iconColor: iconColor,
                  titleColor: titleColor,
                ),
              ],
            ),
    );
  }

  Widget _buildCardItem({
    required IconData icon,
    required String title,
    required Widget content,
    required Color iconCircleBg,
    required Color iconColor,
    required Color titleColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: iconCircleBg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: iconColor.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildVerticalDivider(Color borderColor) {
    return Container(
      width: 1,
      height: 110,
      color: borderColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildWhyChooseUsSection(bool isWide) {
    const navyColor = Color(0xFF0B2545);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Content: Title + 2 Columns of Bullets
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Why Choose Us?',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: navyColor,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Column 1
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildBulletPoint('Female-only driving school'),
                                const SizedBox(height: 20),
                                _buildBulletPoint('Flexible timings'),
                                const SizedBox(height: 20),
                                _buildBulletPoint('Practical & real road training'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Column 2
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildBulletPoint('Home pickup & mobile service'),
                                const SizedBox(height: 20),
                                _buildBulletPoint('Friendly & patient instructors'),
                                const SizedBox(height: 20),
                                _buildBulletPoint('Affordable and transparent fees'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                // Right Image Section
                Expanded(
                  flex: 4,
                  child: _buildWhyChooseUsImage(),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why Choose Us?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: navyColor,
                  ),
                ),
                const SizedBox(height: 24),
                _buildBulletPoint('Female-only driving school'),
                const SizedBox(height: 16),
                _buildBulletPoint('Home pickup & mobile service'),
                const SizedBox(height: 16),
                _buildBulletPoint('Flexible timings'),
                const SizedBox(height: 16),
                _buildBulletPoint('Friendly & patient instructors'),
                const SizedBox(height: 16),
                _buildBulletPoint('Practical & real road training'),
                const SizedBox(height: 16),
                _buildBulletPoint('Affordable and transparent fees'),
                const SizedBox(height: 36),
                Center(child: _buildWhyChooseUsImage()),
              ],
            ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Color(0xFFFF2E63),
          size: 22,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0B2545),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWhyChooseUsImage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Pink background halo
        Container(
          width: 320,
          height: 240,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEEF3),
            borderRadius: BorderRadius.circular(120),
          ),
        ),
        // Main Image Frame
        Container(
          width: 310,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(110),
            child: Image.asset(
              'assets/images/why_choose_us.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFFFEEF3),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image_outlined,
                        color: Color(0xFFFF2E63),
                        size: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'assets/images/why_choose_us.png',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: const Color(0xFF0B2545),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        // Floating Heart Badge on Top Right
        Positioned(
          top: -10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.favorite_border_rounded,
              color: Color(0xFFFF2E63),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
