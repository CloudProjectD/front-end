import 'package:flutter/material.dart';

import '../message/article22.dart';
import '../message/message22.dart';
import '../message/new_message.dart';


class MessageRoomView22 extends StatefulWidget {
  const MessageRoomView22({super.key});

  @override
  State<MessageRoomView22> createState() => _MessageRoomView22State();
}

class _MessageRoomView22State extends State<MessageRoomView22> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile1.png'),
                ),
              ),
              Text(
                '알로하오예',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/report');
                  },
                  child: Image.asset(
                    './assets/siren.png',
                    width: 24,
                    height: 24,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(children: [
            Positioned(
              child: Column(
                children: [
                  Expanded(child: Messages22()),
                  NewMessage(),
                ],
              ),
            ),
            Positioned(child: Article22()),
          ]),
        ));
  }
}
