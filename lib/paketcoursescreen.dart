import 'package:flutter/material.dart';

class PaketCourseScreen extends StatelessWidget {
  final String courseImage = 'assets/dataanalyst.jpg'; // Gambar kursus
  final String courseDescription = 'Learn the fundamentals of data analysis, data visualization, and data-driven decision making.';
  final String coursePrice = '\$100'; // Harga kursus

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Course'),
        backgroundColor: Colors.blueAccent, // Warna AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar kursus
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(courseImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            SizedBox(height: 16.0),
            // Penjelasan kursus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Description',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    courseDescription,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Price: $coursePrice',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  // Tombol pembayaran
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logika untuk pembayaran
                        // Misalnya, navigasi ke halaman pembayaran
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Warna tombol
                        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}