import 'dart:ffi';
import 'package:provider/provider.dart';
import '../Models/models.dart';
import '../Backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginButtonWidget extends StatefulWidget {
  final String title;
  final bool hasBorder;
  final String? purpose;

  const LoginButtonWidget ({ Key? key, required this.title, required this.hasBorder, this.purpose}): super(key:key);


  createState() => LoginButtonWidgetState();
}

class LoginButtonWidgetState extends State<LoginButtonWidget> {

  String? uPass;
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {

    //final textFieldModel = Provider.of<TextFieldModel>(context);
    return Material(
      child: Consumer<TextFieldModel>(builder: (context, textModel, child) {
        return Ink(
          decoration: BoxDecoration(
            color: widget.hasBorder ? Color(0xff171924) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: widget.hasBorder ? Border.all(
              color: Color(0xff171924),
              width: 1.0
            )
            : Border.fromBorderSide(BorderSide.none)
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              switch(widget.purpose) {
                case "pushSignup": {
                  Navigator.pushReplacementNamed(context, '/signup');
                }
                break;
                
                case "pushLogin": {
                  Navigator.pushReplacementNamed(context, '/login');
                }
                break;
                case "registerUser": {
                  String userPass = textModel.userPass;
                  String userEm = textModel.userEm;

                  try{
                    final _trimmedEmail= userEm.trim();
                    final _trimmedPass = userPass.trim();
                    print(_trimmedPass);
                    print(_trimmedEmail);
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _trimmedEmail, password: _trimmedPass);
                    auth.getUser.then(
                      (user){
                        if(user != null) {
                          //Navigator.pushReplacementNamed(context, routeName)
                          print("yay there is a user");
                        }
                      }
                    );
                  }
                  catch(e){
                    print("went wrong");
                  }
                } 
                break;
                case "loginUser": {
                  String userPass = textModel.userPass;
                  String userEm = textModel.userEm;
                  //print("Userpass: ${textModel.userPass}");
                  //print("UserEm: ${textModel.userEm}");
                  try{
                    final _trimmedEmail= userEm.trim();
                    final _trimmedPass = userPass.trim();
                    print(_trimmedEmail);
                    print(_trimmedPass);
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _trimmedEmail, password: _trimmedPass);
                    auth.getUser.then(
                      (user){
                        if(user != null) {
                          //Navigator.pushReplacementNamed(context, routeName)
                          print("yay there is a user");
                        }
                      }
                    );
                  }
                  catch(e){
                    print('there no user');
                  }
                }
                break;
              }

            },
            child: Container(
              height:60.0,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.hasBorder ? Colors.white : Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18
                  )
                )
              )
            )
          ),
        );
      })
    );
  }
}
