import 'package:flutter/material.dart';
import '../Models/models.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {

  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function(String)? onChanged;

  TextFieldWidget({
    required this.hintText,
    required this.obscureText,
    required this.onChanged,
    required this.prefixIconData,
    this.suffixIconData
  });

  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Color(0xff2B2E42),
      style: Theme.of(context).textTheme.subtitle1,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size:18,
          color: Colors.white
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size:18,
            color: Colors.white
          ),
        )
      ),
    );
  }

  String showSomething() {
    return "something";
  }
}