import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technovate/screens/main_screen/doctors_screens/components/doctor_screen_card.dart';
import 'package:technovate/screens/main_screen/doctors_screens/doctor_details.dart';

import '../../../models/doctor.dart';
class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5F2F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF0FA47F),
        title: const Text("Doctors"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/ 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
          ), itemBuilder: (context,index){
        return Padding(
            padding: const EdgeInsets.only(top: 10,left: 6,right: 6),
            child: DoctorScreenCard(id:doctors[index].id,name: doctors[index].name, specialist:doctors[index].specialist, experience: doctors[index].experience, patients: doctors[index].patients));
      },
      itemCount: doctors.length,
      ),
    );
  }

}

