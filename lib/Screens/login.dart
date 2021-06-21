import 'package:cloud_firestore/cloud_firestore.dart' as firecloud;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child:Column(
          children: [
            Container(
              height: size.height*0.34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pictures/background1.png"),
                  fit: BoxFit.fill,
                )
              )
            ),
            SizedBox(height:20),
            
            Padding(
              padding: EdgeInsets.only(left:35),
              child: SizedBox(
                width: double.infinity,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Montserrat"
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("SUMYRe", speed: const Duration(milliseconds: 300))
                    ],
                  )
                )
              ),
            ),
            SizedBox(height:5),

            Padding(
              padding: EdgeInsets.only(left:35),
              child: Container(
                child: Text(
                "Weclome Back, Login",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              )
            )
          ],
        ),
      )
    );
  }
}