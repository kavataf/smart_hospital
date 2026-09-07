import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Button extends StatelessWidget {
  const Button({required this.text, required this.onpressed, super.key});
  final String text;

  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 343,
        height: 48,
        child: TextButton(
            onPressed: onpressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
              )),
            ),
            child:
            Text(text,
              style: TextStyle(color: Color(0xFFFFFFFF),
              fontSize: 16, fontWeight: FontWeight.w700),
            )
        ),
      );
  }
}
