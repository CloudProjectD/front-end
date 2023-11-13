import 'package:flutter/material.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  String transactionType = '거래';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              // 이미지 추가 박스
              GestureDetector(
                onTap: () {
                  // 이미지 추가 기능 구현
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10), // 여백을 직접 지정
                  child: Container(
                    height: 100,
                    width: 20,
                    color: Colors.grey,
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('제목'),
              TextField(
                decoration: InputDecoration(
                  labelText: '제목',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // 게시글 내용 입력
              Text('설명'),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: '설명',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // 거래방식 선택 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        transactionType = '거래';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: transactionType == '거래'
                          ? Color.fromRGBO(157, 28, 32, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text('거래'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        transactionType = '나눔';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: transactionType == '나눔'
                          ? Color.fromRGBO(157, 28, 32, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text('나눔'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        transactionType = '경매';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: transactionType == '경매'
                          ? Color.fromRGBO(157, 28, 32, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text('경매'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        transactionType = '원룸';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: transactionType == '원룸'
                          ? Color.fromRGBO(157, 28, 32, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text('원룸'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // 거래 가격 입력
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '거래 가격',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 50),
              // 게시글 작성 완료 버튼
              ElevatedButton(
                onPressed: () {
                  // 게시글 작성 완료 시 수행할 동작 추가
                },
                child: Text('완료', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // 원하는 둥근 정도를 설정
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
