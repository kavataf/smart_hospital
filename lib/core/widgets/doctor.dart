  import 'package:flutter/material.dart';
  import 'package:smart_hospital/core/constants/app_colors.dart';

  class DoctorCard extends StatelessWidget {
    const DoctorCard({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 295,
        height: 207,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/profile.png")),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dr.John Doe",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
                  Text("Cardiologist",
                      style: TextStyle(fontSize: 16,)),
                  Text("12yrs experience",
                      style: TextStyle(fontSize: 16,)),
                  Row(children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.success,
                    ),
                    Text("Available Today",
                        style: TextStyle(fontSize: 14,)),
                  ],)
                ],
              ),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_forward, size: 20,),
              ),
            ],
          ),
        ),
      );
    }
  }
