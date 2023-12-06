import 'package:get/get.dart';

class BottomController extends GetxController {
  static BottomController get to => Get.find();

  final RxInt currentIndex = 0.obs; //현재 선택된 아이템 번호 저장
  //탭 변경시 currentIndex 값 변경
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}