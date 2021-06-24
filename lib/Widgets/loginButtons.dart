import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {

  final String title;
  final bool hasBorder;
  String? email;
  String? password;

  LoginButtonWidget({
    required this.hasBorder,
    required this.title,
    this.email,
    this.password
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Color(0xff171924) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder ? Border.all(
            color: Color(0xff171924),
            width: 1.0
          )
          : Border.fromBorderSide(BorderSide.none)
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){
            tester();
          },
          child: Container(
            height:60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Colors.white : Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 18
                )
              )
            )
          )
        ),
      )
    );
  }

  void tester() {
    print(email! + " " + password!);
  }
}