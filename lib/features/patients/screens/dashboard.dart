import 'package:flutter/material.dart';
import 'package:smart_hospital/core/constants/app_colors.dart';
import 'package:smart_hospital/core/widgets/appointment.dart';
import 'package:smart_hospital/core/widgets/dept.dart';
import 'package:smart_hospital/core/widgets/doctor.dart';
import 'package:smart_hospital/features/patients/screens/appointment.dart';
import '../../../core/widgets/inputfield.dart';
 class PatientDashboard extends StatefulWidget {
   static const String id = 'patient';
   const PatientDashboard({super.key});

   @override
   State<PatientDashboard> createState() => _PatientDashboardState();
 }

 class _PatientDashboardState extends State<PatientDashboard> {

   @override
   Widget build(BuildContext context) {
     return SafeArea(
         child: Scaffold(
           backgroundColor: AppColors.background,
           body: Padding(
             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Container(
                             height: 60,
                               width: 60,
                               decoration: BoxDecoration(
                                 color: Color(0xFFCBD5E1),
                                 borderRadius: BorderRadius.circular(8),
                                 image: DecorationImage(
                                     image: AssetImage("assets/images/profile.png")),
                               ),
                               ),
                           SizedBox(width: 10,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Welcome back,",
                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,)),
                               Text("Jane Doe",
                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,)),
                             ],
                           )
                         ],
                       ),
                       CircleAvatar(
                         radius: 20,
                         backgroundColor: Color(0xFFCBD5E1),
                         child: Icon(Icons.notifications_none, color: Colors.black,),
                       )
                     ],
                   ),
                   SizedBox(height: 10,),
                   Inputfield(
                       labelText: "",
                       hintText: "search for medical services",
                       prefixIcon: Icon(Icons.search_rounded),
                       keyboardInput: TextInputType.text,
                       obsecureText: false
                   ),
                   SizedBox(height: 20,),
                   SizedBox(
                     height: 60,
                     child: ListView.builder(
                         itemCount: departments.length + 1,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) {
                           if(index == 0){
                             return Padding(padding: EdgeInsets.only(right: 10),
                               child: CircleAvatar(
                               radius: 30,
                               backgroundColor: Color(0xFFCBD5E1),
                               child: Icon(Icons.list, color: Colors.black,),
                             )
                             );
                           }
                           final department = departments[index - 1];
                           return Padding(padding: EdgeInsets.only(right: 10),
                             child: DepartmentBtn(
                                 onPressed: (){},
                                 text: department),
                           );
                         }),
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Row(children: [
                       Text("Upcoming", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                       SizedBox(width: 8,),
                       CircleAvatar(radius: 12, backgroundColor: Colors.black,
                         child: Text("3", style: TextStyle(fontSize: 14, color: Colors.white),),)
                     ],),
                     Text("view all",
                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                           color: AppColors.primary),)
                   ],),
                   SizedBox(height: 20,),
                   SizedBox(
                     height: 290,
                     child: ListView.builder(
                         itemCount: appointments.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) {
                           final appointment = appointments[index];
                           return Padding(padding: EdgeInsets.only(right: 10),
                             child: SizedBox(
                               width: 320,
                               child: GestureDetector(
                                 onTap: (){
                                   Navigator.pushNamed(context, Appointment.id);
                                 },
                                 child: AppointmentCard(
                                     doctorName: appointment['doctorName']!,
                                     specialization: appointment['specialization']!,
                                     date: appointment['date']!,
                                     time: appointment['time']!,
                                     department: appointment['department']!,
                                     status: appointment['status']!),
                               ),
                             ),
                           );
                         }),
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Doctors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                       Text("view all",
                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                             color: AppColors.primary),)
                     ],),
                   SizedBox(height: 20,),
                   SizedBox(
                     height: 200,
                     child: ListView.builder(
                         itemCount: 3,
                         scrollDirection: Axis.vertical,
                         itemBuilder: (context, index) {
                           final doctor = doctors[index];
                           return Padding(padding: EdgeInsets.only(right: 10),
                             child: DoctorCard(doctorName: doctor['doctorName']!,
                                 status: doctor['status']!,
                                 experience: doctor['experience']!,
                                 specialization: doctor['specialization']!),
                           );
                         }),
                   ),
                   ],
               ),
             ),
           ),
         ));
   }
 }
