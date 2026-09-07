import 'package:flutter/material.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/emailcode.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/inputfield.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'ForgotPassword';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0XFFFFFFFF),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Column(

                    children: [
                      Text('Forgot Password',
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10,),
                      Text('Please enter the email address associated\n with your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 12),
                      ),
                      SizedBox(height: 40,),
                      Inputfield(
                        labelText: 'Email Address',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                        keyboardInput: TextInputType.emailAddress,
                        suffixIcon: Icon(null),
                        obsecureText: false,
                      ),
                      SizedBox(height: 20,),
                      Button(text: 'Submit',
                        onpressed: () {
                          Navigator.pushNamed(context, EmailCode.id);
                        },),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

