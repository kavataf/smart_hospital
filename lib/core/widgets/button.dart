import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

// async button
class Button extends StatelessWidget {
  const Button({required this.text, required this.onpressed,
    this.isLoading = false, super.key});
  final String text;
  final bool isLoading;
  final AsyncCallback? onpressed;

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
            child: isLoading?
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Text(text,
              style: TextStyle(color: Color(0xFFFFFFFF),
              fontSize: 16, fontWeight: FontWeight.w700),
            )
        ),
      );
  }
}

// void button
class Button2 extends StatelessWidget {
  const Button2({required this.text, required this.onpressed, super.key});
  final String text;
  final VoidCallback? onpressed;

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
          child: Text(text,
            style: TextStyle(color: Color(0xFFFFFFFF),
                fontSize: 16, fontWeight: FontWeight.w700),
          )
      ),
    );
  }
}
class Button3 extends StatelessWidget {
  const Button3({required this.text, required this.onpressed, this.backgroundColor, super.key});
  final String text;
  final VoidCallback? onpressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 48,
      child: TextButton(
          onPressed: onpressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(backgroundColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))
            )),
          ),
          child: Text(text,
            style: TextStyle(color: Color(0xFFFFFFFF),
                fontSize: 16, fontWeight: FontWeight.w700),
          )
      ),
    );
  }
}
