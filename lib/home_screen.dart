import 'package:course_app/paketcoursescreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final List<String> courseImages = [
    'assets/dataanalyst.jpg', // Gambar untuk Course 1
    'assets/gamedeveloper.jpg', // Gambar untuk Course 2
    'assets/cybersecurity.jpg', // Gambar untuk Course 3
    'assets/softwarearchitect.jpg', // Gambar untuk Course 4
  ];

  final List<String> courseOffers = [
    'Course 1 - \$100',
    'Course 2 - \$150',
    'Course 3 - \$200',
    'Course 4 - \$250',
  ];

  final List<String> activeUsers = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
  ];

  final List<String> userImages = [
    'assets/user1.jpg', // Gambar pengguna 1
    'assets/user2.jpg', // Gambar pengguna 2
    'assets/user3.jpg', // Gambar pengguna 3
    'assets/user4.jpg', // Gambar pengguna 4
    'assets/user5.jpg', // Gambar pengguna 5
  ];

  final List<String> quizQuestions = [
    'What is the primary programming language used for Android development?',
    'Which language is primarily used for web development?',
    'What does HTML stand for?',
    'Which programming language is known for its use in data science?',
    'What is the main purpose of CSS?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Menambahkan latar belakang
      body: Column(
        children: [
          // Menambahkan jarak di atas judul untuk kursus
          SizedBox(height: 25.0), // Jarak tambahan di atas judul
          // Judul untuk kursus
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Mengurangi jarak vertikal
            alignment: Alignment.centerLeft,
            child: Text(
              'Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Grid View untuk penawaran kursus
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Mengurangi padding vertikal
            child: GridView.builder(
              shrinkWrap: true, // Mengatur agar grid tidak mengambil ruang lebih
              physics: NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                childAspectRatio: 1.5, // Rasio aspek untuk item
                crossAxisSpacing: 10.0, // Jarak antar kolom
                mainAxisSpacing: 10.0, // Jarak antar baris
              ),
              itemCount: courseImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke PaketCourseScreen ketika gambar diklik
                    if (index == 0) { // Hanya untuk Course 1
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaketCourseScreen()),
                      );
                    }
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(courseImages[index]), // Menggunakan gambar dari assets
                                fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk menutupi area
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          courseOffers[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          // Judul untuk dosen
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Mengurangi jarak vertikal
            alignment: Alignment.centerLeft,
            child: Text(
              'Dosen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // List View untuk pengguna aktif
          Container(
            height: 80, // Tinggi untuk list pengguna aktif
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Mengatur agar scroll horizontal
              itemCount: activeUsers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25, // Radius untuk avatar
                        backgroundImage: AssetImage(userImages[index]), // Menggunakan gambar dari assets
                      ),
                      SizedBox(height: 4.0),
                      Text(activeUsers[index]), // Nama pengguna
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          // Judul untuk kuis
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Quiz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Konten tambahan di bawah
          Expanded(
            child: ListView.builder(
              itemCount: quizQuestions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        quizQuestions[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}