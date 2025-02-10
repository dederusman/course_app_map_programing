import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String username;

  ChatDetailScreen({required this.username});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<String> messages = []; // Daftar pesan
  final TextEditingController messageController = TextEditingController();

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text); // Menambahkan pesan ke daftar
      });
      messageController.clear(); // Mengosongkan input setelah mengirim
    }
  }

  void _editMessage(int index) {
    messageController.text = messages[index]; // Set initial value
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Message'),
          content: TextField(
            controller: messageController,
            decoration: InputDecoration(labelText: 'Message'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  messages[index] = messageController.text; // Update pesan
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

  void _deleteMessage(int index) {
    setState(() {
      messages.removeAt(index); // Menghapus pesan dari daftar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.username}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Tampilkan dialog untuk edit atau delete
                    _showEditDeleteDialog(index);
                  },
                  child: Container(
                    alignment: Alignment.centerRight, // Pesan di sebelah kanan
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(labelText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage, // Kirim pesan
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an action'),
          actions: [
            TextButton(
              onPressed: () {
                _editMessage(index); // Edit pesan
                Navigator.of(context).pop();
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                _deleteMessage(index); // Hapus pesan
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Batal
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}