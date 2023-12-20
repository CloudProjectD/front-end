import 'dart:ui';

import 'package:get/get.dart';

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
  final String createdAt;

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
    required this.createdAt
});

}