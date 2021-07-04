import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sumyre/Models/models.dart';
import '../Widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom>0;
    Size size = MediaQuery.of(context).size;
    String? email, password;

    Widget loginButton = LoginButtonWidget(hasBorder: false, title: "Signup", email: email, password: password,);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Container(
        child:Stack(
          children: [
            /*AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 :0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height /3.0,
                color: Theme.of(context).backgroundColor
              )
            ),*/

            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 2.5: 0.0,
              child:Padding(
                padding: EdgeInsets.only(top: size.height/2.5, left: size.width/8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weclome Back, Login",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height/6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff2B2E42),
                      fontFamily: "Montserrat"
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText("HOllowLive", speed: const Duration(milliseconds: 300))
                      ],
                    )
                  ),
                ],
              )
            ),

            SizedBox(height:30),

            Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFieldWidget(
                    hintText: "Email",
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    suffixIconData: model.isValid ? Icons.check : null,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    }
                  ),
                  SizedBox(height:10),
                  TextFieldWidget(
                    hintText: "Password",
                    obscureText: model.isVisible ? false : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
                    onChanged: (value){

                    },
                  ),
                  SizedBox(height: 70),
                  loginButton,
                  SizedBox(height: 20,),
                  LoginButtonWidget(hasBorder: true, title: "Login", email: "e", password: "p", purpose: "pushLogin")
                ],
              )
            ),

            /*
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
                child: Column(
                  children: [
                  ],
                )
              )
            )*/
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