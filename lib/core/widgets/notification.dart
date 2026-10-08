import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.subtitle, required this.title,
    required this.trailingIcon, required this.trailingTime});
  final String title;
  final String subtitle;
  final Widget? trailingIcon;
  final String trailingTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.background,
      child: ListTile(
        leading: Icon(Icons.notifications, color: AppColors.primary,),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?trailingIcon,
            Text(trailingTime, style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),)
          ],
        ),
      ),
    );
  }
}
