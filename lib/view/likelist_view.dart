import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyunghee_market/controller/post_controller.dart';

import '../model/post.dart';
import 'detail_view.dart';

class LikeListView extends StatefulWidget {
  const LikeListView({super.key});

  @override
  State<LikeListView> createState() => _LikeListViewState();
}

class _LikeListViewState extends State<LikeListView> {
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
          '좋아요한 글',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: ListView.builder(
        itemCount: postController.likedPosts.length, // 게시글 수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(17),
              leading: Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(postController.likedPosts[index].image.first)), // 물품 사진
              title: Text(postController.likedPosts[index].title), // 게시글 제목
              subtitle: buildPrice(postController.likedPosts[index]), // 가격
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(post: postController.likedPosts[index]),
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
