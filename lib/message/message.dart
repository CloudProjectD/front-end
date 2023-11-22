import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.fromLTRB(10.0, 0.0, 100.0, 0.0),
        padding: EdgeInsets.fromLTRB(100.0, 0.0, 10.0, 0.0),
        reverse: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              // color: Colors.white,
                color: Color(0xFFE0A5A9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  // bottomRight: Radius.circular(20.0),
                ),
                // border: Border.all(
                //   width: 0.2,
                //   color: Colors.black
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  )
                ]),
            height: 70,
            // alignment: Alignment.centerLeft,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              '안녕하세요',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        });
  }
}
