import 'package:flutter/material.dart';
import 'package:kyunghee_market/view/likelist_view.dart';
import 'package:kyunghee_market/view/mypost_view.dart';

import 'main_view.dart';
import 'messages_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isAssetImage(String imagePath) {
    return imagePath.startsWith('./assets');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 30.0,
                    child: Image.asset(
                      'assets/user.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '컴공미남',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              '컴퓨터공학과',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            )
                          ])),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPostView()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Color.fromRGBO(157, 28, 32, 1),
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '내 게시글',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/goguma.png',
                    height: 70.0,
                    width: 70.0,
                    //color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/iphone.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/iphone.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: Colors.black12,
                      height: 70.0,
                      width: 70.0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/writing');
                          },
                          icon: Icon(Icons.add_sharp))),
                )
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikeListView()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(157, 28, 32, 1),
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '좋아요',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/iphone_detail.png",
                    height: 70.0,
                    width: 70.0,
                    // color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/oneroom1.png',
                    height: 70.0,
                    width: 70.0,
                    // color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/mac.png',
                    height: 70.0,
                    width: 70.0,
                    // color: Colors.black12,
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.black12,
                      height: 70.0,
                      width: 70.0,
                      child: IconButton(
                          icon: Icon(Icons.add_sharp),
                          onPressed: () {
                            Navigator.push(context,  MaterialPageRoute(
                              builder: (context) => LikeListView(),
                            ),);
                      }),
                    )),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
