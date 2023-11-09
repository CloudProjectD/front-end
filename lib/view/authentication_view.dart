import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: AssetImage('assets/universitySeal.png'),
                width: 200,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이메일",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            onChanged: (value) {
                              // signUpController.setAdmissionYear(value);
                            },
                            onSubmitted: (value) {
                              // signUpController.setAdmissionYear(value);
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              label: Text('이메일을 입력해주세요'),
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
                        Container(
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('전송', style: TextStyle(fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text("인증번호",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            onChanged: (value) {
                              // signUpController.setAdmissionYear(value);
                            },
                            onSubmitted: (value) {
                              // signUpController.setAdmissionYear(value);
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              label: Text('인증번호를 입력해주세요'),
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
                        Container(
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
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('다음', style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
