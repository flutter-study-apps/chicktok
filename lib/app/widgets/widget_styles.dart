import 'package:flutter/material.dart';

class WidgetStyles {
  InputDecoration ChktkTextFieldDecoration({myLabel, myHint, mybgColor}) {
    return InputDecoration(
        border: OutlineInputBorder(),
        label: Text(myLabel),
        alignLabelWithHint: false,
        hintText: myHint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber.shade100),
        ),
        // fillColor: Colors.amber[400],
        fillColor: mybgColor,
        filled: true,
        labelStyle: TextStyle(color: Colors.black54));
  }
}
