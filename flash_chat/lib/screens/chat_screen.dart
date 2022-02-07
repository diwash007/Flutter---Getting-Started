import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const String path = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  late String message;

  // void getMessages() async {
  //   final QuerySnapshot<Map<String, dynamic>> messages =
  //       await FirebaseFirestore.instance.collection('messages').get();
  //   for (var msg in messages.docs) {
  //     print(msg.data());
  //   }
  // }

  // void messagesStream() async {
  //   await for (var snapshot
  //       in FirebaseFirestore.instance.collection('messages').snapshots()) {
  //     for (var msg in snapshot.docs) {
  //       print(msg.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                // messagesStream();
              }),
        ],
        title: Text('⚡️Chat${user!.email}'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(
              user: user,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (msgController.text.trim() != '') {
                        await FirebaseFirestore.instance
                            .collection('messages')
                            .add({
                          'sender': user!.email,
                          'text': msgController.text,
                        });
                      }
                      msgController.clear();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
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

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key, required this.user}) : super(key: key);
  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapshot.data!.docs;
        List<MessageBubble> messageBubbles = [];

        for (var msg in messages) {
          String msgText = msg['text'];
          String sender = msg['sender'];

          messageBubbles.add(
            MessageBubble(
              msgText: msgText,
              sender: sender,
              isMe: sender == user!.email ? true : false,
            ),
          );
        }

        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.msgText,
      required this.sender,
      required this.isMe})
      : super(key: key);

  final bool isMe;
  final String msgText;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
          Material(
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.blueGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: radius20,
              topLeft: isMe ? radius20 : radius0,
              bottomRight: radius20,
              topRight: isMe ? radius0 : radius20,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                msgText,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
