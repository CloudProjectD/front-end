import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/post_controller.dart';
import '../model/post.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  String transactionType = '거래';
  final ImagePicker picker = ImagePicker();
  List<XFile?> _pickedImgs = []; //갤러리에서 갸져올 이미지 리스트 변수
  List<XFile?> showImgs = [];
  DateTime? _selectedDate;

  //이미지 선택함수
  Future<void> _pickImg() async {
    final List<XFile?> images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
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
    return _titleFieldController.text.isNotEmpty &&
        _contentFieldController.text.isNotEmpty &&
        _priceFieldController.text.isNotEmpty;
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  // width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 5)
                            ]),
                        child: IconButton(
                            onPressed: () async {
                              _pickedImgs = await picker.pickMultiImage();
                              setState(() {
                                showImgs.addAll(_pickedImgs);
                              });
                            },
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                              color: Colors.grey,
                            )),
                      ),
                      // SizedBox(width: 10),
                      ...showImgs.map((img) {
                        return Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(right: 10), // 간격을 margin으로 추가
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(img!.path)),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.close, color: Colors.white, size: 15),
                                  onPressed: () {
                                    setState(() {
                                      showImgs.remove(img);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      // Container(
                      //   child: GridView.builder(
                      //       padding: EdgeInsets.all(0),
                      //       shrinkWrap: true,
                      //       itemCount: showImgs.length,
                      //       gridDelegate:
                      //           SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 5,
                      //             childAspectRatio: 1.5,
                      //             mainAxisSpacing: 10,
                      //             crossAxisSpacing: 10,
                      //       ),
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Stack(
                      //           // alignment: Alignment.topRight,
                      //           children: [
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(5),
                      //                   image: DecorationImage(
                      //                       fit: BoxFit.cover,
                      //                       //사진 크기를 Container 크기에 맞게 조절
                      //                       image: FileImage(File(showImgs[index]!
                      //                               .path // images 리스트 변수 안에 있는 사진들을 순서대로 표시함
                      //                           )))),
                      //             ),
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                   color: Colors.black,
                      //                   borderRadius: BorderRadius.circular(5),
                      //                 ),
                      //                 //삭제 버튼
                      //                 child: IconButton(
                      //                   padding: EdgeInsets.zero,
                      //                   constraints: BoxConstraints(),
                      //                   icon: Icon(Icons.close,
                      //                       color: Colors.white, size: 15),
                      //                   onPressed: () {
                      //                     //버튼을 누르면 해당 이미지가 삭제됨
                      //                     setState(() {
                      //                       showImgs.remove(showImgs[index]);
                      //                     });
                      //                   },
                      //                 ))
                      //           ],
                      //         );
                      //       }),
                      // )
                    ],
                  ),
                ),
              ),
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
                  setState(() {});
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
                onChanged: (text) {
                  setState(() {});
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
              if (transactionType == '거래')
                TextField(
                  controller: _priceFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '거래 가격',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                )
              else if (transactionType == '경매')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text('경매 마감일'),
                    Row(children: [
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        child: Text(
                          _selectedDate == null
                              ? '날짜 선택'
                              : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                        ),
                      ),
                    ]),
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
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ],
                )
              else if (transactionType == '원룸')
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
                      onChanged: (text) {
                        setState(() {});
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
    Post newPost = Post(
      title: _titleFieldController.text,
      content: _contentFieldController.text,
      category: transactionType,
      price: transactionType == '거래' ? int.parse(_priceFieldController.text) : null,
      creator: '컴공미남',
      image: [],
    );

    for (XFile? img in showImgs) {
      newPost.image.add(img?.path ?? '');
    }

    PostController postController = Get.find<PostController>();
    postController.addPost(newPost);

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
