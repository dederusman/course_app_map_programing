import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  final List<String> programmingGroups = [
    'Flutter Developers',
    'Dart Programming',
    'Web Development Group',
    'Data Science Enthusiasts',
    'Machine Learning Community',
    'Mobile App Developers',
    'Backend Developers',
    'Frontend Developers',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Groups'),
        backgroundColor: Colors.blueAccent, // Warna AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar ListView
        child: ListView.builder(
          itemCount: programmingGroups.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4, // Bayangan untuk efek kedalaman
              margin: EdgeInsets.symmetric(vertical: 8.0), // Jarak antar Card
              child: ListTile(
                leading: Icon(Icons.group, size: 40, color: Colors.blue), // Ikon grup
                title: Text(
                  programmingGroups[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Aksi ketika grup ditekan
                  showGroupDetail(context, programmingGroups[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void showGroupDetail(BuildContext context, String groupName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(groupName),
          content: Text('Detail tentang grup $groupName.'),
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