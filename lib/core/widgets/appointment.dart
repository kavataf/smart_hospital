import 'package:flutter/material.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
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
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Tuesday, 8 September 2026"),
          ),
          ListTile(
            leading: Icon(Icons.timelapse),
            title: Text("10:30 AM"),
          ),
          Text("Cardiology Department", style: TextStyle(fontSize: 14),),
          ListTile(
            leading: CircleAvatar(radius: 20, backgroundColor: AppColors.success,),
            title: Text("Confirmed"),
          ),
        ],
      ),
    );
  }
}
