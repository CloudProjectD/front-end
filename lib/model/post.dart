import 'dart:ui';

class Post{
  final String title;
  final String content;
  final String category;
  final String creator;
  final List<String> image; //나중에 string으로 수정
  final int? price;
  final int? deposit;
  final bool? auction;
  final DateTime? deadline;

  const Post({
    required this.title,
    required this.content,
    required this.category,
    required this.creator,
    required this.image,
    this.price,
    this.deposit,
    this.auction,
    this.deadline,
});

  /*
    추후 json 형태로 바꾸는 것 추가
   */
}