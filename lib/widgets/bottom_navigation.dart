import 'package:get/get.dart';
import 'package:kyunghee_market/controller/bottom_controller.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends GetView<BottomController> {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        //현재 index 저장
        onTap: controller.changeIndex,
        //item 탭할 시 실행
        type: BottomNavigationBarType.fixed,
        //탭 애니메이션 변경x
        selectedItemColor: Color.fromRGBO(164, 28, 32, 50),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: controller.currentIndex.value == 0
                ? Icon(Icons.home)
                : Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: controller.currentIndex.value == 1
                ? Icon(Icons.mail)
                : Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: controller.currentIndex.value == 2
                ? Icon(Icons.person)
                : Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
