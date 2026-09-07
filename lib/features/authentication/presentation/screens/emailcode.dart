import 'package:flutter/material.dart';
import 'package:smart_hospital/core/widgets/numberinput.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/resetpassword.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/button.dart';

class EmailCode extends StatefulWidget {
  static const String id = 'EmailCode';
  const EmailCode({super.key});

  @override
  State<EmailCode> createState() => _EmailCodeState();
}

class _EmailCodeState extends State<EmailCode> {
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
                      Text('Check your email',
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10,),
                      Text('Please enter the 4 digit code that send to\n kavatf***@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 12),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberInput(),
                          NumberInput(),
                          NumberInput(),
                          NumberInput(),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Button(text: 'Continue',
                        onpressed: () {
                          Navigator.pushNamed(context, ResetPassword.id);
                        },),
                      SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Color(0xFF000000), fontSize: 14),
                                children: [
                                  TextSpan(text: 'Didn\'t get any code? '),
                                  WidgetSpan(
                                      child: GestureDetector(onTap: (){
                                        Navigator.pushNamed(context, ResetPassword.id);
                                      },
                                        child: Text('Click to resend', style: TextStyle(color: AppColors.primary)),
                                      )),
                                ]
                            ),
                          ),
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

