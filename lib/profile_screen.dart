import 'package:course_app/group_screen.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Pastikan untuk mengimpor halaman ChatScreen
import 'login_screen.dart'; // Pastikan untuk mengimpor halaman LoginScreen

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Dede Rusman';
  String email = 'dederusman@gmail.com';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _showEditProfileDialog() {
    nameController.text = username; // Set initial value
    emailController.text = email; // Set initial value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  username = nameController.text;
                  email = emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: _showEditProfileDialog,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        email,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://storage.googleapis.com/a1aa/image/PLnsV9xVYdyTjkuxbU0b9iJT4mHI40G0xOyZze4IbdE.jpg',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                    onTap: () {
                      // Aksi ketika opsi Setting ditekan
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('Group'),
                    onTap: () {
                      // Navigasi ke halaman Group
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GroupScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Friend'),
                    onTap: () {
                      // Navigasi ke halaman ChatScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {
                      showAboutDialog(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Exit'),
                    onTap: () {
                      // Navigasi ke halaman Login
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false, // Menghapus semua halaman di stack
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About'),
          content: Text('Aplikasi ini dibuat oleh Dede Rusman untuk menyelesaikan tugas pemrograman mobile dan sebagai aplikasi kursus programming.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}