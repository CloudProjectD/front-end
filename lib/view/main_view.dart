import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:kyunghee_market/controller/bottom_controller.dart';
import 'package:kyunghee_market/controller/post_controller.dart';
import 'package:kyunghee_market/view/categorylist_view.dart';
import 'package:kyunghee_market/view/messages_view.dart';
import 'package:kyunghee_market/view/profile_view.dart';
import 'package:kyunghee_market/view/writing_view.dart';
import 'package:kyunghee_market/widgets/bottom_navigation.dart';
import '../model/post.dart';
import 'detail_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PostController postController = Get.put(PostController());

  bool isAssetImage(String imagePath) {
    return imagePath.startsWith('./assets');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'KHU Market',
          style: TextStyle(
            color: Colors.black,

          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WritingView(),
                  ),
                );
              },
              icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      drawer: AppDrawer(),
      body: Obx(
        () => ListView.builder(
          // reverse: true,
          itemCount: postController.posts.length, // 게시글 수
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(17),
                  leading: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: isAssetImage(postController
                            .posts[postController.posts.length - 1 - index]
                            .image
                            .first)
                        ? Image.asset(
                            postController
                                .posts[postController.posts.length - 1 - index]
                                .image
                                .first,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(postController
                                .posts[postController.posts.length - 1 - index]
                                .image
                                .first),
                            fit: BoxFit.cover,
                          ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      postController
                          .posts[postController.posts.length - 1 - index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  // 게시글 제목
                  subtitle: buildPrice(postController
                      .posts[postController.posts.length - 1 - index]),
                  // 가격
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                            post: postController.posts[
                                postController.posts.length - 1 - index]),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ));
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('./assets/kyunhee_market_logo.jpg'),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.handshake),
              title: Text(
                '거래',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListView(category: '거래'),
                    ));
              },
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Image.asset('./assets/auction.png',
                  height: 25, width: 25, color: Colors.black54),
              title: Text(
                '경매',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListView(category: '경매'),
                    ));
              },
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.groups),
              title: Text(
                '나눔',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListView(category: '나눔'),
                    ));
              },
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.house),
              title: Text('원룸', style: TextStyle(
                fontSize: 18
              ),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListView(category: '원룸'),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
