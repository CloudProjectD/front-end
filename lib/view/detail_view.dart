import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyunghee_market/controller/post_controller.dart';
import 'package:kyunghee_market/view/messageroom_view.dart';
import 'package:kyunghee_market/view/writing_view.dart';

import '../model/post.dart';
import 'edit_view.dart';

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
  bool isAssetImage(String imagePath) {
    return imagePath.startsWith('./assets');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      return isAssetImage(widget.post.image.first) ?
                      Image.asset(widget.post.image[index], fit: BoxFit.cover,)
                          : Image.file(File(widget.post.image[index]));
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
              padding: const EdgeInsets.fromLTRB(15, 15, 25, 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: getProfileImageByNickname(widget.post),
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.creator,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/report");
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
            const Divider(
              height: 1,
              thickness: 0.2,
              indent: 5,
              endIndent: 5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 14, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.post.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'modify') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditView(post: widget.post),
                              ),
                            );
                          } else if (value == 'delete') {
                            _showDeleteConfirmationDialog(context);
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'modify',
                            child: ListTile(
                              // leading: Icon(Icons.share),
                              title: Text('수정'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: ListTile(
                              // leading: Icon(Icons.report),
                              title: Text('삭제'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Text(
                      widget.post.content,
                      style: TextStyle(fontSize: 16),
                    ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  )),
            ),
            VerticalDivider(
              thickness: 0.2,
              width: 0.05,
              color: Colors.grey,
              indent: 5,
              endIndent: 5,
            ),
            // SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildPriceInfo(widget.post),
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _getWidget(widget.post),
                )
            )
            // _getWidgetForCategory(widget.post),
            // Container(
            //   width: 110,
            //   height: 40,
            //   child: Row(
            //     children: [
            //       _buildSizedBox(widget.post),
            //       if (widget.post.category == '경매')
            //         ElevatedButton(
            //           onPressed: () {
            //             _showAuctionDialog(context);
            //           },
            //           child: Row(
            //             children: [
            //               Image.asset('./assets/auction.png',
            //                   color: Colors.white),
            //               SizedBox(width: 3),
            //               Text('입찰'),
            //             ],
            //           ),
            //           style: ElevatedButton.styleFrom(
            //               primary: Color.fromRGBO(157, 28, 32, 1),
            //               onPrimary: Colors.white,
            //               textStyle: TextStyle(fontSize: 15),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(16),
            //               )),
            //         ),
            //     ],
            //   ),
            // ),
            //SizedBox(width: 5),
            // Container(
            //   width: 100,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     color: Color.fromRGBO(157, 28, 32, 1),
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         icon: Icon(
            //           Icons.send,
            //           color: Colors.white,
            //         ),
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => MessageRoomView()));
            //         },
            //       ),
            //       SizedBox(width: 3),
            //       Text(
            //         '쪽지',
            //         style: TextStyle(fontSize: 15, color: Colors.white),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _getWidget(Post post) {
    if (widget.post.category == '경매') {
      return Row(
        children: [
          Container(
            width: 80,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                _showAuctionDialog(context);
              },
              child: Row(
                children: [
                  Image.asset('./assets/auction.png',
                      color: Colors.white,
                    width: 18,
                  ),
                  SizedBox(width: 3),
                  Text('입찰'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(157, 28, 32, 1),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
          ),
          SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessageRoomView()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(157, 28, 32, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send,
                      color: Colors.white,
                    size: 14,
                    ),

                  SizedBox(width: 3),
                  Text(
                    '쪽지',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 10),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(157, 28, 32, 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessageRoomView()));
              },
            ),
            SizedBox(width: 3),
            Text(
              '쪽지',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  ImageProvider getProfileImageByNickname(Post post) {
    if (post.creator == '알로하오예') {
      return AssetImage('assets/profile1.png');
    } else {
      return AssetImage(
          'assets/user.png');
    }
  }

  /**
   * 삭제 확인 창
   */
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '정말 삭제할까요?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('삭제하면 복구할 수 없어요!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '취소',
                style: TextStyle(
                    color: Color.fromRGBO(157, 28, 32, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                _deletePost(); // Close the confirmation dialog
              },
              child: Text(
                '삭제',
                style: TextStyle(
                    color: Color.fromRGBO(157, 28, 32, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deletePost(){
    Get.find<PostController>().deletePost(widget.post);
    Navigator.pushNamed(context, '/app');
  }

  Widget _buildPriceInfo(Post post) {
    if (post.category == '원룸') {
      return Text('보증금 ${post.deposit}/${post.price}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
    } else if (post.category == '나눔') {
      return Text('무료',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
    } else if (post.category == '경매') {
      return Text('${post.price}원부터',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
    } else {
      return Text('${post.price}원',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
    }
  }

  Widget _getWidgetForCategory(Post post) {
    if (widget.post.category == '경매') {
      return SizedBox(width: 0.0);
    } else if (widget.post.category == '원룸') {
      return SizedBox(width: 5.0);
    } else {
      return SizedBox(width: 45.0);
    }
  }

  Widget _buildSizedBox(Post post) {
    if (widget.post.category == '경매') {
      return SizedBox(width: 5);
    } else {
      return SizedBox(width: 10);
    }
  }

  /**
   * 입찰하기 dialog 창
   */
  void _showAuctionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Column(
              children: [
                Image.asset('./assets/auction.png'),
                SizedBox(height: 7),
                Text(
                  '원하는 가격에 get it!',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                SizedBox(height: 50,)
              ],
            ),
            content: Container(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  // 경매 시작가격 표시
                  Text('경매 시작가격'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      border: null,
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.post.price}원',
                        style: TextStyle(
                            fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('현재 입찰가'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      border: null,
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '2000000원',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('구매희망가'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      border: null,
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: TextField(
                        // controller: bidPriceController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          border: InputBorder.none,
                          hintText: '구매 희망가를 입력하세요',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(157, 28, 32, 1),
                      onPrimary: Colors.white)),
              ElevatedButton(
                  onPressed: () {
                    // TODO: 입찰 처리 로직 추가
                    // String bidPrice = bidPriceController.text;
                    // print('입찰가: $bidPrice');
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: '입찰이 완료되었습니다.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  },
                  child: Text(
                    '입찰하기',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(157, 28, 32, 1),
                      onPrimary: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
