import 'package:flutter/material.dart';
import 'doctor_schedule_page.dart';

class TopDoctorSection extends StatelessWidget {
  const TopDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        "name": "Dr. Andika",
        "speciality": "Nutritionist",
        "hospital": "Dhaka Hospital",
        "rating": "4.7",
        "image": "assets/images/doctor1.png",
      },
      {
        "name": "Dr. Sherin",
        "speciality": "Psychologist",
        "hospital": "United Hospital",
        "rating": "3.5",
        "image": "assets/images/doctor_2.png",
      },
      {
        "name": "Dr. Jhon",
        "speciality": "Cardiologist",
        "hospital": "City Medical",
        "rating": "4.9",
        "image": "assets/images/doctor3.png",
      },
      {
        "name": "Dr. Maria",
        "speciality": "Dentist",
        "hospital": "Smile Clinic",
        "rating": "4.6",
        "image": "assets/images/doctor4.png",
      },
      {
        "name": "Dr. Sophia",
        "speciality": "Neurologist",
        "hospital": "NeuroCare",
        "rating": "4.8",
        "image": "assets/images/doctor5.png",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Top Doctor",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("View All", style: TextStyle(color: Color(0xFF4D90FE))),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Horizontal List
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final d = doctors[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman jadwal dokter
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoctorSchedulePage(
                        name: d["name"]!,
                        speciality: d["speciality"]!,
                        hospital: d["hospital"]!,
                        image: d["image"]!,
                      ),
                    ),
                  );
                },
                child: _buildDoctorCard(
                  name: d["name"]!,
                  speciality: d["speciality"]!,
                  hospital: d["hospital"]!,
                  rating: d["rating"]!,
                  image: d["image"]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard({
    required String name,
    required String speciality,
    required String hospital,
    required String rating,
    required String image,
  }) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 385, 
            margin: const EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120,
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(speciality,
                      style:
                          const TextStyle(color: Color(0xFF4D90FE), fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(hospital,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 39, 38, 38), fontSize: 12)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color.fromARGB(255, 0, 140, 255), size: 12),
                          const SizedBox(width: 4),
                          Text(rating,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.call,
                            color: Colors.white, size: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Gambar dokter
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 200,
                width: 140,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


