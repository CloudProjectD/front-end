import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyunghee_market/controller/message_controller.dart';

import '../../controller/message_controller333.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  MessageController messageController = Get.put(MessageController());
  MessageController333 messageController333 = Get.put(MessageController333());

  final _controller = TextEditingController();
  var _userEnterMessage = '';
  void _sendMessage(){
    print('Send button is clicked');
    FocusScope.of(context).unfocus();
    _controller.clear();
    print(messageController.currentFlow);
    if (messageController.currentFlow == 0) {
      messageController.setFlow(1);
    } else if (messageController.currentFlow == 1) {
      messageController.setFlow(2);
    }

    if (messageController333.currentFlow == 0) {
      messageController333.setFlow(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: '메세지 보내기',
                floatingLabelBehavior: FloatingLabelBehavior.never,

                filled: true,
                fillColor: Colors.grey[200],

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
              onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
              icon: Icon(Icons.send_rounded),
              color: Color.fromRGBO(157, 28, 32, 1)
          )
        ],
      ),
    );
  }
}
