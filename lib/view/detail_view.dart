import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatefulWidget {
  final int postIndex;
  const DetailView({Key? key, required this.postIndex}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool isLiked = false;
  //나중에 좋아요 눌렀었는지 체크하는 로직 추가 필요
  List<String> images = [
    "./assets/iphone.png",
    "./assets/iphone_detail.png",
  ];

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
                  height: 380,
                  width: 500,
                  color: Colors.grey,
                  child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
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
                      ),),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                    },
                    child: Image.asset(
                      './assets/siren.png',
                      width: 24,
                      height: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              setState(() {
                isLiked=!isLiked;
              });
            }, icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
            )),
            SizedBox(width: 50),
            Text(
              '1,555,000원',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
