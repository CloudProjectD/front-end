import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
      title : const Text('KHU Market',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.grey),
    ),
    drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
    DrawerHeader(
    child: Image.asset('./assets/healthicons_market-stall-negative.png'),
    decoration: BoxDecoration(
    color: Colors.white,
    ),
    ),
    ListTile(
    leading: Icon(Icons.handshake),
    title: Text('거래'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(Icons.money),
    title: Text('경매'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(Icons.groups),
    title: Text('나눔'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(Icons.house),
    title: Text('원룸'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ],
    ),
    ),
    body: ListView.builder(
    itemCount: 5, // 게시글 수
    itemBuilder: (context, index) {
    return ListTile(
    title: Text('게시글 제목 $index'),
    subtitle: Text('가격: \$${10 + index}'),
    onTap: () {
    // 게시글을 클릭했을 때 상세 페이지로 이동
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PostDetailPage(postIndex: index),
    ),
    );
    },
    bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.mail),
    label: 'Messages',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
    ),
    ],
    ),
    ),
    );
    }
  }

  class Boxwidget extends StatelessWidget {
  const Boxwidget({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
  padding: EdgeInsets.all(8.0),
  child: Row(
  children: [
  Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
  image: DecorationImage(
  image: AssetImage('./assets/iphone.png'),
  fit: BoxFit.cover, // 이미지를 커버로 설정
  ),
  ),
  ),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  // 게시글 제목
  Text(
  '게시글 제목',
  style: TextStyle(
  fontSize: 16, // 제목 텍스트 크기
  fontWeight: FontWeight.bold, // 제목 텍스트 두께
  ),
  ),
  Text(
  '1600000원', // 가격 정보
  style: TextStyle(
  fontSize: 12, // 가격 텍스트 크기
  color: Colors.grey, // 회색으로 텍스트 색상 설정
  ),
  ),
  ],
  ),
  ],
  ),
  decoration: BoxDecoration(
  border: Border(
  bottom: BorderSide(
  color: Colors.grey, // 회색 선의 색상
  width: 1.0, // 선의 두께
  ),
  ),
  ),
  width: 100,
  height: 100,
  margin: EdgeInsets.all(8.0),
  );
  }
  }

  class DetailPage extends StatelessWidget {
  final int postIndex;

  const DetailPage({Key? key, required this.postIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('게시글 상세 정보'),
  ),
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Image(image: AssetImage('./assets/iphone.png')),
  Text('게시글 제목: 게시글 제목 $postIndex'),
  Text('가격: \$${10 + postIndex}'),
  // 여기에 추가적인 상세 정보 표시 가능
  ],
  ),
  ),
  );
  }
  }


