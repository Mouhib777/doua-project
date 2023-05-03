import 'package:douaa_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart';

import 'alarmService.dart';

class testt extends StatefulWidget {
  const testt({super.key});

  @override
  State<testt> createState() => _testtState();
}

class _testtState extends State<testt> {
  FlutterLocalNotificationsPlugin? get flutterLocalNotificationsPlugin => null;

  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: 200,
          height: 80,
          child: ElevatedButton(
            onPressed: () {
              Notif.showBigTextNotification(
                  title: "Message",
                  body: "body",
                  fln: flutterLocalNotificationsPlugin!);
            },
            child: Text('click'),
          ),
        ),
      ),
    );
  }
}
