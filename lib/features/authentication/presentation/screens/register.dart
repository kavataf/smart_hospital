import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/login.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/inputfield.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _hideText = false;
  bool _isChecked = false;
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
                      Text('Create your account',
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10,),
                      Text('Provide your full name, email and password to\n create your account and get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 12),
                      ),
                      SizedBox(height: 40,),
                      Inputfield(
                        labelText: 'Full Name',
                        hintText: 'Enter your name',
                        prefixIcon: Icon(Icons.person),
                        keyboardInput: TextInputType.text,
                        suffixIcon: Icon(null),
                        obsecureText: false,
                      ),
                      SizedBox(height: 20,),
                      Inputfield(
                        labelText: 'Email Address',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                        keyboardInput: TextInputType.emailAddress,
                        suffixIcon: Icon(null),
                        obsecureText: false,
                      ),
                      SizedBox(height: 20,),
                      Inputfield(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock),
                        keyboardInput: TextInputType.text,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _hideText = !_hideText;
                              });
                            },
                            child: Icon(_hideText? Icons.visibility_off : Icons.visibility)),
                        obsecureText: _hideText,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Checkbox(
                              value: _isChecked,
                              onChanged: (bool? newValue){
                                setState(() {
                                  _isChecked = newValue ?? false;
                                });
                              }),
                          SizedBox(width: 8,),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Color(0xFF000000), fontSize: 14),
                              children: [
                                TextSpan(text: 'I agree to the '),
                                TextSpan(text: 'Terms & Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold))
                              ]
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Button(text: 'Sign Up',
                        onpressed: () {
                          Navigator.pushNamed(context, Register.id);
                        },),
                      SizedBox(height: 40,),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Color(0xFF000000), fontSize: 14),
                            children: [
                              TextSpan(text: 'Already have an account? '),
                              WidgetSpan(
                                  child: GestureDetector(onTap: (){
                                    Navigator.pushNamed(context, Login.id);
                                  },
                                    child: Text('Sign In', style: TextStyle(color: AppColors.primary)),
                                  )),
                            ]
                        ),
                      ),
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
