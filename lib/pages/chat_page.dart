// ignore_for_file: must_be_immutable

import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Chat')
                    ],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleFriend(message: messagesList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          message.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            'id': email,
                          });
                          controller.clear();
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        decoration: InputDecoration(
                            hintText: 'Send message',
                            suffixIcon: const Icon(Icons.send),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    )
                  ],
                ));
          } else {
            return const Scaffold(
              body: Center(
                child: Text(
                  'loading..',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            );
          }
        });
  }
}
