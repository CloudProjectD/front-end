import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
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
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15.0),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/messageroom');
              },
              contentPadding: EdgeInsets.all(20.0),
              title: Row(
                children: [
                  Image.asset("assets/profile1.png",
                    height: 35.0,
                    width: 35.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '알로하오예',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        '스포츠의학과',
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
                child: Text('감사합니다!!'),
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
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/main');
              },
              child: Column(
                children: [
                  Icon(Icons.home),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/messages');
              },
              child: Column(
                children: [
                  Icon(Icons.mail),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Column(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
