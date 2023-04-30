
import 'package:alarm/alarm.dart';
import 'package:douaa_project/aujourdhui_med.dart';
import 'package:douaa_project/aujourdhui_ren.dart';
import 'package:douaa_project/exp.dart';
import 'package:douaa_project/menu.dart';
import 'package:douaa_project/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'inscription.dart';
import 'package:flutter/material.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Alarm.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: menu());
  }
}