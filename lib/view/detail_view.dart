import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyunghee_market/view/messageroom_view.dart';

import '../model/post.dart';

class DetailView extends StatefulWidget {
  final Post post;
  DetailView({Key? key, required this.post}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool isLiked = false;
  //나중에 좋아요 눌렀었는지 체크하는 로직 추가 필요
  // List<String> images = [
  //   "./assets/iphone.png",
  //   "./assets/iphone_detail.png",
  // ];

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
                    itemCount: widget.post.image.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.post.image[index],
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
                      Text(widget.post.creator,
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
                    widget.post.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.post.content,
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
            _buildPriceInfo(widget.post),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MessageRoomView()
                          )
                      );

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
  Widget _buildPriceInfo(Post post){
    if (post.category == '원룸') {
      return Text(' ${post.deposit}/${post.price}원', style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold));
    } else if (post.category == '나눔') {
      return Text('나눔', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold));
    } else if(post.category == '경매'){
      return Text('${post.price}원부터', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold));
    } else {
      return Text('${post.price}원', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold));
    }
  }
}
