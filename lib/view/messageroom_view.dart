import 'package:flutter/material.dart';

import '../message/article.dart';
import '../message/message.dart';
import '../message/new_message.dart';

class MessageRoomView extends StatefulWidget {
  const MessageRoomView({super.key});

  @override
  State<MessageRoomView> createState() => _MessageRoomViewState();
}

class _MessageRoomViewState extends State<MessageRoomView> {
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
            IconButton(
              icon: Icon(
                Icons.notifications_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                print('Report button is clicked');
                Navigator.pushNamed(context, '/report');
              },
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
                  Expanded(child: Messages()),
                  NewMessage(),
                ],
              ),
            ),
            Positioned(child: Article()),
          ]),
        ));
  }
}
