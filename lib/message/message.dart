import 'package:flutter/material.dart';
import 'package:kyunghee_market/message/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              MessageBubble('안녕하세요!!\n안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요', true),
              MessageBubble('안녕하세요!!안녕하세요!!안녕하세요!!안녕하세요!!안녕하세요!!안녕하세요!!안녕하세요!!안녕하세요!!', false),
            ],
          );
        });
  }
}
