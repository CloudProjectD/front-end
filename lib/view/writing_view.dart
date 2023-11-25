import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  String transactionType = '거래';

  List<XFile?> _images = List.generate(10, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: List.generate(
                  _images.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => _getImage(index),
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(right: 8),
                        child: _images[index] == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              )
                            : Image.file(
                                File(_images[index]!.path),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
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
              if(transactionType == '거래')
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '거래 가격',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                )
              else if(transactionType == '경매')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text('경매 마감일'),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: '경매 마감일',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('경매 시작가'),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: '경매 시작가',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ],
                )
              else if(transactionType=='원룸')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text('보증금'),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '보증금',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('월세'),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '월세',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '완료',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _images[index] = XFile(pickedImage.path); // XFile을 File로 변환
      });
    }
  }
}
