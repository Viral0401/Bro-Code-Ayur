import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorDetails extends StatefulWidget {
  final String doctorName;
  final String doctorId;

  const DoctorDetails({super.key, required this.doctorName, required this.doctorId});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          widget.doctorName,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: const Color(0xffE7EFFA),
              ),
              child: Hero(
                tag: widget.doctorId,
                child: Image.asset(
                  "assets/images/Asma_Khan.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        color: const Color(0xff68BAEB),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        Text(
                          "Voice Call",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        color: const Color(0xff8869EA),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.video_call,
                          color: Colors.white,
                        ),
                        Text(
                          "Video Call",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        color: const Color(0xffE7A76C),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                        ),
                        Text(
                          "Message",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Medcine and Heart Specialist",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Good Health Clinic, MBBS, FCPS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "About",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                expandText: "more",
                collapseText: "less",
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ElevatedButton(onPressed: (){

                },style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2D5ED0),minimumSize: Size(350,60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),child:const Text("Book An Appointment", style: TextStyle(color: Colors.white),)))

          ],
        ),
      ),
    );
  }

  void _saveRating(double val) {}
}
