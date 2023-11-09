import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NicknameView extends StatefulWidget {
  const NicknameView({super.key});

  @override
  State<NicknameView> createState() => _NicknameViewState();
}

class _NicknameViewState extends State<NicknameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // SingleChileScrollView 위젯 내에서는 적용 안 되는 듯하다
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Text(
                    '닉네임',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('한글, 영문, 숫자 가능합니다',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                      )),
                  SizedBox(
                    height: 20,
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
                            label: Text('닉네임을 입력해주세요'),
                            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          child: Text('중복확인', style: TextStyle(fontSize: 20.0)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250.0,
                  ),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('완료', style: TextStyle(fontSize: 20.0)),
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
