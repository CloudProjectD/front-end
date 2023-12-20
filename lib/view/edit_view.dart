import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/post_controller.dart';
import '../model/post.dart';
import 'detail_view.dart';

class EditView extends StatefulWidget {
  final Post post;
  const EditView({Key? key, required this.post}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String transactionType = '거래';
  final ImagePicker picker = ImagePicker();
  List<XFile?> _pickedImgs = []; //갤러리에서 갸져올 이미지 리스트 변수
  List<XFile?> showImgs = [];
  DateTime? _selectedDate;
  PostController postController = Get.find<PostController>();
  Post? existingPost;

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

  @override
  void initState(){
    super.initState();
    //기존 post 데이터를 가져와서 ui에 반영
    _titleFieldController.text = widget.post.title;
    _contentFieldController.text = widget.post.content;
    _priceFieldController.text = widget.post.price.toString();
    showImgs = widget.post.image.map((path) => XFile(path)).toList();
    print("Initialized _pickedImgs: $_pickedImgs");
    existingPost= postController.posts.firstWhere(
          (post) => post.id == widget.post.id,
      orElse: () => widget.post,
    );
    print(existingPost);
  }

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
                      // ..._pickedImgs.map((XFile? img){
                      //   return img != null ? _buildImageWidget(img) : SizedBox.shrink();
                      // }),
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

  void _onSubmit() {

    Post modifiedPost = Post(
      id: existingPost!.id,
      title: _titleFieldController.text,
      content: _contentFieldController.text,
      category: transactionType,
      price: transactionType == '거래' ? int.parse(_priceFieldController.text) : null,
      creator: '컴공미남',
      createdAt: '2023/12/20',
      image: [],
    );

    List<String> updateImages= showImgs.map((img) => img?.path ?? '').toList();
    modifiedPost.image.addAll(updateImages);
    postController.modifyPost(modifiedPost);
    // postController.deletePost(existingPost);
    // postController.addPost(modifiedPost);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailView(post: modifiedPost),
    //   ),
    // );
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


