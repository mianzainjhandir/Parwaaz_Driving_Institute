import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryItem {
  final String imagePath;
  final String category;

  const GalleryItem({
    required this.imagePath,
    required this.category,
  });
}

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  String _selectedFilter = 'All';

  final List<String> _filters = const [
    'All',
    'Classes',
    'Cars',
    'Happy Students',
  ];

  final List<GalleryItem> _galleryItems = const [
    GalleryItem(imagePath: 'assets/images/gallery_1.png', category: 'Cars'),
    GalleryItem(imagePath: 'assets/images/gallery_2.png', category: 'Classes'),
    GalleryItem(imagePath: 'assets/images/gallery_3.png', category: 'Classes'),
    GalleryItem(imagePath: 'assets/images/gallery_4.png', category: 'Classes'),
    GalleryItem(
      imagePath: 'assets/images/gallery_5.png',
      category: 'Happy Students',
    ),
    GalleryItem(imagePath: 'assets/images/gallery_6.png', category: 'Cars'),
  ];

  List<GalleryItem> get _filteredItems {
    if (_selectedFilter == 'All') {
      return _galleryItems;
    }
    return _galleryItems
        .where((item) => item.category == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 900;
        bool isTablet =
            constraints.maxWidth > 600 && constraints.maxWidth <= 900;

        int crossAxisCount = isWide ? 3 : (isTablet ? 2 : 1);

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 80 : 24,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(isWide),
              const SizedBox(height: 32),
              // Filter Chips Row
              _buildFilterChips(),
              const SizedBox(height: 36),
              // Gallery Grid
              _buildGrid(crossAxisCount),
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
          'Moments from Our Driving Journey',
          style: GoogleFonts.playfairDisplay(
            fontSize: isWide ? 38 : 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0B2545),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'A glimpse of our happy learners, training sessions and real road experiences.',
          style: GoogleFonts.montserrat(
            fontSize: isWide ? 16 : 14,
            color: const Color(0xFF4A5568),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    final pinkColor = const Color(0xFFFF2E63);
    final navyColor = const Color(0xFF0B2545);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _filters.map((filter) {
        bool isSelected = _selectedFilter == filter;

        return InkWell(
          onTap: () {
            setState(() {
              _selectedFilter = filter;
            });
          },
          borderRadius: BorderRadius.circular(24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? pinkColor : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isSelected ? pinkColor : const Color(0xFFD0E1F9),
                width: 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: pinkColor.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              filter,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? Colors.white : navyColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGrid(int crossAxisCount) {
    final items = _filteredItems;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.35,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildImageCard(items[index]);
      },
    );
  }

  Widget _buildImageCard(GalleryItem item) {
    final navyColor = const Color(0xFF0B2545);
    final pinkColor = const Color(0xFFFF2E63);
    final pinkBg = const Color(0xFFFFEEF3);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          item.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: pinkBg,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: pinkColor,
                    size: 38,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.imagePath,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: navyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item.category,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: pinkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
