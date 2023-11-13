import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NicknameView extends StatefulWidget {
  const NicknameView({super.key});

  @override
  State<NicknameView> createState() => _NicknameViewState();
}

class _NicknameViewState extends State<NicknameView> {
  TextEditingController nicknameController = TextEditingController();

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
                    SizedBox(
                      height: 150.0,
                    ),
                    Text(
                      '반가워요!',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('닉네임을 설정해주세요',
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
                            controller: nicknameController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              label: Text('닉네임'),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          '중복된 닉네임입니다',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 15),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('확인', style: TextStyle(fontSize: 15.0),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(157, 28, 32, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child:
                                Text('중복확인', style: TextStyle(fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print('완료');
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Text('완료', style: TextStyle(fontSize: 20.0)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
