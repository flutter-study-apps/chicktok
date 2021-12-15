import 'package:flutter/material.dart';
import 'widget_styles.dart';

class ChkTkTextField extends StatelessWidget {
  String myLabel;
  String myHint;
  Color mybgColor;

  ChkTkTextField(
      {this.myLabel = "",
      this.myHint = "Enter Value",
      this.mybgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: (String? value) {
          print('Value for field');
        },
        decoration: WidgetStyles().ChktkTextFieldDecoration(
          myLabel: myLabel,
          myHint: myHint,
          mybgColor: mybgColor,
        ),
      ),
    );
  }
}
