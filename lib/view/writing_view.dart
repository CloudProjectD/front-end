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
  final ImagePicker picker = ImagePicker();
  List<XFile?> _pickedImgs = [];
  DateTime? _selectedDate;

  Future<void> _pickImg() async {
    final List<XFile?> images = await picker.pickMultiImage();
    if(images!=null){
      setState((){
        _pickedImgs = images;
      });
    }
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  //버튼 활성화
  TextEditingController _titleFieldController = TextEditingController();
  TextEditingController _contentFieldController = TextEditingController();
  TextEditingController _priceFieldController = TextEditingController();
  bool isButtonEnabled() {
    return _titleFieldController.text.isNotEmpty && _contentFieldController.text.isNotEmpty
            && _priceFieldController.text.isNotEmpty;
  }

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
              /*
              Row(
                  GestureDetector(
                      onTap: () => _getImage(index),
                      Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                      )
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               */
              SizedBox(height: 16),
              Text('제목'),
              TextField(
                controller: _titleFieldController,
                decoration: InputDecoration(
                  labelText: '제목',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 16),
              Text('설명'),
              TextField(
                controller: _contentFieldController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: '설명',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onChanged: (text){
                  setState(() {
                  });
                },
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
                  controller: _priceFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '거래 가격',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (text){
                    setState(() {
                    });
                  },
                )
              else if(transactionType == '경매')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text('경매 마감일'),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          ),
                          child: Text(
                            _selectedDate == null
                                ? '날짜 선택'
                                : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                          ),
                        ),
                      ]
                    ),
                    SizedBox(height: 16),
                    Text('경매 시작가'),
                    TextField(
                      controller: _priceFieldController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: '경매 시작가',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onChanged: (text){
                        setState(() {
                        });
                      },
                    ),
                  ],
                )
              else if(transactionType=='원룸')
                  Column(
                    //보증금 controller 추가해야할것
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
                        controller: _priceFieldController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '월세',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (text){
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: isButtonEnabled() ? () => _onSubmit() : null,
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

  /*
  Future<void> _getImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _images[index] = XFile(pickedImage.path); // XFile을 File로 변환
      });
    }

  }
   */

  void _onSubmit() {
    /**
     * TODO
     */
    Navigator.pushNamed(context, '/app');
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _contentFieldController.dispose();
    _priceFieldController.dispose();
    super.dispose();
  }
}
