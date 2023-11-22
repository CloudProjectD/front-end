import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '스타벅스 기프티콘',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('스타벅스 기프티콘 팔아여')
            ],
          ),
          Image.asset('assets/product1.png')
        ],
      ),
    );
  }
}
