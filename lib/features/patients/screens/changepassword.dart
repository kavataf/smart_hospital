import 'package:flutter/material.dart';
import 'package:smart_hospital/main_screen.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/functions.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/inputfield.dart';
import '../../authentication/presentation/screens/forgotpassword.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static const String id = 'ChangePassword';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _hideCurrentText = false;
  bool _hideNewText = false;
  bool _hideConfirmText = false;
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, MainScreen.id);
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0XFFFFFFFF),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        SizedBox(width: 18,),
                        Text('Change Password',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inputfield(
                        labelText: 'Current Password',
                        hintText: 'Enter current password',
                        keyboardInput: TextInputType.text,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _hideCurrentText = !_hideCurrentText;
                              });
                            },
                            child: Icon(_hideCurrentText? Icons.visibility_off : Icons.visibility)),
                        obsecureText: _hideCurrentText,
                        validator: validatePassword,
                        controller: _currentPassword,
                      ),
                      SizedBox(height: 20,),
                      Inputfield(
                        labelText: 'New Password',
                        hintText: 'Create new password',
                        keyboardInput: TextInputType.text,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _hideNewText = !_hideNewText;
                              });
                            },
                            child: Icon(_hideNewText? Icons.visibility_off : Icons.visibility)),
                        obsecureText: _hideNewText,
                        validator: validatePassword,
                        controller: _newPassword,
                      ),
                      SizedBox(height: 20,),
                      Inputfield(
                        labelText: 'Confirm Password',
                        hintText: 'Enter password again',
                        keyboardInput: TextInputType.text,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _hideConfirmText = !_hideConfirmText;
                              });
                            },
                            child: Icon(_hideConfirmText? Icons.visibility_off : Icons.visibility)),
                        obsecureText: _hideConfirmText,
                        validator: validatePassword,
                        controller: _confirmPassword,
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, ForgotPassword.id);
                        },
                        child: Text('Forgot Password?',
                          style: TextStyle(color: AppColors.primary, fontSize: 14),),
                      ),
                      SizedBox(height: 20,),
                      Button2(text: 'Change Password',
                        onpressed: () {
                          //  save to database
                        },),
                      SizedBox(height: 20,),
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
