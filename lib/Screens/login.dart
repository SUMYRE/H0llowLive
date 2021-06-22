import 'package:cloud_firestore/cloud_firestore.dart' as firecloud;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  late String _errorCode, _errorField;
  
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
            //SizedBox(height:20),
            
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
                      TypewriterAnimatedText("HOllowLive", speed: const Duration(milliseconds: 300))
                    ],
                  )
                )
              ),
            ),
            SizedBox(height:5),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left:35),
                child: Container(
                  child: Text(
                  "Weclome Back, Login",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                )
              )
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(35, size.height*0.06, 35, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    color: Color(0xff171924),
                    blurRadius: 20,
                    offset: Offset(0,10)
                  )]
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    
                  )
                )
              )
            )
            /*Container(
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (email) {
                        if(email!.isEmpty){
                          return "please provide an email";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Example: example@gmail.com",
                        labelText: "EMAIL",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                        )
                      ),
                    )
                  ],
                )
              )
            )*/
          ],
        ),
      )
    );
  }
}