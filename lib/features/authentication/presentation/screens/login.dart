import 'package:flutter/material.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';
import 'package:smart_hospital/core/functions.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/register.dart';
import 'package:smart_hospital/features/patients/screens/dashboard.dart';
import 'package:smart_hospital/main_screen.dart';
import '../../../../core/widgets/inputfield.dart';
import '/core/widgets/button.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/forgotpassword.dart';
import '/features/authentication/services/auth_service.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hideText = false;
  bool _isLoading = false;
  final AuthService authService = AuthService();
  @override
  void dispose() {
    _password.dispose();
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
                        Text('Welcome Back',
                          style: TextStyle(color: Color(0xFF000000),
                          fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10,),
                        Text('Stay connected by signing in with your email\nand password to access your account',
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
                          controller: _password,
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, ForgotPassword.id);
                            },
                            child: Text('Forgot Password?',
                            style: TextStyle(color: AppColors.primary, fontSize: 14),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Button(text: 'Sign In',
                          isLoading: _isLoading,
                          onpressed: _isLoading? null : () async{
                          if(_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final email = _email.text.trim();
                              final password = _password.text.trim();
                              final response = await authService.signin(
                                  email: email,
                                  password: password);
                              print(response['message']);
                              Navigator.pushNamed(context, MainScreen.id);
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
                        SizedBox(height: 50,),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(color: Color(0xFF000000), fontSize: 14),
                              children: [
                                TextSpan(text: 'Don\'t have an account? '),
                                WidgetSpan(
                                    child: GestureDetector(onTap: (){
                                      Navigator.pushNamed(context, Register.id);
                                    },
                                      child: Text('Sign Up', style: TextStyle(color: AppColors.primary)),
                                    )),
                              ]
                          ),
                        ),
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
