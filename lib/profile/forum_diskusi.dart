import 'package:flutter/material.dart';

class ForumDiskusi extends StatefulWidget {
  const ForumDiskusi({Key? key}) : super(key: key);

  @override
  State<ForumDiskusi> createState() => _ForumDiskusiState();
}

class _ForumDiskusiState extends State<ForumDiskusi> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  int _senderIndex = 0;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        String sender;
        String profile;

        if (_senderIndex == 0) {
          sender = 'User';
          profile = 'assets/images/petani1.jpeg';
        } else if (_senderIndex == 1) {
          sender = 'Admin';
          profile = 'assets/images/petani2.jpeg';
        } else {
          sender = 'Petani';
          profile = 'assets/images/petani3.jpeg';
        }

        messages.add({
          'message': _controller.text,
          'sender': sender,
          'profile': profile,
        });

        _senderIndex =
            (_senderIndex + 1) % 3; // Bergantian antara User, Admin, dan Petani
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.amber],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool isCurrentUser = messages[index]['sender'] == 'User';
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: isCurrentUser
                          ? null
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage(messages[index]['profile']!),
                            ),
                      trailing: isCurrentUser
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage(messages[index]['profile']!),
                            )
                          : null,
                      title: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isCurrentUser ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isCurrentUser ? 10.0 : 0),
                            topRight: Radius.circular(isCurrentUser ? 0 : 10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          messages[index]['message']!,
                          style: TextStyle(
                            color: isCurrentUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(messages[index]['sender']!),
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
                      controller: _controller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Masukkan Pesan...',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                    color: Theme.of(context).primaryColor,
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
