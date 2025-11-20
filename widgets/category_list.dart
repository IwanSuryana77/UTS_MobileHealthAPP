import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool _showAll = false;

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.favorite, 'name': 'Heart'},
    {'icon': Icons.psychology, 'name': 'Brain'},
    {'icon': Icons.medical_services, 'name': 'Tooth'},
    {'icon': Icons.remove_red_eye, 'name': 'Eye'},
    {'icon': Icons.masks, 'name': 'Lungs'},
    {'icon': Icons.restaurant, 'name': 'Nutrition'},
    {'icon': Icons.healing, 'name': 'Skin'},
    {'icon': Icons.fitness_center, 'name': 'Muscle'},
  ];

  @override
  Widget build(BuildContext context) {
    
    final displayList = _showAll ? categories : categories.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(
                  _showAll ? 'Show Less' : 'View All',
                  style: const TextStyle(
                    color: Color(0xFF4D90FE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Grid kategori dengan animasi transisi
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: displayList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final item = displayList[index];
              return _buildCategoryCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> item) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF2FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF4D90FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item['icon'],
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item['name'],
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
