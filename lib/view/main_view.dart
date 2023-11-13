import 'package:flutter/material.dart';
import 'detail_view.dart';
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}
class _MainViewState extends State<MainView> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'KHU Market',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
            onPressed: (){

            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.add)),
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Image.asset(
                    './assets/healthicons_market-stall-negative.png'),
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
