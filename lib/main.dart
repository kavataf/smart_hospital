import 'package:flutter/material.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/forgotpassword.dart';
import '/features/authentication/presentation/screens/splash.dart';
import 'features/authentication/presentation/screens/emailcode.dart';
import 'features/authentication/presentation/screens/login.dart';
import 'features/authentication/presentation/screens/register.dart';
import 'features/authentication/presentation/screens/resetpassword.dart';


void main() {
  runApp(const SmartHospital());
}

class SmartHospital extends StatelessWidget {
  const SmartHospital({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart hospital app',
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => const Splash(),
        Login.id: (context) => const Login(),
        Register.id : (context) => const Register(),
        ForgotPassword.id : (context) => const ForgotPassword(),
        EmailCode.id : (context) => const EmailCode(),
        ResetPassword.id : (context) => const ResetPassword(),
      },
    );
  }
}

