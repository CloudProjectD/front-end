import 'package:get/get.dart';

class MessageController333 extends GetxController {
  int currentFlow = 0;
  void setFlow(int flow) {
    currentFlow = flow;
    update();
  }
}