import 'package:flutter/material.dart';
import 'package:smart_hospital/features/patients/screens/appointment.dart';

import '../constants/app_colors.dart';
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
    required this.department,
    required this.status,
  });

  final String doctorName;
  final String specialization;
  final String date;
  final String time;
  final String department;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        specialization,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Appointment.id);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20, color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.calendar_month),
              title: Text(date),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.access_time),
              title: Text(time),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                department,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.success,
              ),
              title: Text(status),
            ),
          ],
        ),
      ),
    );
  }
}


final appointments = [
  {
    'doctorName': 'Dr. John Doe',
    'specialization': 'Cardiologist',
    'date': 'September 19',
    'time': '10:00 AM',
    'department': 'Cardiology',
    'status': 'Available',
  },
  {
    'doctorName': 'Dr. Jane Smith',
    'specialization': 'Neurologist',
    'date': 'September 20',
    'time': '11:30 AM',
    'department': 'Neurology',
    'status': 'Confirmed',
  },
  {
    'doctorName': 'Dr. Mike Lee',
    'specialization': 'Dermatologist',
    'date': 'September 21',
    'time': '2:00 PM',
    'department': 'Dermatology',
    'status': 'Available',
  },
];

final List<String> departments = ['Cardiology', 'Dermatology', 'Neurology', 'Surgery', 'pediatrics'];