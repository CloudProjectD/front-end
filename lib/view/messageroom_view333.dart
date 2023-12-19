import 'package:flutter/material.dart';
import '../message/article.dart';
import '../message/message333.dart';
import '../message/new_message.dart';

class MessageRoomView333 extends StatefulWidget {
  const MessageRoomView333({super.key});

  @override
  State<MessageRoomView333> createState() => _MessageRoomView333State();
}

class _MessageRoomView333State extends State<MessageRoomView333> {
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
                '컴공미남',
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
                  Expanded(child: Messages333()),
                  NewMessage(),
                ],
              ),
            ),
            Positioned(child: Article()),
          ]),
        ));
  }
}
