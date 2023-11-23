import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = TextEditingController();
  var _userEnterMessage = '';
  void _sendMessage(){
    print('Send button is clicked');
    FocusScope.of(context).unfocus();
    _controller.clear();
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
              color: Colors.grey
          )
        ],
      ),
    );
  }
}
