import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _showAlarmNotification() async {
    var androidDetails = AndroidNotificationDetails('channel_id', 'Alarm',
        // pr: Importance.max,
        priority: Priority.high,
        ongoing:
            true, // set ongoing to true to keep notification in the tray until it's dismissed
        autoCancel:
            false // set autoCancel to false to keep notification even when user taps on it
        );

    var platformDetails = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Alarm',
      'Wake up!',
      platformDetails,
      payload: 'Alarm',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Alarm Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Set Alarm'),
          onPressed: () {
            _showAlarmNotification();
          },
        ),
      ),
    );
  }
}
