import 'package:flutter/material.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';

class Inputfield extends StatelessWidget {
  const Inputfield({super.key, required this.labelText,
    required this.hintText, required this.prefixIcon,
    required this.keyboardInput, this.suffixIcon,
  required this.obsecureText, this.validator, this.controller});

  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardInput;
  final bool obsecureText;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
              child: Text(labelText, style: TextStyle(color: Color(0xFF0F172A), fontSize: 16),)),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 16),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: Color(0xFFFFFFFF),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFFCBD5E1))
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary)
              )
            ),
            keyboardType: keyboardInput,
            obscureText: obsecureText,
            validator: validator,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
