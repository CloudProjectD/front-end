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
  // This widget is the root of your application.
  // List<Post> posts = [
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 공짜로 가져가세요",
  //       content: "꽁으로 가져가라",
  //       category: '나눔',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 경매요^^",
  //       content: "경매",
  //       price: 1555000,
  //       category: '경매',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰집 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 50,
  //       deposit: 1000,
  //       category: '원룸',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  //   Post(
  //       title: "아이폰 팝니다^^",
  //       content: "싸게팔아요",
  //       price: 1555000,
  //       category: '거래',
  //       image: ["./assets/iphone.png"],
  //       creator: "컴공미남"),
  // ];
  final PostController postController = Get.put(PostController());
  bool isAssetImage(String imagePath){
    return imagePath.startsWith('./assets');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: postController.posts.length, // 게시글 수
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: isAssetImage(postController.posts[index].image.first)?
                    Image.asset(postController.posts[index].image.first)
                : Image.file(File(postController.posts[index].image.first)),
                title: Text(postController.posts[index].title), // 게시글 제목
                subtitle: buildPrice(postController.posts[index]), // 가격
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(post: postController.posts[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPrice(Post post) {
    if (post.category == '나눔') {
      return Text('무료');
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
            child:
                Image.asset('./assets/healthicons_market-stall-negative.png'),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.handshake),
            title: Text('거래'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListView(category: '거래'),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('경매'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListView(category: '경매'),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text('나눔'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListView(category: '나눔'),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text('원룸'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListView(category: '원룸'),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
