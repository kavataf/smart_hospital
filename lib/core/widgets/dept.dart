import 'package:flutter/material.dart';

class DepartmentBtn extends StatelessWidget {
  const DepartmentBtn({super.key, required this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFCBD5E1)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26))
          )),),
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.black),));
  }
}
