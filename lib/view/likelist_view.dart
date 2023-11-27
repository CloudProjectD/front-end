import 'package:flutter/material.dart';

import '../model/post.dart';
import 'detail_view.dart';

class LikeListView extends StatefulWidget {
  const LikeListView({super.key});

  @override
  State<LikeListView> createState() => _LikeListViewState();
}

class _LikeListViewState extends State<LikeListView> {
  List<Post> posts = [
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게나눔", category: '니늠', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "경매", price: 1555000, category: '경매', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰집 팝니다^^", content: "싸게팔아요", price: 1555000, deposit: 10000000, category: '원룸', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),

  ];
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
        itemCount: posts.length, // 게시글 수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(posts[index].image.first), // 물품 사진
              title: Text(posts[index].title), // 게시글 제목
              subtitle: Text('${posts[index].price}원'), // 가격
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(post: posts[index]),
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
