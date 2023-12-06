import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyunghee_market/controller/bottom_controller.dart';
import 'package:kyunghee_market/view/main_view.dart';
import 'package:kyunghee_market/view/messages_view.dart';
import 'package:kyunghee_market/view/profile_view.dart';
import 'package:kyunghee_market/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> tabPages = [
    MainView(),
    MessagesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    //페이지 전환을 위한 BottomController 인스턴스화(의존성 주입)
    //Get put : 수명이 페이지와 같음
    Get.put(BottomController());

    return Scaffold(
      body: Obx(() =>
          SafeArea(child: tabPages[BottomController.to.currentIndex.value])),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
