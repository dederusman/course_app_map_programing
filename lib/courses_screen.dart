import 'dart:async';
import 'package:course_app/BackendScreen.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<String> images = [
    'assets/backend.jpg', // Gambar 1
    'assets/dataanalyst.jpg', // Gambar 2
    'assets/devops.jpg', // Gambar 3
    'assets/frontend.jpg', // Gambar 4
    'assets/gamedeveloper.jpg', // Gambar 5
    'assets/productmanager.jpg', // Gambar 6
    'assets/softwarearchitect.jpg', // Gambar 7
    'assets/cybersecurity.jpg', // Gambar 8
    'assets/uiux.jpg', // Gambar 9
    'assets/iosdeveloper.jpg', // Gambar 10
  ];

  final List<String> courseNames = [
    'Backend',
    'Data Analyst',
    'Devops',
    'Frontend',
    'Game Developer',
    'Product Manager',
    'Software Architect',
    'Cyber Security',
    'Ui/Ux',
    'IOS Developer',
  ];

  int _currentIndex = 0;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Kembali ke awal setelah mencapai akhir
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Slideshow menggunakan PageView
          Container(
            height: 200, // Tinggi slideshow
            child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) { // Jika gambar yang diklik adalah gambar backend
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BackendScreen()),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]), // Menggunakan AssetImage
                        fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk menutupi area
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          // Daftar kursus menggunakan GridView
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                childAspectRatio: 0.75, // Rasio aspek untuk item
                crossAxisSpacing: 10.0, // Jarak antar kolom
                mainAxisSpacing: 10.0, // Jarak antar baris
              ),
              itemCount: courseNames.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max, // Memastikan kolom mengisi ruang maksimum
                    children: [
                      // Gambar kursus
                      Expanded( // Menggunakan Expanded agar gambar mengisi seluruh ruang
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) { // Jika gambar yang diklik adalah gambar backend
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BackendScreen()),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity, // Mengatur lebar agar sesuai dengan kotak
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(images[index]), // Menggunakan AssetImage
                                fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk menutupi area
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Nama kursus
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Menambahkan padding di sekitar teks
                        child: Text(
                          courseNames[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Menyelaraskan teks di tengah
                        ),
                      ),
                    ],
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