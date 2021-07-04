import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {

  final String title;
  final bool hasBorder;
  String? email;
  String? password;
  String? purpose;

  LoginButtonWidget({
    required this.hasBorder,
    required this.title,
    this.email,
    this.password,
    this.purpose
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
          onTap: () async {
            switch(purpose) {
              case "pushSignup": {
                Navigator.pushReplacementNamed(context, '/signup');
              }
              break;
              
              case "pushLogin": {
                Navigator.pushReplacementNamed(context, '/login');
              }
              break;
            }

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
}