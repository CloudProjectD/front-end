import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/universitySeal.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text('KHU\nMarket',
                style: GoogleFonts.archivoBlack(
                  textStyle: TextStyle(
                      fontSize: 60, color: Color.fromRGBO(157, 28, 32, 1)),
                ),
                textAlign: TextAlign.center),
            SizedBox(
              height: 80.0,
            ),
            ElevatedButton(
              onPressed: () {
                print('Google Login Button');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 15.0, 0),
                    child: Image(
                      image: AssetImage('assets/google.png'),
                      height: 35.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.black26,
                  ),
                  SizedBox(width: 40),
                  Text(
                    '구글 아이디로 로그인',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size(350, 60), // 높이만 50으로 설정
                shape: RoundedRectangleBorder(
                  // shape : 버튼의 모양을 디자인 하는 기능
                    side: BorderSide(color: Colors.black26, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 0.0, // 떠 있는 높이
              ),
            )
          ],
        ),
      ),
    );
  }
}
