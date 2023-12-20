import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.isMe, {super.key});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              // color: isMe ? Color(0xFFE0A5A9) : Colors.white,
              // color: isMe ? Color(0xFFA40F16) : Colors.white,
              color: isMe ? Color(0xFFCC6157) : Color(0xFFF2F2F2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
                bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     spreadRadius: 0.5,
              //     blurRadius: 1,
              //     offset: Offset(0, 0.5),
              //   )
              // ]
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 100
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
