import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatefulWidget {
  final int postIndex;
  const DetailView({Key? key, required this.postIndex}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 380, // 물품 사진의 높이,
                  width: 500,
                  color: Colors.grey, // 임시로 회색 배경 사용
                  // 물품 사진 표시
                  child: Image.asset("./assets/iphone_detail.png",fit: BoxFit.cover), // 물품 사진 URL
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // 판매자 정보 표시
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20, // 프로필 사진 반지름
                    backgroundImage: NetworkImage(
                        'https://i.namu.wiki/i/phJJ4yav60AY8ao5brb4JDnoqP0ZFJk3zaqLnE9l760V5ubk2b67VUnQzz73oeVaJRm49I_Fr32QqU36RyddNw.webp'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('컴공미남',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),), // 판매자 닉네임 표시
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // 이미지 버튼이 눌렸을 때 수행할 동작 추가
                    },
                    child: Image.asset(
                      './assets/siren.png',
                      width: 24,
                      height: 24,
                      color: Colors.black, // 이미지 색상 설정 (선택 사항)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // 게시글 제목과 내용 표시
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '아이폰 15 pro 블랙 256GB',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '아이폰 15 pro 블랙 256GB 판매합니다. \n 경희대학교 내에서 직거래 가능합니다',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.favorite_border)),
            SizedBox(width: 50),
            Text(
              '1,555,000원',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 쪽지 버튼 추가
            Spacer(),
            Container(
              width: 118,
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(157, 28, 32, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white,),
                    onPressed: () {
                      // 쪽지 버튼이 눌렸을 때 수행할 동작 추가
                    },
                  ),
                  SizedBox(width: 10),
                  Text('쪽지',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
