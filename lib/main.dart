import 'package:flutter/material.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/forgotpassword.dart';
import 'package:smart_hospital/features/patients/screens/appointment.dart';
import 'package:smart_hospital/features/patients/screens/dashboard.dart';
import 'package:smart_hospital/features/patients/screens/doctor.dart';
import 'package:smart_hospital/features/patients/screens/personal_info.dart';
import 'package:smart_hospital/main_screen.dart';
import '/features/authentication/presentation/screens/splash.dart';
import 'features/authentication/presentation/screens/emailcode.dart';
import 'features/authentication/presentation/screens/login.dart';
import 'features/authentication/presentation/screens/register.dart';
import 'features/authentication/presentation/screens/resetpassword.dart';
import 'features/patients/screens/changepassword.dart';
import 'features/patients/screens/notifications.dart';

void main() {
  runApp(const SmartHospital());
}

class SmartHospital extends StatelessWidget {
  const SmartHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart hospital app',
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.id,

      routes: {
        Splash.id: (context) => const Splash(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        PatientDashboard.id: (context) => const PatientDashboard(),
        Appointment.id: (context) => const Appointment(),
        Doctor.id: (context) => const Doctor(),
        MainScreen.id: (context) => const MainScreen(),
        PersonalInfo.id: (context) => const PersonalInfo(),
        ChangePassword.id: (context) => const ChangePassword(),
        Notifications.id: (context) => const Notifications(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == EmailCode.id) {
          final email = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => EmailCode(
              email: email,
            ),
          );
        }

        if (settings.name == ResetPassword.id) {
          final resetToken = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) => ResetPassword(
              resetToken: resetToken,
            ),
          );
        }

        return null;
      },
    );
  }
}