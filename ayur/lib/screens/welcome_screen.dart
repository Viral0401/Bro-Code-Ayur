import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technovate/constant.dart';
import 'package:technovate/screens/authScreens/signup.dart';

import 'authScreens/signin.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/app_design/splash_bg.svg",
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
            children: [
              const Spacer(),
              const Text(
                "INTELLIHEALTH",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              const  Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF6CD8D1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)
                      )
                    ),
                    child: const Text("Sign Up", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        )),
                    style: TextButton.styleFrom(
                      // backgroundColor: Color(0xFF6CD8D1),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape:const  RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF6CD8D1)),
                      ),
                    ),
                    child: const Text("Sign In", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              const SizedBox(height: 16,)
            ],
          ))
        ],
      ),
    );
  }
}
