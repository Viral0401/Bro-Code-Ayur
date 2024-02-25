import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:technovate/Database/database_apis.dart';
import 'package:technovate/models/disease_card.dart';
import 'package:technovate/models/doctor.dart';
import 'package:technovate/screens/main_screen/donate_screen/fund_raiser.dart';
import 'package:technovate/screens/main_screen/donate_screen/heart.dart';
import 'package:technovate/screens/main_screen/home_screen/components/diseases_card.dart';
import 'package:technovate/screens/main_screen/home_screen/components/named_text_card.dart';
import 'package:technovate/screens/main_screen/home_screen/components/slidet_carousel.dart';
import 'package:technovate/screens/main_screen/home_screen/flask_disease_predicytion.dart';
import '../../noti.dart';
import './chatbot.dart';
import 'components/doctor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  void initState(){
    Noti.initialize(flutterLocalNotificationsPlugin);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool customIcon = false;

    List<DiseaseCardModel> disease = [
      DiseaseCardModel("Diet Planner", "assets/images/dine.png"),
      DiseaseCardModel("Mental Health", "assets/images/Mental-Health-icon.png"),
      DiseaseCardModel("Medicine Bot", "assets/images/med.jpeg"),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFC5F2F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const Spacer(),
                  const SizedBox(
                    width: 10,
                  ),

                  Spacer(),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Noti.showBigTextNotification(title: "Medicine Time", body: "Time for intragesic MR", fln: flutterLocalNotificationsPlugin);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                      onPressed: () {
                         DatabaseApis.sendSOS(context);

                      },

                      icon: Image.asset('assets/images/sos.png', height: 30,width: 30,)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        // dynamic conversationObject = {
                        //   'appId': '8dd55598866ed115265bb4e9d9c30f65',
                        //   // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                        // };
                        // KommunicateFlutterPlugin.buildConversation(
                        //         conversationObject)
                        //     .then((clientConversationId) {
                        //   print("Conversation builder success : " +
                        //       clientConversationId.toString());
                        // }).catchError((error) {
                        //   print("Conversation builder error : " +
                        //       error.toString());
                        // });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatbot()));
                      },
                      icon: const Icon(CupertinoIcons.chat_bubble_text_fill))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SLiderCarousel(),
              const SizedBox(
                height: 30,
              ),
              const NamedTextCard(category: "Categories"),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: DiseaseCard(
                            text: disease[index].text,
                            asset: disease[index].asset,
                          ),
                        );
                      },
                      itemCount: disease.length,
                      scrollDirection: Axis.horizontal)),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PredictionPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset("assets/images/instant-512.png", height: 150,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("NEED INSTANT", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),maxLines: 2,),
                            Text("SOLUTION?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),maxLines: 2,),
                            SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text("Click Here", style: TextStyle(color: Color(0xFF0FA47F), fontWeight: FontWeight.bold),),
                                  Icon(Icons.arrow_forward_outlined, color: Color(0xFF0FA47F),),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF0FA47F),
                      borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const NamedTextCard(category: "Availablity"),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 30,
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Fund Raiser",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    title: Text("Help People by contributing small amount"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FundRaiser()));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "You Should Know",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ExpansionTile(
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            customIcon = true;
                          });
                        },
                        title: const Text("ORGAN DONATION PROCESS"),
                        trailing: Icon(customIcon
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '1) Hospital Organ Donation Registry (HODR) coordinates the process of cadaver organ donation i.e. organ donation after death and transplantation.'),
                                Text('2) There are two ways to donate organs:'),
                                Text(
                                    '3) By pledging for organ donation when a person is alive'),
                                Text('4) By consent of family after death.'),
                                Text(
                                    '5) During lifetime, a person can pledge for organ donation by filling up a donor form in the presence of two witnesses, one of who shall be a near relative.'),
                                Text(
                                    '6) The donor form is absolutely free of cost'),
                                Text(
                                    '7) The donor form is absolutely free of cost'),
                                SizedBox(
                                  height: 5,
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
                    Container(
                      color: Colors.white,
                      child: ExpansionTile(
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            customIcon = true;
                          });
                        },
                        title: const Text(
                            "Laws and Rules Governing Organ Transplantation in India"),
                        trailing: Icon(customIcon
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '1) The primary legislation related to organ donation and transplantation in India, Transplantation of Human Organs Act, was passed in 1994 and is aimed at regulation of removal, storage and transplantation of human organs for therapeutic purposes and for prevention of commercial dealings in human organs.'),
                                Text(
                                    '2) In India, matters related to health are governed by each state. The Act was initiated at the request of Maharashtra, Himachal Pradesh and Goa (who therefore adopted it by default) and was subsequently adopted by all states except Andhra Pradesh and Jammu & Kashmir.'),
                                Text(
                                    '3) Despite a regulatory framework, cases of commercial dealings in human organs were reported in the media. An amendment to the act was proposed by the states of Goa, Himachal Pradesh and West Bengal in 2009 to address inadequacies in the efficacy, relevance and impact of the Act.'),
                                Text(
                                    '4) The amendment to the Act was passed by the parliament in 2011, and the rules were notified in 2014. The same is adopted by the proposing states and union territories by default and may be adopted by other states by passing a resolution.'),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: ExpansionTile(
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            customIcon = true;
                          });
                        },
                        title: const Text(
                            "The Main Provisions Of The Act (including the amendments and rules of 2014) are as follows"),
                        trailing: Icon(customIcon
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "A. Brain death identified as a form of death. Process and criteria for brain death certification defined (Form 10 )"),
                                Text(
                                    "B. Allows transplantation of human organs and tissues from living donors and cadavers (after cardiac or brain death)<br /><br />"),
                                Text(
                                    "B. Allows transplantation of human organs and tissues from living donors and cadavers (after cardiac or brain death)<br /><br />"),
                                Text(
                                    "D. Brain death identified as a form of death. Process and criteria for brain death certification defined (Form 10 )"),
                                Text(
                                    "E. Allows transplantation of human organs and tissues from living donors and cadavers (after cardiac or brain death)<br /><br />"),
                                Text(
                                    "F. Allows transplantation of human organs and tissues from living donors and cadavers (after cardiac or brain death)<br /><br />"),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
