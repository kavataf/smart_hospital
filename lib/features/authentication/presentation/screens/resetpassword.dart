import 'package:flutter/material.dart';
import 'package:smart_hospital/core/functions.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/login.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/inputfield.dart';
import '/features/authentication/services/auth_service.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'ResetPassword';
  final String resetToken;
  const ResetPassword({super.key, required this.resetToken});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _hideText = false;
  bool _hideconfirmText = false;
  bool _isLoading = false;
  final AuthService authService = AuthService();
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text('Set a New Password',
                          style: TextStyle(color: Color(0xFF000000),
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10,),
                        Text('Your new password must be different from\n previously used passwords',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000),
                              fontSize: 12),
                        ),
                        SizedBox(height: 40,),
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
                          validator: validatePassword,
                          controller: _passwordController,
                        ),
                        SizedBox(height: 20,),
                        Inputfield(
                          labelText: 'Confirm Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock),
                          keyboardInput: TextInputType.text,
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _hideconfirmText = !_hideconfirmText;
                                });
                              },
                              child: Icon(_hideconfirmText? Icons.visibility_off : Icons.visibility)),
                          obsecureText: _hideconfirmText,
                          controller: _confirmPasswordController,
                          validator: (String? value){
                            if(value == null || value.trim().isEmpty){
                              return "Please enter your password";
                            }
                            if(value != _passwordController.text){
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30,),
                        Button(text: 'Reset password',
                          isLoading: _isLoading,
                          onpressed: _isLoading? null : () async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                final password = _passwordController.text.trim();
                                final confirmPassword = _confirmPasswordController.text.trim();
                                final response = await authService.resetpassword(
                                    resetToken: widget.resetToken,
                                    newPassword: password,
                                    confirmPassword: confirmPassword);
                                print(response['message']);
                                Navigator.pushNamed(context, Login.id);
                              }catch(error){
                                print("Something went wrong: $error");
                              } finally{
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

