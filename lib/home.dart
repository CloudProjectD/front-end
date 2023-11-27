import 'package:flutter/material.dart';
import 'package:kyunghee_market/view/main_view.dart';
import 'package:kyunghee_market/view/messages_view.dart';
import 'package:kyunghee_market/view/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_index = 0;

  final List<Widget> _navIndex = [
    MainView(),
    MessagesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navIndex.elementAt(current_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(164, 28, 32, 50),
        unselectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

