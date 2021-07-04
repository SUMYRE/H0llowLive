import 'package:flutter/material.dart';
import 'package:sumyre/Widgets/widgets.dart';

class LandingPage extends StatelessWidget {

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 35, size.height*0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoginButtonWidget(hasBorder: false, title: 'Login', purpose: "pushLogin"),
                  SizedBox(height:30),
                  LoginButtonWidget(hasBorder: true, title: "Signup", purpose: "pushSignup",)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height*0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HOllowLive",
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}