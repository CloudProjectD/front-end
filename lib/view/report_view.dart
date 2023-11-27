import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final _reportController = TextEditingController();
  var _reportText = '';

  void _sendReport() {
    _reportController.clear();
    showToast('신고가 접수되었습니다');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black87,
          ),
        ),
        title: Text(
          '신고하기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: TextFormField(
                  maxLines: 9,
                  controller: _reportController,
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: '신고 내용을 입력해주세요.',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color.fromRGBO(157, 28, 32, 1),
                          ),
                          borderRadius: BorderRadius.circular(15))),
                  onChanged: (value) {
                    setState(() {
                      _reportText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed:
                          _reportText.trim().isEmpty ? null : _sendReport,
                      child: Text('신고 접수하기', style: TextStyle(fontSize: 20.0)),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(157, 28, 32, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          minimumSize: const Size.fromHeight(53))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    textColor: Colors.black87,

    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}