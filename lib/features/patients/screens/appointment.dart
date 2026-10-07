import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class Appointment extends StatefulWidget {
  static const String id = 'appointment';
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
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
                  Column(
                    children: [
                      Text('View Appointment',
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10,),
                      Text('Stay connected by signing in with your email\nand password to access your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000),
                            fontSize: 12),
                      ),
                      SizedBox(height: 20,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
