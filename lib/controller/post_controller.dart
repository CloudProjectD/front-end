import 'package:get/get.dart';
import 'package:kyunghee_market/model/post.dart';

class PostController extends GetxController{
  RxList<Post> posts = <Post>[
    Post(
        title: "아이폰 15 pro 팝니다",
        content: "빨리 가져가세요 ",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone_detail.png","./assets/iphone_detail2.png","./assets/iphone_detail3.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "귤 공짜로 가져가세요",
        content: "올해 귤 농사가 잘되어서 나눠드려요!!",
        category: '나눔',
        image: ["./assets/gyul1.png","./assets/gyul2.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "한정판 춘식이인형 빨리 가져가세요",
        content: "한정판입니다. 10000원부터 시작합니다",
        price: 10000,
        category: '경매',
        image: ["./assets/chunsik1.png","./assets/chunsik2.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19',
        deadline: DateTime(2023, 12, 21, 23, 59),
    ),
    Post(
        title: "원룸 양도합니다",
        content: "지금 살고있는 원룸을 양도하고자 글을 올립니다. 보증금 1000에 월세 + 관리비 해서 30입니다. 많이들 연락주세요",
        price: 50,
        deposit: 1000,
        category: '원룸',
        image: ["./assets/oneroom1.png","./assets/oneroom2.png","./assets/oneroom3.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "자격증책 팝니다^^",
        content: "싸게팔아요",
        price: 40000,
        category: '거래',
        image: ["./assets/book.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "토익책 팔아요",
        content: "싸게팔아요",
        price: 20000,
        category: '거래',
        image: ["./assets/toeic.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "치킨 기프티콘 팔아요",
        content: "기프티콘 팝니당",
        price: 18000,
        category: '거래',
        image: ["./assets/gift.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "맥북 경매요",
        content: "싸게팔아요",
        price: 1555000,
        category: '경매',
        image: ["./assets/mac.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19',
        deadline: DateTime(2023, 12, 21, 23, 59),
    ),
  ].obs;

  RxList<Post> likedPosts = <Post> [
    Post(
        title: "아이폰 15 pro 팝니다",
        content: "빨리 가져가세요 ",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone_detail.png","./assets/iphone_detail2.png","./assets/iphone_detail3.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
        title: "원룸 양도합니다",
        content: "지금 살고있는 원룸을 양도하고자 글을 올립니다. 보증금 1000에 월세 + 관리비 해서 30입니다. 많이들 연락주세요",
        price: 50,
        deposit: 1000,
        category: '원룸',
        image: ["./assets/oneroom1.png","./assets/oneroom2.png","./assets/oneroom3.png"],
        creator: "알로하오예",
        createdAt: '2023/12/19'
    ),
    Post(
      title: "맥북 경매요",
      content: "싸게팔아요",
      price: 1555000,
      category: '경매',
      image: ["./assets/mac.png"],
      creator: "알로하오예",
      createdAt: '2023/12/19',
      deadline: DateTime(2023, 12, 21, 23, 59),
    ),
  ].obs;

  void addPost(Post post){
    posts.add(post);
    update();
  }

  void deletePost(Post post){
    posts.remove(post);
    update();
  }

  void modifyPost(Post post){
    int index = posts.indexWhere((element) => element.title == post.title);
    if (index != -1) {
      posts[index] = post;
    }
    update();
  }

}
