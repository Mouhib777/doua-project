import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Notif{
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async{
   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,);
     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  static Future showBigTextNotification({var id = 0, required String title , required String body,
  var playload, required FlutterLocalNotificationsPlugin fln})async{
    AndroidNotificationDetails androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'douuaa',
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('alarm'),
      importance: Importance.max,
      priority: Priority.high
    );
    var not= NotificationDetails(android: androidPlatformChannelSpecifics );
    await fln.show(0, title, body, not);
  }
}