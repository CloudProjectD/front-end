import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';
import '../model/post.dart';
import 'detail_view.dart';

class MyPostView extends StatefulWidget {
  const MyPostView({super.key});

  @override
  State<MyPostView> createState() => _MyPostViewState();
}

class _MyPostViewState extends State<MyPostView> {
  // List<Post> posts = [
  //   Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
  //
  // ];
  PostController postController = Get.find<PostController>();
  bool isAssetImage(String imagePath){
    return imagePath.startsWith('./assets');
  }
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
          '내 게시글',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: ListView.builder(
        itemCount: postController.posts.length, // 게시글 수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(postController.posts[index].image.first), // 물품 사진
              title: Text(postController.posts[index].title), // 게시글 제목
              subtitle: Text('${postController.posts[index].price}원'), // 가격
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(post: postController.posts[index]),
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
