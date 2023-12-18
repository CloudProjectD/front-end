import 'package:get/get.dart';
import 'package:kyunghee_market/model/post.dart';

class PostController extends GetxController{
  RxList<Post> posts = <Post>[
    Post(
        title: "아이폰 15 pro 팝니다",
        content: "빨리 가져가세요 ",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 공짜로 가져가세요",
        content: "꽁으로 가져가라",
        category: '나눔',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "한정판 춘식이인형 빨리 가져가세요",
        content: "한정판입니다. 10000원부터 시작합니다",
        price: 1555000,
        category: '경매',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰집 팝니다^^",
        content: "싸게팔아요",
        price: 50,
        deposit: 1000,
        category: '원룸',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
    Post(
        title: "아이폰 팝니다^^",
        content: "싸게팔아요",
        price: 1555000,
        category: '거래',
        image: ["./assets/iphone.png"],
        creator: "알로하오예"),
  ].obs;

  void addPost(Post post){
    posts.add(post);
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
