import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class NicknameView extends StatefulWidget {
  const NicknameView({super.key});

  @override
  State<NicknameView> createState() => _NicknameViewState();
}

class _NicknameViewState extends State<NicknameView> {
  TextEditingController nicknameController = TextEditingController();
  final List<String> departmentItems = [
    '컴퓨터공학과',
    '인공지능학과',
    '소프트웨어융합학과'
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
      Navigator.pushNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Text(
                    '반가워요!',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('닉네임과 학과를 설정해주세요',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return '닉네임을 입력해주세요!';
                                  }
                                },
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: '닉네임',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.8,
                                      color: Color.fromRGBO(157, 28, 32, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(15)
                                  )
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            ElevatedButton(
                              onPressed: () {
                                showPopup(context);
                              },
                              child:
                              Text('중복확인', style: TextStyle(fontSize: 16.0)),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(157, 28, 32, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  fixedSize: const Size.fromHeight(50)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.8,
                                    color: Color.fromRGBO(157, 28, 32, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              )
                            // Add more decoration..
                          ),
                          hint: const Text(
                            '학과',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: departmentItems
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return '학과를 선택해주세요!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            _tryValidation();
                          },
                          child: Text('시작하기', style: TextStyle(fontSize: 20.0)),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(157, 28, 32, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            minimumSize: const Size.fromHeight(53)
                          )),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

void showPopup(context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '중복된 닉네임입니다',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '확인',
                style: TextStyle(fontSize: 14.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(157, 28, 32, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
