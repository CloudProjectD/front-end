import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.0,),
                    Image.asset('assets/universitySeal.png',
                      width: 70,
                    ),
                    Text(
                      '인증',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('경희대학교 학생 이메일로 인증해주세요!',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                        )),
                    SizedBox(height: 50.0,),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              label: Text('이메일'),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              contentPadding:
                              EdgeInsets.fromLTRB(20, 20, 20, 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              showToast("이메일이 전송되었습니다");
                            },
                            child: Text('전송', style: TextStyle(fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: numController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              label: Text('인증번호'),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              contentPadding:
                              EdgeInsets.fromLTRB(20, 20, 20, 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('확인', style: TextStyle(fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 150.0,),
                    SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('다음', style: TextStyle(fontSize: 20.0)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        )
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