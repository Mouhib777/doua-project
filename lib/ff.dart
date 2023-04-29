import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'ResPage.dart';
import 'detail_rend.dart';
import 'for_ren.dart';

class pp extends StatefulWidget {
  final String docid;
  late List<Map<String, dynamic>> eventDataList;

  pp({
    required this.eventDataList,
    required this.docid,
    Key? key,
  }) : super(key: key);

  @override
  State<pp> createState() => _ppState();
}

class _ppState extends State<pp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late Map<String, dynamic> eventData;
  late String docid;
  @override
  void initState() {
    super.initState();
    widget.eventDataList = [];
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _getEventDataList();
  }

  Future<void> _scheduleNotification(DateTime dateTime) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Notification title',
        'Notification body',
        tz.TZDateTime.from(dateTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> _deleteDocument(String docid) async {
    try {
      await FirebaseFirestore.instance.collection("r").doc(docid).delete();
      setState(() {
        widget.eventDataList.removeWhere((item) => item["docid"] == docid);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le document a été supprimé')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  Future<void> _updateDocument(
      String docId, Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection("r")
          .doc(docId)
          .update(newData);
      setState(() {
        widget.eventDataList = widget.eventDataList.map((item) {
          if (item["docid"] == docId) {
            return {...item, ...newData};
          } else {
            return item;
          }
        }).toList();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le document a été mis à jour')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('r').get();
      setState(() {
        widget.eventDataList = querySnapshot.docs
            .map((doc) => {
                  ...doc.data() as Map<String, dynamic>,
                  'docid': doc.id, // Ajouter l'ID du document à la map
                })
            .toList();
      });
      if (widget.eventDataList.isNotEmpty) {
        docid = widget.eventDataList[0][
            'docid']; // Initialiser la variable docId avec l'ID du premier élément de la liste
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            widget.eventDataList == null || widget.eventDataList.isEmpty
                ? null
                : Container(
                    width: 300,
                    height: 40,
                    child: FloatingActionButton(
                      backgroundColor: gris,
                      shape: RoundedRectangleBorder(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => for_ren()));
                      },
                      child: Text(
                        "Ajouter un rendez-vous",
                        style: TextStyle(
                            color: green2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
        body: widget.eventDataList == null || widget.eventDataList.isEmpty
            ? ResPage()
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromRGBO(167, 125, 202, 1),
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                ),
                child: ListView.builder(
                    itemCount: widget.eventDataList.length,
                    itemBuilder: (context, index) {
                      final item = widget.eventDataList[index];
                      docid = item['docId'] ?? '';
                      return Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detail_rend(
                                  medicineData: item,
                                ),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(239, 240, 249, 0.438),
                              ),
                              width: 363,
                              height: 160,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Dr.${item['nomMedecin']}",
                                              style: TextStyle(
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 24,
                                            backgroundImage:
                                                AssetImage("image/doctor.jpg"),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Icon(
                                            Icons.timer,
                                            size: 20,
                                            color: noire2,
                                          ),
                                          Text(
                                            "${item['time']}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: green2,
                                                letterSpacing: 3),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(
                                            Icons.date_range,
                                            size: 20,
                                            color: noire2,
                                          ),
                                          Text(
                                            "${item['date']}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: green2,
                                                letterSpacing: 3),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 170,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  // Show a form for the user to enter the new data
                                                  return AlertDialog(
                                                    title: Text('Modifier'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Text('Annuler'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child:
                                                            Text('Confirmer'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Modifier",
                                              style: TextStyle(
                                                  fontSize: 17, color: green2),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: gris,
                                              padding: EdgeInsets.only(
                                                  top: 1,
                                                  bottom: 1,
                                                  left: 10,
                                                  right: 10),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Supprimer'),
                                                    content: Text(
                                                      'Voulez-vous vraiment supprimer ce medicament ?',
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Text('Annuler'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          _deleteDocument(
                                                              item['docid']);
                                                        },
                                                        child:
                                                            Text('Supprimer'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Supprimer",
                                              style: TextStyle(
                                                  fontSize: 15, color: red2),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: gris,
                                              padding: EdgeInsets.only(
                                                  top: 1,
                                                  bottom: 1,
                                                  left: 10,
                                                  right: 10),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ))),
                        )
                      ]);
                    })));
  }
}
