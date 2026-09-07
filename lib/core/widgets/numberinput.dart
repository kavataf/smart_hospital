import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 26, fontWeight: FontWeight.w700),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xFFCBD5E1))
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary)
                )
            ),
            keyboardType:  TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1)],
          ),
    );
  }
}
