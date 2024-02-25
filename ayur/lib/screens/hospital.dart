import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technovate/Database/database_apis.dart';
import 'package:technovate/Database/db_user_model.dart';
import 'package:technovate/screens/main_screen/doctors_screens/hospital_donor_page.dart';

class HospitalScreens extends StatefulWidget {
  const HospitalScreens({super.key});

  @override
  State<HospitalScreens> createState() => _HospitalScreensState();
}

class _HospitalScreensState extends State<HospitalScreens> {
  List<bool> clList = [false, false, false, false];
  String dropdownValue = "Kidney";
  late final datx;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> results;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    results = DatabaseApis.getReceipentDetails();

    // Wait for the initial data from the stream.
    final initialData = await results.first;

    // Access the data and use it in initState or elsewhere in your widget.
    final data = initialData.data();
    if (data != null) {
      // Now you can use the data as needed.
      datx = Receipent.fromJson(data);
      print(data);
      print(Receipent.fromJson(data));
    } else {
      // Handle the case where data is null.
      print("No data available.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Hospitals"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: DatabaseApis.getHospitalRequestDetails(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: SizedBox(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.data();
                if (data != null) {
                  // Access and use data here without a model class.
                  // For example:
                  final request = data['request'];
                  print(request);
                  // You can access other fields similarly.
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text('What types of organs do you need?'),
                          ),
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                child: Text('Kidney'),
                                value: 'Kidney',
                              ),
                              DropdownMenuItem(
                                child: Text('Liver'),
                                value: 'liver',
                              ),
                              DropdownMenuItem(
                                child: Text('Heart'),
                                value: 'Heart',
                              ),
                              DropdownMenuItem(
                                child: Text('Pancreas'),
                                value: 'Pancreas',
                              ),
                            ],
                            onChanged: (newValue) {
                              dropdownValue = newValue as String;
                            },
                            value: dropdownValue,
                            icon: const Icon(Icons.menu),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Terms and Conditions'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu",
                        style: TextStyle(),
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      request==false?const SizedBox():ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HospitalDonorPage()));
                      }, child: const Text("Navigate to Hospital's Donor Page")),
                      ElevatedButton(
                          onPressed: () {
                            DatabaseApis.request(false, datx, context);
                          },
                          child: const Text("Send Request"))
                    ],
                  );
                }
                return SizedBox();
            }
          }),
    );
  }
}
