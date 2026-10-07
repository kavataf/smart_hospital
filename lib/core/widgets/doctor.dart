  import 'package:flutter/material.dart';
  import 'package:smart_hospital/core/constants/app_colors.dart';

  class DoctorCard extends StatelessWidget {
    const DoctorCard({super.key, required this.doctorName, required this.status,
      required this.experience, required this.specialization});
    final String doctorName;
    final String specialization;
    final String experience;
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
                  Container(
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
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  experience,
                  style: TextStyle(fontSize: 14),
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

  final doctors = [
    {
      'doctorName': 'Dr. John Doe',
      'specialization': 'Cardiologist',
      'experience': '7yrs experience',
      'status': 'Available',
    },
    {
      'doctorName': 'Dr. Jane Smith',
      'specialization': 'Neurologist',
      'experience': '7yrs experience',
      'status': 'Confirmed',
    },
    {
      'doctorName': 'Dr. Mike Lee',
      'specialization': 'Dermatologist',
      'experience': '8yrs experience',
      'status': 'Available',
    },
  ];
