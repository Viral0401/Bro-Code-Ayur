import 'package:flutter/material.dart';

class TextField_1 extends StatelessWidget {
  String hinText;
  String labelText;
  IconData icon;

  TextField_1(this.hinText, this.labelText, this.icon);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,

        labelStyle: TextStyle(
          color: Color(0xff263077),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xff263077)),
        ),

        prefixIcon: Icon(
          icon,
          color: Color(0xff263077),
        ),
      ),
    );
  }
}