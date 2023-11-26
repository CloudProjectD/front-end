import 'package:flutter/material.dart';
import 'package:kyunghee_market/view/login_view.dart';
import 'package:kyunghee_market/view/authentication_view.dart';
import 'package:kyunghee_market/view/main_view.dart';
import 'package:kyunghee_market/view/messageroom_view.dart';
import 'package:kyunghee_market/view/messages_view.dart';
import 'package:kyunghee_market/view/nickname_view.dart';
import 'package:kyunghee_market/view/profile_view.dart';
import 'package:kyunghee_market/view/report_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KHU Market',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/authentication': (context) => AuthenticationView(),
        '/nickname': (context) => NicknameView(),
        '/profile': (context) => ProfileView(),
        '/main': (context) => MainView(),
        '/messages': (context) => MessagesView(),
        '/messageroom': (context) => MessageRoomView(),
        '/report': (context) => ReportView()
      },
    );
  }
}


