import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)
                )
            ),
            height: 65,
            child: Text(
              message.message,
              style: const TextStyle(
                  fontSize:15,
                  color: Colors.white),
            ),
          ),
        );
      }
  }

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({
    super.key,
    required this.message
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
            color: Color(0xFF006d84),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32)
            )
        ),
        height: 65,
        child: Text(
          message.message,
          style: const TextStyle(
              fontSize:15,
              color: Colors.white),
        ),
      ),
    );
  }
}