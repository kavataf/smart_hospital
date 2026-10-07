import 'package:flutter/material.dart';
import 'package:smart_hospital/features/patients/screens/dashboard.dart';
import 'package:smart_hospital/features/patients/screens/appointment.dart';
import 'package:smart_hospital/features/patients/screens/records.dart';
import 'package:smart_hospital/features/patients/screens/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String id = 'mainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const PatientDashboard(),
    const Appointment(),
    const Records(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.calendar_month),
                label: 'Appointments'),
            NavigationDestination(
                icon: Icon(Icons.note_alt_rounded),
                label: 'Records'),
            NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile'),
          ],
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        backgroundColor: Color(0xFFCBD5E1),
      ),
    );
  }
}
