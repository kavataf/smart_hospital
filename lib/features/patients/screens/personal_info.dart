import 'package:flutter/material.dart';
import 'package:smart_hospital/main_screen.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/functions.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/inputfield.dart';
class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});
  static const String id = 'Personalinfo';

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String? selectedValue;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
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
                        Text('Personal info',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/images/profile.png'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child:  Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            )
                          ]
                      ),
                      SizedBox(height: 18,),
                      Text('Change profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.primary,
                            fontSize: 14, fontWeight: FontWeight.w700,),
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Inputfield(
                            labelText: 'Full Name',
                            hintText: 'Enter your name',
                            keyboardInput: TextInputType.text,
                            obsecureText: false,
                            validator: validateName,
                            controller: _name,
                          ),
                          SizedBox(height: 20,),
                          Inputfield(
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            keyboardInput: TextInputType.emailAddress,
                            obsecureText: false,
                            validator: validateEmail,
                            controller: _email,
                          ),
                          SizedBox(height: 20,),
                          Inputfield(
                            labelText: 'Phone number',
                            hintText: 'Enter your Phone number',
                            keyboardInput: TextInputType.number,
                            obsecureText: false,
                            validator: validateEmail,
                            controller: _phoneNumber,
                          ),
                          SizedBox(height: 20,),
                          Text('Gender', style: TextStyle(color: Color(0xFF0F172A), fontSize: 16),),
                          SizedBox(height: 10,),
                          DropdownButtonFormField<String>(
                            value: selectedValue,
                            hint: Text('Select your gender'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color(0xFFCBD5E1))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: AppColors.primary)
                                ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                            ),
                            items: const [
                              DropdownMenuItem(value: 'male', child: Text('male')),
                              DropdownMenuItem(value: 'female', child: Text('female')),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          Inputfield(
                            labelText: 'Age(Years)',
                            hintText: 'Enter your age',
                            keyboardInput: TextInputType.number,
                            obsecureText: false,
                            validator: validateEmail,
                            controller: _age,
                          ),
                          SizedBox(height: 20,),
                          Button2(text: 'Save',
                            onpressed: () {
                            //  save to database
                            },),
                          SizedBox(height: 20,),
                          Button3(text: 'Cancel',
                            backgroundColor: Color(0XFF64748B),
                            onpressed: () {
                              // cancel process
                            },),
                        ],
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
