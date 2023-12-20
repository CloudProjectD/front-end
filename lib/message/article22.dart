import 'package:flutter/material.dart';
import 'package:kyunghee_market/model/post.dart';
import 'package:kyunghee_market/view/detail_view.dart';

class Article22 extends StatelessWidget {

  Post post =
  Post(title: '한정판 춘식이인형 빨리 가져가세요', content: "한정판입니다. 10000원부터 시작합니다", price: 10000, category: '경매', image: ["./assets/chunsik1.png"], creator: "알로하오예", id: 2, createdAt: '2023/12/19', deadline: DateTime(2023, 12, 21, 23, 59),);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
            builder: (context) => DetailView(post: post)));
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 3,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 240.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '한정판 춘식이인형 빨리 가져가세요',
                    maxLines: 1,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('한정판입니다. 10000원부터 시작합니다', maxLines: 1,)
                ],
              ),
            ),
            SizedBox(
              width: 70,
                height: 70,
                child: Image.asset('assets/chunsik1.png'))
          ],
        ),
      ),
    );
  }
}
