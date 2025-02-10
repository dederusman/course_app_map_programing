import 'package:course_app/ChatDetailScreen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Latar belakang
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      body: ListView(
        children: [
          // Daftar chat
          ChatListItem(
            name: 'Andre',
            message: 'Hey, how are you?',
            time: '10:30 AM',
            isUnread: false, // Chat sudah dibaca
            imageUrl: 'assets/user1.jpg', // Gambar pengguna dari assets
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDetailScreen(username: 'Andre')),
              );
            },
          ),
          ChatListItem(
            name: 'Sule',
            message: 'Let\'s meet tomorrow!',
            time: '9:15 AM',
            isUnread: false, // Chat sudah dibaca
            imageUrl: 'assets/user2.jpg', // Gambar pengguna dari assets
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDetailScreen(username: 'Sule')),
              );
            },
          ),
          // Tambahkan item chat lainnya di sini...
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isUnread; // Menandai apakah chat belum dibaca
  final String imageUrl; // URL gambar pengguna
  final VoidCallback onTap; // Callback untuk aksi ketika item ditekan

  ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    this.isUnread = false, // Default ke false
    required this.imageUrl, // Menambahkan parameter untuk URL gambar
    required this.onTap, // Menambahkan parameter untuk aksi tekan
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl), // Menggunakan gambar dari assets
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isUnread ? Colors.blue : Colors.black, // Warna teks jika belum dibaca
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal, // Bold jika belum dibaca
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: onTap, // Menambahkan aksi ketika item chat ditekan
    );
  }
}