import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseItem {
  final String title;
  final String description;
  final String duration;
  final String fee;
  final String imagePath;
  final IconData badgeIcon;

  const CourseItem({
    required this.title,
    required this.description,
    required this.duration,
    required this.fee,
    required this.imagePath,
    required this.badgeIcon,
  });
}

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  static const List<CourseItem> _courses = [
    CourseItem(
      title: 'Beginner Driving',
      description: 'Learn the basics of driving with clear guidance and step-by-step training.',
      duration: '10–15 Hours',
      fee: 'PKR 12,000',
      imagePath: 'assets/images/course_beginner.png',
      badgeIcon: Icons.directions_car_rounded,
    ),
    CourseItem(
      title: 'Road Practice',
      description: 'Build confidence with real road experience and traffic rules.',
      duration: '10–20 Hours',
      fee: 'PKR 15,000',
      imagePath: 'assets/images/course_road.png',
      badgeIcon: Icons.alt_route_rounded,
    ),
    CourseItem(
      title: 'Parking Skills',
      description: 'Master parallel and reverse parking with ease.',
      duration: '5–10 Hours',
      fee: 'PKR 7,000',
      imagePath: 'assets/images/course_parking.png',
      badgeIcon: Icons.local_parking_rounded,
    ),
    CourseItem(
      title: 'Advanced Driving',
      description: 'Improve your skills and learn advanced road techniques.',
      duration: '15–25 Hours',
      fee: 'PKR 18,000',
      imagePath: 'assets/images/course_advanced.png',
      badgeIcon: Icons.star_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 800;

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
              // Course Cards Grid/List
              isWide ? _buildWideGrid(context) : _buildMobileList(context),
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

  Widget _buildWideGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildCourseCard(_courses[0], context)),
            const SizedBox(width: 24),
            Expanded(child: _buildCourseCard(_courses[1], context)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildCourseCard(_courses[2], context)),
            const SizedBox(width: 24),
            Expanded(child: _buildCourseCard(_courses[3], context)),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return Column(
      children: _courses.map((course) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: _buildCourseCard(course, context),
        );
      }).toList(),
    );
  }

  Widget _buildCourseCard(CourseItem course, BuildContext context) {
    final navyColor = const Color(0xFF0B2545);
    final pinkColor = const Color(0xFFFF2E63);
    final pinkBg = const Color(0xFFFFEEF3);
    final textColor = const Color(0xFF4A5568);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFFD1DC).withValues(alpha: 0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image with Overlapping Floating Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Top Image
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.asset(
                    course.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: pinkBg,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(course.badgeIcon, color: pinkColor, size: 36),
                            const SizedBox(height: 8),
                            Text(
                              course.imagePath,
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                                color: navyColor,
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
              // Floating Circular Badge at bottom-left of image
              Positioned(
                bottom: -22,
                left: 20,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: pinkColor.withValues(alpha: 0.2),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: pinkBg,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      course.badgeIcon,
                      color: pinkColor,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Body Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Course Title
                Text(
                  course.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: navyColor,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  course.description,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: textColor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                // Duration & Fee Row
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9FA),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFFE3EC),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Duration
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: pinkBg,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: pinkColor,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Duration',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    course.duration,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: navyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider
                      Container(
                        width: 1,
                        height: 32,
                        color: const Color(0xFFFFD1DC),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      // Fee
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: pinkBg,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: pinkColor,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fee',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    course.fee,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: navyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Enroll Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enrolling in ${course.title}...'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'Enroll Now',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
