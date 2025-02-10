import 'package:flutter/material.dart';

class BackendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backend Course'),
      ),
      body: Column(
        children: [
          // Gambar di bagian atas
          Container(
            height: 200, // Tinggi gambar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backend.jpg'), // Gambar backend
                fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk menutupi area
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), // Membuat sudut melengkung
            ),
          ),
          SizedBox(height: 16.0), // Jarak antara gambar dan teks
          // Materi di bagian bawah
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar teks
            child: Text(
              'Materi tentang kursus Backend mencakup berbagai topik penting seperti pengembangan API, manajemen database, dan penggunaan framework backend. Kursus ini dirancang untuk memberikan pemahaman mendalam tentang cara membangun aplikasi backend yang efisien dan scalable.',
              style: TextStyle(fontSize: 16, height: 1.5), // Ukuran dan tinggi baris teks
              textAlign: TextAlign.justify, // Menyelaraskan teks
            ),
          ),
        ],
      ),
    );
  }
}