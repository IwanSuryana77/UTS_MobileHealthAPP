import 'package:flutter/material.dart';
import '../widgets/specialist_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/top_doctor_card.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.04; 
    final verticalSpacing = screenHeight * 0.025; 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: screenHeight * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(
                userName: 'AI Fitriani',
                address: 'Bandung',
              ),
              SizedBox(height: verticalSpacing),
              // Banner spesialis
              const SpecialistBanner(),
              SizedBox(height: verticalSpacing),
              // Kategori
              const CategoryList(),
              SizedBox(height: verticalSpacing),
              // Dokter populer
              const TopDoctorSection(),
              SizedBox(height: verticalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}



