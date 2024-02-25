import 'package:flutter/material.dart';

import '../../../models/disease_card.dart';
import '../../../models/doctor.dart';
import '../home_screen/components/diseases_card.dart';
import '../home_screen/components/doctor_card.dart';
class HospitalDonorPage extends StatefulWidget {
  const HospitalDonorPage({super.key});

  @override
  State<HospitalDonorPage> createState() => _HospitalDonorPageState();
}

class _HospitalDonorPageState extends State<HospitalDonorPage> {
  List<DiseaseCardModel> disease = [
    DiseaseCardModel("Heart", "assets/images/heart.png"),
    DiseaseCardModel("Liver", "assets/images/liver.png"),
    DiseaseCardModel("Kidney", "assets/images/kidney.png"),
    DiseaseCardModel("Pancreas", "assets/images/pancreas.png"),
    DiseaseCardModel("Eyes", "assets/images/eye-care.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          title: const Text("Find Hospitals"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      backgroundColor: const Color(0xffE7EFFA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Organs Available", style: TextStyle(color: Colors.black,fontSize: 25),),
          Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DiseaseCard(
                        text: disease[index].text,
                        asset: disease[index].asset,
                      ),
                    );
                  },
                  itemCount: disease.length,
                  scrollDirection: Axis.horizontal)),
          const Text("Doctors Available",style: TextStyle(color: Colors.black,fontSize: 25),),
          Container(
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DoctorCard(
                        id: doctors[index].id,
                        name: doctors[index].name,
                        specialist: doctors[index].specialist,
                        experience: doctors[index].experience,
                        patients: doctors[index].patients));
              },
              itemCount: doctors.length,
              scrollDirection: Axis.horizontal,
            ),
          ),

        ],
      ),
    );
  }
}
