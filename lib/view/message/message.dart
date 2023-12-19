import 'package:flutter/material.dart';
import 'package:kyunghee_market/controller/message_controller.dart';
import 'package:kyunghee_market/view/message/message_bubble.dart';
import 'package:get/get.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  MessageController messageController = Get.put(MessageController());
  late int _currentFlow;

  @override
  void initState() {
    // TODO: implement initState
    _currentFlow = MessageController().currentFlow;
    super.initState();
    messageController.addListener(_onMessageControllerChange);
  }
  @override
  void dispose() {
    // 상태가 더 이상 필요하지 않을 때 리스너 제거
    messageController.removeListener(_onMessageControllerChange);
    super.dispose();
  }

  void _onMessageControllerChange() {
    // messageController의 변경을 감지하여 상태를 업데이트
    setState(() {
      // 상태를 변경하고, 변경에 따라 UI가 다시 그려지도록 함
    });
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          reverse: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            if (messageController.currentFlow == 0) {
              return Column(
                children: [
                ],
              );
            } else if (messageController.currentFlow == 1) {
              return Column (
                children: [
                  MessageBubble(
                      '안녕하세요, 거래 가능할까요?', true)
                ],
              );
            } else if (messageController.currentFlow == 2) {
              return Column (
                children: [
                  MessageBubble('안녕하세요, 거래 가능할까요?', true),
                  MessageBubble('미개봉 상품인가요?', true),
                ],
              );
            }
          });


  }
}
