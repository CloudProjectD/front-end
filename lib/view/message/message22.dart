import 'package:flutter/material.dart';
import 'package:kyunghee_market/controller/message_controller.dart';
import 'package:kyunghee_market/view/message/message_bubble.dart';
import 'package:get/get.dart';

class Messages22 extends StatefulWidget {
  const Messages22({super.key});

  @override
  State<Messages22> createState() => _Messages22State();
}

class _Messages22State extends State<Messages22> {

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          reverse: true,
          itemCount: 1,
          itemBuilder: (context, index) {
              return Column(
                children: [
                  MessageBubble('관리자: \n경매가 마감되었습니다. \n판매자와 연결됩니다.', false)
                ],
              );
          });


  }
}
