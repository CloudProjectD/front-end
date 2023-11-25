import 'package:flutter/material.dart';

import 'detail_view.dart';

class LikeListView extends StatefulWidget {
  const LikeListView({super.key});

  @override
  State<LikeListView> createState() => _LikeListViewState();
}

class _LikeListViewState extends State<LikeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: const Text(
          '좋아요한 글',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: ListView.builder(
        itemCount: 10, // 게시글 수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset("./assets/iphone.png"), // 물품 사진
              title: Text('아아폰 팝니다^^'), // 게시글 제목
              subtitle: Text('1,555,000원'), // 가격
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(postIndex: index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
