import 'package:flutter/material.dart';
import 'package:smart_hospital/core/functions.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/login.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/inputfield.dart';
import '/features/authentication/services/auth_service.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hideText = false;
  bool _isChecked = false;
  bool _isLoading = false;
  final AuthService authService = AuthService();

  @override
  void dispose() {
    _password.dispose();
    _name.dispose();
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
                          obsecureText: false,
                          validator: validateName,
                          controller: _name,
                        ),
                        SizedBox(height: 20,),
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
                            FormField<bool>(
                              initialValue: _isChecked,
                                validator: (value){
                                  if(value != true){
                                    return "Please agree to the terms and privacy policy";
                                  }
                                return null;
                                },
                                builder: (FormFieldState<bool> field){
                                  return Column(
                                    children: [
                                      Row(
                                          children: [
                                            Checkbox(
                                          value: _isChecked,
                                          onChanged: (bool? newValue){
                                            setState(() {
                                              _isChecked = newValue ?? false;
                                            });
                                            field.didChange(_isChecked);
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
                                          ]),
                                      if(field.hasError)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Text(field.errorText!,
                                            style: TextStyle(color: Colors.red, fontSize: 12)),
                                          ),
                                        )
                                    ],
                                  );

                                }
                            ),
                        SizedBox(height: 20,),
                        Button(text: 'Sign Up',
                          isLoading: _isLoading,
                          onpressed: _isLoading? null : () async {
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final name = _name.text.trim();
                              final email = _email.text.trim();
                              final password = _password.text.trim();
                              //   pass fields to auth service
                              final response = await authService.signup(
                                  name: name,
                                  email: email,
                                  password: password
                              );
                              // if signup's successful
                              print(response['message']);
                              Navigator.pushNamed(context, Login.id);
                            } catch (error){
                              print("Something went wrong: $error");
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
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
