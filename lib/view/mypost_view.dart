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
        itemCount: postController.mypostList.length, // 게시글 수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(postController.mypostList[index].image.first), // 물품 사진
              title: Text(postController.mypostList[index].title), // 게시글 제목
              subtitle: buildPrice(postController.mypostList[index]),// 가격
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(post: postController.mypostList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  Widget buildPrice(Post post) {
    if (post.category == '나눔') {
      return Text('무료');
    } else if (post.category == '원룸') {
      return Text('보증금 ${post.deposit} / ${post.price}');
    } else if (post.category == '경매') {
      return Text('${post.price}원부터~');
    } else {
      return Text('${post.price}원');
    }
  }
}
