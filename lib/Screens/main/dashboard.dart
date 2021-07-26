import 'package:flutter/material.dart';
import '../../Widgets/widgets.dart';

class MainDash extends StatefulWidget {
  MainDashState createState() => MainDashState();
}

class MainDashState extends State<MainDash> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginButtonWidget(title: "signOut", hasBorder: true, purpose: "signOut")
          ],
        )
      ),
    );
  }
}