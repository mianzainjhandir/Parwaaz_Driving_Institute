import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParwaazAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onMenuItemSelected;
  final VoidCallback? onBookNowPressed;
  final VoidCallback? onWhatsAppPressed;

  const ParwaazAppBar({
    super.key,
    this.onMenuItemSelected,
    this.onBookNowPressed,
    this.onWhatsAppPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF0B2545);
    final accentPink = const Color(0xFFFF2E63);
    final whatsappGreen = const Color(0xFF25D366);

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 900;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Section (Always visible on left)
              Row(
                children: [
                  Image.asset(
                    'assets/images/img_1.png',
                    height: 52,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Parwaaz',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'DRIVING INSTITUTE',
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Navigation Links (for wide screens / laptops ONLY)
              if (isWide)
                Row(
                  children: [
                    _navItem('Home', accentPink, true),
                    const SizedBox(width: 24),
                    _navItem('About', primaryColor, false),
                    const SizedBox(width: 24),
                    _navItem('Courses', primaryColor, false),
                    const SizedBox(width: 24),
                    _navItem('Gallery', primaryColor, false),
                    const SizedBox(width: 24),
                    _navItem('Reviews', primaryColor, false),
                    const SizedBox(width: 24),
                    _navItem('Contact', primaryColor, false),
                  ],
                ),

              // Right Actions: Book Now & WhatsApp (for wide screens) OR Mobile View Actions
              if (isWide)
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: onBookNowPressed ?? () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentPink,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: onWhatsAppPressed ?? () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: whatsappGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                )
              else
                // Mobile View: WhatsApp icon + Hamburger Menu (ONLY on mobile)
                Row(
                  children: [
                    InkWell(
                      onTap: onWhatsAppPressed ?? () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: whatsappGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: primaryColor, size: 30),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _navItem(String title, Color color, bool isSelected) {
    return InkWell(
      onTap: () {
        if (onMenuItemSelected != null) {
          onMenuItemSelected!(title);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: color,
          ),
        ),
      ),
    );
  }
}
