import 'package:flutter/material.dart';
import 'package:smart_hospital/features/authentication/presentation/screens/login.dart';
import '/core/widgets/button.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFF36494C)],
              stops: [0.1, 0.9]
            )
                .createShader(bounds);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.jpg"),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Smarter care,\n simpler lives",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Smart care centered on you,the future\n of care made easy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Button(
                      text: 'Get Started',
                      onpressed: (){
                        Navigator.pushReplacementNamed(context, Login.id);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
