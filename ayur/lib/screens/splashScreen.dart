import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technovate/Database/database_apis.dart';
import 'package:technovate/constant.dart';
import 'package:technovate/screens/authScreens/signup.dart';
import 'package:technovate/screens/main_screen/NavigationBar.dart';
import 'package:technovate/screens/welcome_screen.dart';

import 'authScreens/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, systemNavigationBarColor: Colors.white));

    Future.delayed(const Duration(seconds: 2),(){
      initializeApp();
    });
  }
  Future<void> initializeApp() async {
    await Firebase.initializeApp();
    if(DatabaseApis.auth.currentUser!=null){
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const navigationBar()));
      });
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const WelcomeScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/splash_png.jpeg",
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/ayur.jpg"),

                ],
              ))
        ],
      ),
    );
  }
}
