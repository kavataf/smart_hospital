import 'package:flutter/material.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';
import 'package:smart_hospital/features/patients/screens/changepassword.dart';
import 'package:smart_hospital/features/patients/screens/notifications.dart';
import 'package:smart_hospital/features/patients/screens/personal_info.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      child: Text('Profile',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                      Text('Jane Doe',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      Text('jane@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 10),
                      ),
                      SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Account', style: TextStyle(color: Color(0xFF64748B),
                                fontSize: 14, fontWeight: FontWeight.w500)),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                              color: AppColors.background,
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text('Personal info', style: TextStyle(fontSize: 16),),
                                      trailing: GestureDetector(
                                        onTap: (){
                                          Navigator.pushNamed(context, PersonalInfo.id);
                                        },
                                          child: Icon(Icons.arrow_forward_ios)),
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: Icon(Icons.lock),
                                    title: Text('Change password', style: TextStyle(fontSize: 16),),
                                    trailing: GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, ChangePassword.id);
                                      },
                                      child: Icon(Icons.arrow_forward_ios),
                                    )
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: Icon(Icons.notifications),
                                    title: Text('Notifications', style: TextStyle(fontSize: 16),),
                                    trailing: GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, Notifications.id);
                                      },
                                      child: Icon(Icons.arrow_forward_ios),
                                  ),
                                  )
                              ],),
                            ),
                            SizedBox(height: 40,),
                            Text('Help', style: TextStyle(color: Color(0xFF64748B),
                                fontSize: 14, fontWeight: FontWeight.w500)),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                              color: AppColors.background,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.dark_mode),
                                    title: Text('Dark mode', style: TextStyle(fontSize: 16),),
                                    trailing: Icon(Icons.toggle_on_outlined, size: 35,),
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: Icon(Icons.logout),
                                    title: Text('Logout', style: TextStyle(fontSize: 16, color: AppColors.error),),
                                  ),
                                ],),
                            ),
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
