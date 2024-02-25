import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technovate/screens/main_screen/home_screen/chatbot.dart';
import 'package:technovate/screens/main_screen/home_screen/diet_plan_gen.dart';
import 'package:technovate/screens/main_screen/home_screen/medicine_generation.dart';

class DiseaseCard extends StatelessWidget {
  final String text;
  final String asset;

  const DiseaseCard({super.key, required this.text, required this.asset});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(text=="Diet Planner"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DietPlanGen()));
        }
        else if(text=="Mental Health"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatbot()));
        }
        else if(text=="Medicine Bot"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineGeneration()));
        }
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Container(
                height: 60,
                child: Image.asset(asset)),
            const SizedBox(
              height: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
