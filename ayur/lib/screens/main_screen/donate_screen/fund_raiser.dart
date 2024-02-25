import 'package:flutter/material.dart';
import 'package:technovate/screens/main_screen/donate_screen/heart.dart';
import 'package:technovate/screens/main_screen/profile/health_record.dart';
class FundRaiser extends StatefulWidget {
  const FundRaiser({super.key});

  @override
  State<FundRaiser> createState() => _FundRaiserState();
}

class _FundRaiserState extends State<FundRaiser> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Heart(),
    );
  }
}
