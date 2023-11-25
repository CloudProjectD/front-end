import "package:flutter/material.dart";
import "package:kyunghee_market/view/messages_view.dart";
import "package:kyunghee_market/view/profile_view.dart";
import "package:kyunghee_market/view/writing_view.dart";

import "detail_view.dart";
import "main_view.dart";

//나중에 리팩토링 할 때 그냥 main view로 한꺼번에 합쳐야할 듯 -> main view(default : all, drawer 카테고리 클릭할 때 마다
// api call을 다르게 보내서 받아오든가 해야제
//중복되는 코드 너무 많음
//navigation bar 같이 중복되는 위젯은 빼야할 것 같다

class CategoryListView extends StatefulWidget { //변경될 수 있는 state를 가지고 있는 위젯
  final String category;
  CategoryListView({required this.category});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  //ui에서 변화할 부분

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){

              }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => WritingView(),
              ),
            );
          }, icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      drawer: AppDrawer(),
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainView(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(Icons.home),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesView(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(Icons.mail),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 5),
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  Widget buildBody(){
    switch (widget.category){
      case '거래':
        return TradeList(); //추후 인자값에 카테고리 추가해서 api 다르게 요청!!
      case '나눔':
        return ShareList();
      case '원룸':
        return OneRoomList();
      case '경매' :
        return AuctionList();
      default:
        return PostList();
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListView(category: '거래'),
                  )
              );
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
                  )
              );
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
                  )
              );
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
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("./assets/iphone.png"), // 물품 사진
            title: Text('아아폰 팝니다^^'), // 게시글 제목 - 이건 동일
            subtitle: Text('1,555,000원'), // 가격, 
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
    );
  }
}

class TradeList extends StatefulWidget {
  const TradeList({super.key});

  @override
  State<TradeList> createState() => _TradeListState();
}

class _TradeListState extends State<TradeList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("./assets/iphone.png"), // 물품 사진
            title: Text('아아폰 팝니다^^'), // 게시글 제목 - 이건 동일
            subtitle: Text('1,555,000원'), // 가격,
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
    );
  }
}

class AuctionList extends StatefulWidget {
  const AuctionList({super.key});

  @override
  State<AuctionList> createState() => _AuctionListState();
}

class _AuctionListState extends State<AuctionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("./assets/iphone.png"), // 물품 사진
            title: Text('아아폰 경매요^^'), // 게시글 제목 - 이건 동일
            subtitle: Text('1,555,000원부터'), // 가격,
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
    );
  }
}


class ShareList extends StatefulWidget {
  const ShareList({super.key});

  @override
  State<ShareList> createState() => _ShareListState();
}

class _ShareListState extends State<ShareList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("./assets/iphone.png"), // 물품 사진
            title: Text('부자됐슴.아이폰 나눔합니다'), // 게시글 제목 - 이건 동일
            subtitle: Text('무료'), // 가격,
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
    );
  }
}


class OneRoomList extends StatefulWidget {
  const OneRoomList({super.key});

  @override
  State<OneRoomList> createState() => _OneRoomListState();
}

class _OneRoomListState extends State<OneRoomList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("./assets/iphone.png"), // 물품 사진
            title: Text('서천동 원룸 양도합니다'), // 게시글 제목 - 이건 동일
            subtitle: Text('400/50'), // 가격,
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
    );
  }
}

