import 'package:flutter/material.dart';

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
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Container(
              child: Image.asset('assets/profile1.png'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        title: Text(
            '알로하오예',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.black,
            ),
            onPressed: (){
              print('Message button is clicked');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: (){
              print('More button is clicked');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
               )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '스타벅스 기프티콘',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text('스타벅스 기프티콘 팔아여')
                  ],
                ),
                Image.asset('assets/product1.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
