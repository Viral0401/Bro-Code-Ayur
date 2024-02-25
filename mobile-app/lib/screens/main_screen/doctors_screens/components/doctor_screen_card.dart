import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:technovate/screens/main_screen/doctors_screens/doctor_details.dart';
class DoctorScreenCard extends StatelessWidget {
  final String id;
  final String name;
  final String specialist;
  final String experience;
  final String patients;
  const DoctorScreenCard({super.key, required this.name, required this.specialist, required this.experience, required this.patients, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorDetails(doctorName: name, doctorId: id)));
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            color: Color(0xFF0FA47F),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 10,
                  ),
                  child: Text(
                    "Ramiya Kishori",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Medicine Specialist",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RatingBar(
                    itemSize: 15,
                    ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: const Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        ),
                        empty: const Icon(
                          Icons.star,
                          color: Colors.grey,
                        )),
                    onRatingUpdate: _saveRating,
                    minRating: 1,
                    maxRating: 5,
                    initialRating: 5,
                    allowHalfRating: true,
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Experience",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "7 year",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 10),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Patients",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "1.02 k",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 10),
                  ),
                ),


              ],
            ),
            const Spacer(),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Hero(
                  tag: id,
                  child: Image.asset(
                    "assets/images/Serena_Gome.png",

                    width: 60,
                    height: 80,
                  ),
                ))
          ],
        ),
      ),
    );
  }
  void _saveRating(double value) {}
}
