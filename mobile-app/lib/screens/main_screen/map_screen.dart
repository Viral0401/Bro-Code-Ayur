import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:technovate/Database/nearbyData.dart';
import 'package:technovate/screens/hospital.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Marker> _marker = [];
  myData data = myData();


  static final CameraPosition _KGooglePlex = const CameraPosition(
    target: LatLng(19.11, 72.84),
    zoom: 14.4746,
  );

  void initState() {
    super.initState();
  }

  String? tappedMarkerTitle;
  String? tappedMarkerSnippet;
  Completer<GoogleMapController> _completer = Completer();

  @override
  Widget build(BuildContext context) {
    final List<Marker> _list =  [
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(19.11, 72.84),
          infoWindow: InfoWindow(
              title: "My Position",
              snippet:
              "Bhavans Campus, Old D N Nagar, Munshi Nagar, Andheri West, Mumbai, Maharashtra 400058", onTap: (){
          })),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(19.1111479, 72.87207549999999),
        infoWindow: InfoWindow(title: "Mukund Hospital", snippet: " "),
      ),
      Marker(
          markerId: MarkerId('3'),
          position: LatLng(19.1078, 72.8362),
          infoWindow: InfoWindow(
              title: "Cooper Hospital",
              snippet:
              "JVPD Scheme, Vile Parle West, Mumbai, Maharashtra 400056")),
      Marker(
          markerId: MarkerId('4'),
          position: LatLng(19.0509, 72.8289),
          infoWindow: InfoWindow(
              title: "Leelavati hospital",
              snippet: "Ranwar, Bandra West, Mumbai, Maharashtra 400050")),
      Marker(
        markerId: MarkerId('5'),
        position: LatLng(19.2111479, 72.87207549999999),
        infoWindow: InfoWindow(title: "Grad Hospital", snippet: "Ranjar"),
      ),
      Marker(
          markerId: MarkerId('6'),
          position: LatLng(19.1078, 72.8362),
          infoWindow: InfoWindow(
              title: "BhaktiVedanta Hospital",
              snippet:
              "Bhaktivedanta Swami Marg, Sector 6, Sector 1, Srishti Complex, Mira Road East, Mira Bhayandar, Maharashtra 401107")),
      Marker(
          markerId: MarkerId('7'),
          position: LatLng(18.9752, 72.8239),
          infoWindow: InfoWindow(
              title: "Wockhardt hospital",
              snippet:
              "Bhaktivedanta Swami Marg, Sector 6, Sector 1, Srishti Complex, Mira Road East, Mira Bhayandar, Maharashtra 401107")),
      Marker(
          markerId: MarkerId('8'),
          position: LatLng(19.1509, 72.8289),
          infoWindow: InfoWindow(
              title: "ROTTO SOTTO",
              snippet:
              "New Building, ROTTO-SOTTO Office, 7th Floor KEM Hospital, Parel, Mumbai, Maharashtra 400012")),
      Marker(
        markerId: MarkerId('9'),
        position: LatLng(19.3111479, 72.27207549999999),
        infoWindow: InfoWindow(title: "OTHD", snippet: "Parle West"),
      ),
      Marker(
          markerId: MarkerId('10'),
          position: LatLng(19.1078, 72.8362),
          infoWindow: InfoWindow(title: "KIO Trust", snippet: "Parle East")),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0FA47F),
        title: const Text("Find Hospitals"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: GoogleMap(
                initialCameraPosition: _KGooglePlex,
                markers: Set<Marker>.of(_list),
                onTap: (LatLng latLng) {

                },
                onMapCreated: (GoogleMapController controller) {
                  _completer.complete(controller);
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 600,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: ListView.builder(
                  itemCount: markerData.length,
                  itemBuilder:(context,index){
                return ListTile(

                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const HospitalScreens()));
                  },
                  leading: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.medical_information, color: Colors.red,),
                  ),
                  title: Text(markerData[index].title) ,
                  subtitle: Text(markerData[index].description),
                  trailing: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: (){},
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

}
class maarker{
  final String title;
  final String description;
  maarker(this.title,this.description);
}
List<maarker> markerData=[
  maarker('Mukund Hospital', 'Marol Naka Metro Line 3 Station, Mukund nagar society Andheri-kurla road, near airport road, Mumbai, Maharashtra 400059'),
  maarker('Cooper Hospital', 'JVPD Scheme, Vile Parle West, Mumbai, Maharashtra 400056'),
  maarker('Leelavati hospital', 'Ranwar, Bandra West, Mumbai, Maharashtra 400050'),
  maarker('BhaktiVedanta Hospital', 'Bhaktivedanta Swami Marg, Sector 6, Sector 1, Srishti Complex, Mira Road East, Mira Bhayandar, Maharashtra 401107'),
  maarker('Wockhardt hospital', 'Agripada, Mumbai, Maharashtra 400011'),
  maarker('ROTTO SOTTO', 'New Building, ROTTO-SOTTO Office, 7th Floor KEM Hospital, Parel, Mumbai, Maharashtra 400012'),
];