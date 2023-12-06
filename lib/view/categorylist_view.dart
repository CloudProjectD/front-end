import "package:flutter/material.dart";
import "package:kyunghee_market/view/messages_view.dart";
import "package:kyunghee_market/view/profile_view.dart";
import "package:kyunghee_market/view/writing_view.dart";

import "../model/post.dart";
import "detail_view.dart";
import "main_view.dart";

//나중에 리팩토링 할 때 그냥 main view로 한꺼번에 합쳐야할 듯 -> main view(default : all, drawer 카테고리 클릭할 때 마다
// api call을 다르게 보내서 받아오든가 해야제
//중복되는 코드 너무 많음
//navigation bar 같이 중복되는 위젯은 빼야할 것 같다

class CategoryListView extends StatefulWidget {
  //변경될 수 있는 state를 가지고 있는 위젯
  final String category;

  CategoryListView({required this.category});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  //더미데이터
  List<Post> posts = [
    Post(title: "아이폰 팝니다^^", content: "싸게팔아요", price: 1555000, category: '거래', image: ["./assets/iphone.png"], creator: "컴공미남"),
    Post(title: "아이폰 팝니다^^", content: "싸게나눔", category: '나늠', image: ["./assets/iphone.png"], creator: "컴공미남"),
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
  List<Post> getPostsByCategory() {
    return posts.where((post) => post.category == widget.category).toList();
  }

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
      body: buildBody(),
    );
  }

  Widget buildBody() {
    List<Post> filteredPosts = getPostsByCategory();
    switch (widget.category) {
      case '거래':
        return TradeList(posts: filteredPosts); //추후 인자값에 카테고리 추가해서 api 다르게 요청!!
      case '나눔':
        return ShareList(posts: filteredPosts);
      case '원룸':
        return OneRoomList(posts: filteredPosts);
      case '경매':
        return AuctionList(posts: filteredPosts);
      default:
        return PostList(posts : posts);
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

class PostList extends StatefulWidget {
  final List<Post> posts;
  const PostList({required this.posts, Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

/**
 * 전체
 */
class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(widget.posts[index].image.first), // 물품 사진
            title: Text(widget.posts[index].title), // 게시글 제목
            subtitle: Text('${widget.posts[index].price}원'), // 가격
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(post: widget.posts[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
/**
 * 거래
 */
class TradeList extends StatefulWidget {
  final List<Post> posts;

  const TradeList({required this.posts, Key? key}) : super(key: key);

  @override
  State<TradeList> createState() => _TradeListState();
}

class _TradeListState extends State<TradeList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(widget.posts[index].image.first), // 물품 사진
            title: Text(widget.posts[index].title), // 게시글 제목 - 이건 동일
            subtitle: Text('${widget.posts[index].price}원'), // 가격,
            onTap: () {

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DetailView(post: widget.posts[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
/**
 * 경매
 */
class AuctionList extends StatefulWidget {
  final List<Post> posts;
  const AuctionList({required this.posts, Key? key}) : super(key: key);

  @override
  State<AuctionList> createState() => _AuctionListState();
}

class _AuctionListState extends State<AuctionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(widget.posts[index].image.first), // 물품 사진
            title: Text(widget.posts[index].title),// 게시글 제목 - 이건 동일
            subtitle: Text('${widget.posts[index].price}원부터~'), // 가격,
            onTap: () {

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DetailView(post : widget.posts[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
/**
 * 나눔
 */
class ShareList extends StatefulWidget {
  final List<Post> posts;
  const ShareList({required this.posts, Key? key}) : super(key: key);

  @override
  State<ShareList> createState() => _ShareListState();
}

class _ShareListState extends State<ShareList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(widget.posts[index].image.first), // 물품 사진
            title: Text(widget.posts[index].title), // 게시글 제목 - 이건 동일
            subtitle: Text('무료'), // 가격,
            onTap: () {

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DetailView(post : widget.posts[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
/**
 * 원룸
 */
class OneRoomList extends StatefulWidget {
  final List<Post> posts;
  const OneRoomList({required this.posts, Key? key}) : super(key: key);

  @override
  State<OneRoomList> createState() => _OneRoomListState();
}

class _OneRoomListState extends State<OneRoomList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // 게시글 수
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(widget.posts[index].image.first), // 물품 사진
            title: Text(widget.posts[index].title),// 게시글 제목 - 이건 동일
            subtitle: Text('${widget.posts[index].price}/${widget.posts[index].deposit}'),  // 가격,
            onTap: () {

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DetailView(post :widget.posts[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
