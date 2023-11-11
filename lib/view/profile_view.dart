import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 30.0,
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
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark_border,
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
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
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
                      child: Icon(Icons.add_sharp)),
                )
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
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
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
                    height: 70.0,
                    width: 70.0,
                    color: Colors.black12,
                  ),
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/product1.png',
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
                      child: Icon(Icons.add_sharp)),
                )
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
