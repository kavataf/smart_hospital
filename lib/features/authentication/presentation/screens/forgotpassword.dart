import 'package:flutter/material.dart';
import 'package:smart_hospital/core/functions.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/emailcode.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/inputfield.dart';
import '/features/authentication/services/auth_service.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'ForgotPassword';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _email.dispose();
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
                          obsecureText: false,
                          validator: validateEmail,
                          controller: _email,
                        ),
                        SizedBox(height: 20,),
                        Button(text: 'Submit',
                          isLoading: _isLoading,
                          onpressed: _isLoading? null : () async{
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final email = _email.text.trim();
                              final response = await authService.forgotpassword(
                                  email: email);
                              print(response['message']);
                              Navigator.pushNamed(context, EmailCode.id, arguments: email);
                            } catch(error){
                              print("Something went wrong: $error");
                            } finally {
                              if(mounted){
                                setState(() {
                                  _isLoading = false;
                                });
                              }
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

