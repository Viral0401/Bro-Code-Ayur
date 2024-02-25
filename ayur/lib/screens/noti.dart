import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Noti{
  static Future initialize(FlutterLocalNotificationsPlugin flutterlocalnotificationsplugin) async{
    var androidInitialize=new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationsSettings=new InitializationSettings(android: androidInitialize);
    await flutterlocalnotificationsplugin.initialize(initializationsSettings);
}

  static Future showBigTextNotification({var id =0, required String title, required String body, var payload, required FlutterLocalNotificationsPlugin fln
  })
  async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    new AndroidNotificationDetails(
      'medex',
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notifications'),
      importance: Importance.max,
      priority: Priority.high,
    );
// AndroidNotificationDetails
    var not= NotificationDetails(android: androidPlatformChannelSpecifics,
    );
// NotificationDetails
    await fln.show(0, title, body, not );
  }




}