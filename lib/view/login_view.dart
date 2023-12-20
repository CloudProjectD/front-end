import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int _state = 1;

  void signInWithGoogle1(BuildContext context) async {
    _state = 2;
    showPopup(context);
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    await GoogleSignIn().signOut();

    // if (googleUser != null) {
    //   print('name = ${googleUser.displayName}');
    //   print('email = ${googleUser.email}');
    //   print('id = ${googleUser.id}');
    //   Navigator.pushNamed(context, '/nickname');
    // }
  }
  void signInWithGoogle2(BuildContext context) async {
    _state = 1;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    await GoogleSignIn().signOut();
    Navigator.pushNamed(context, '/nickname');

    // if (googleUser != null) {
    //   print('name = ${googleUser.displayName}');
    //   print('email = ${googleUser.email}');
    //   print('id = ${googleUser.id}');
    //   Navigator.pushNamed(context, '/nickname');
    // }
  }

//   void signInWithGoogle(BuildContext context) async {
// // 클라이언트 ID와 리다이렉트 URL을 기입합니다.
//     final String googleClientId = "256219349395-a20l0mk123afi1ffabdnelt37iamo5v9.apps.googleusercontent.com";
//     final String callbackUrlScheme =
//         'http://localhost:8080/login/oauth2/code/google';
//
//     try {
//       final authUrl = Uri.https(
//         'accounts.google.com',
//         '/o/oauth2/v2/auth',
//         {
//           'response_type': 'code',
//           'client_id': googleClientId,
//           'redirect_uri': '$callbackUrlScheme:/',
//           'scope': 'email',
//         },
//       );
//       debugPrint(authUrl.toString());
//
//       final result = await FlutterWebAuth2.authenticate(
//         url: authUrl.toString(),
//         callbackUrlScheme: callbackUrlScheme,
//       );
//       debugPrint("paso");
//       debugPrint(result);
//       final code = Uri.parse(result).queryParameters['code'];
//
//       final tokenUrl = Uri.https('oauth2.googleapis.com', '/token');
//
//       final response = await http.post(
//         tokenUrl,
//         body: {
//           'client_id': googleClientId,
//           'redirect_uri': '$callbackUrlScheme:/',
//           'grant_type': 'authorization_code',
//           'code': code,
//         },
//       );
//
//       final accessToken = jsonDecode(response.body)['access_token'] as String;
//       final idToken =
//       jsonDecode(response.body)['id_token'] as String;
//
//       debugPrint('Access Token: $accessToken');
//       debugPrint('ID Token: $idToken');
//
//
//     } catch (e) {
//       debugPrint('Error during Google login: $e');
//     }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Image.asset('assets/KYUNGHEEMARKET.jpg',
              width: 300,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 100.0,
            ),
            // Text('KHU\nMarket',
            //     style: GoogleFonts.archivoBlack(
            //       textStyle: TextStyle(
            //           fontSize: 60, color: Color.fromRGBO(157, 28, 32, 1)),
            //     ),
            //     textAlign: TextAlign.center),
            // SizedBox(
            //   height: 80.0,
            // ),
            ElevatedButton(
              onPressed: (){
                if (_state == 1) {
                  signInWithGoogle1(context);
                } else {
                  signInWithGoogle2(context);
                }
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

Future<void> showPopup(context) async{
  await Future.delayed(Duration(seconds: 5));
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '경희대학교 계정으로 로그인해주세요.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '확인',
                style: TextStyle(fontSize: 14.0),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
