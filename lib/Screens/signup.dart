import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/widgets.dart';
import '../Models/models.dart';

class SignupScreen extends StatefulWidget {
  final ValueChanged<String>? onUserChangePass;

  SignupScreen({this.onUserChangePass});
  SignupScreenState createState() => SignupScreenState();
}
class SignupScreenState extends State<SignupScreen> {

  void initState() {
    super.initState();
    final textModel = Provider.of<TextFieldModel>(context, listen: false);
    final model = Provider.of<HomeModel>(context, listen: false);
    textModel.updateErrorMsg('noE');
    model.isValidEmail("heheh");
    print('updated');
  }

  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom>0;
    final textModel = Provider.of<TextFieldModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    String? email, password;

    return Scaffold(
      //backgroundColor: Colors.white,
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        child:Stack(
          children: [
            
            /*Container(
              height: size.height -200,
              color: Colors.white
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 :0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height /3.0,
                color: Theme.of(context).backgroundColor
              )
            ),*/

            showText(),

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
                      textModel.updateUserEm(value);
                    }
                  ),
                  SizedBox(height:10),
                  TextFieldWidget(
                    hintText: "Password",
                    obscureText: model.isVisible ? false : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
                    onChanged: (value){
                      textModel.updateUsePass(value);
                    },
                  ), 
                  DisplayErrorMsg(),
                  LoginButtonWidget(hasBorder: false, title: "Signup", purpose: "registerUser"),
                  SizedBox(height: 20,),
                  LoginButtonWidget(hasBorder: true, title: "Login", purpose: "pushLogin")
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

  Widget DisplayErrorMsg() {
    final textModel = Provider.of<TextFieldModel>(context, listen: false);
    
    if(textModel.errorMsg != null) {
      if(textModel.errorMsg == "noE"){
        return SizedBox(height: 70);
      }
      else{
        String emes = textModel.errorMsg;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:30),
            Container(
              child: Text(emes, style: TextStyle(color: Colors.redAccent,
                  fontSize:16,
                  fontWeight: FontWeight.normal)),
            )
          ],
        );
      }
    }
    else {
      return SizedBox(height: 70);
    }
  }

  Widget showText() {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom>0;
    Size size = MediaQuery.of(context).size;
    bool childShow = keyboardOpen ? false : true;

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 150),
      firstChild: Container(),
      secondChild: Padding(
        padding: EdgeInsets.only(top: size.height/2.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to HOllowLive",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ),
      crossFadeState: childShow ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}