import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/notification.dart';
import '../../../main_screen.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  static const String id = 'notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Notifications',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text('Stay updated with your activity',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('All', style: TextStyle(fontSize: 14),),
                          SizedBox(width: 30,),
                          Text('Unread', style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Today', style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),),
                          Text('Mark all read', style: TextStyle(fontSize: 12, color: Color(0xFF2563EB)),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      NotificationCard(
                        subtitle: '\$2,500 from TechCorp Inc.',
                        title: 'Payment Received',
                        trailingIcon: CircleAvatar(radius: 4, backgroundColor: AppColors.primary,),
                        trailingTime: '2h ago',
                      ),
                      NotificationCard(
                        subtitle: 'You have an upcoming app...',
                        title: 'Upcoming appointment',
                        trailingIcon: CircleAvatar(radius: 4, backgroundColor: AppColors.primary,),
                        trailingTime: '2h ago',
                      ),
                      SizedBox(height: 20,),
                      Text('Yesterday', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                      SizedBox(height: 20,),
                      NotificationCard(
                        subtitle: '\$2,500 from TechCorp Inc.',
                        title: 'Payment Received',
                        trailingIcon: Icon(Icons.more_horiz),
                        trailingTime: '1d ago',
                      ),
                      SizedBox(height: 20,),
                      Text('Earlier', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                      SizedBox(height: 20,),
                      NotificationCard(
                        subtitle: 'You have an upcoming app...',
                        title: 'Upcoming appointment',
                        trailingIcon: Icon(Icons.more_horiz),
                        trailingTime: '2d ago',
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
