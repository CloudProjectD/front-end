import 'package:flutter/material.dart';
import 'package:kyunghee_market/view/messageroom_view333.dart';

import 'messageroom_view22.dart';

class MessagesView333 extends StatefulWidget {
  const MessagesView333({super.key});

  @override
  State<MessagesView333> createState() => _MessagesView333State();
}

class _MessagesView333State extends State<MessagesView333> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:  ListView.builder(
        reverse: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0)
                // ),
                child: ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MessageRoomView333(),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile1.png'),
                        radius: 17,
                      ),
                      SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '컴공미남',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            '컴퓨터공학과',
                            style: TextStyle(
                                fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), // 게시글 제목
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('미개봉 상품인가요?'),
                  ),
                  trailing: Container(
                    height: 70.0,
                    width: 70.0,
                    child: Image.asset("assets/iphone.png",
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )
                  // onTap: () {
                  //   Navigator.push(context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DetailView(postIndex: index),
                  //     ),
                  //   );
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0)
                // ),
                child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MessageRoomView22(),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile1.png'),
                          radius: 17,
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '컴공미남',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              '컴퓨터공학과',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), // 게시글 제목
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('관리자: \n경매가 마감되었습니다. 입찰자와 연결됩니다.'),
                    ),
                    trailing: Container(
                      height: 70.0,
                      width: 70.0,
                      child: Image.asset("assets/product1.png",
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                  // onTap: () {
                  //   Navigator.push(context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DetailView(postIndex: index),
                  //     ),
                  //   );
                  // },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
