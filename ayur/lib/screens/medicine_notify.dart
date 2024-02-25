import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'noti.dart';
class MedicineNotify extends StatefulWidget {
  const MedicineNotify({super.key});

  @override
  State<MedicineNotify> createState() => _MedicineNotifyState();
}

class _MedicineNotifyState extends State<MedicineNotify> {
  void initState(){
    Noti.initialize(flutterLocalNotificationsPlugin);
    super.initState();
  }
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("click"),
        onPressed: (){
          Noti.showBigTextNotification(title: "Message Title", body: "Your body", fln: flutterLocalNotificationsPlugin);
        },
      ),
    );
  }
}

