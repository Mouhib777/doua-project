import 'package:animate_do/animate_do.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login/login_view.dart';

class auj extends StatefulWidget {
  auj({
    Key? key,
  }) : super(key: key);
  @override
  State<auj> createState() => _aujState();
}

class _aujState extends State<auj> {
  List<Map<String, dynamic>>? eventDataList;
  late List<Map<String, dynamic>> _todayEvents = [];
  @override
  void initState() {
    super.initState();
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    // récupération des données de la base de données ou d'un autre endroit
    setState(() {
      // filtrer les événements par rapport à la date d'aujourd'hui
      _todayEvents = eventDataList!
          .where((event) =>
              event['date'] == DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    bool isToday = false;

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Benslimen douaa",
                    style:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                accountEmail: Text(
                  "Benslimendouaa2002@gmail.com",
                  style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      224, 155, 101, 164), // couleur de fond souhaitée
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                title: Text(
                  "Mon compte",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.account_box_rounded,
                  color: mauve2,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Paramètres",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.settings,
                  color: mauve2,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Contacter nous",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.contact_mail_sharp,
                  color: mauve2,
                ),
                onTap: () async {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: 'benslimendouaa2002@gmail.com',
                    query: 'subject=Feedback sur l\'application&body=Bonjour,',
                  );
                  String url = params.toString();
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Déconnexion",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: mauve2,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginView();
                  }));
                },
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 247, 234, 254),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(76, 249, 64, 255),
          title: const Text("Aujourd'hui"),
        ),
        body: FadeInUpBig(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(250, 247, 254, 1),
                  Color.fromARGB(255, 225, 197, 255),
                ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
              ),
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(
                      "Bonjour",
                      style: TextStyle(
                        color: red1,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'BreeSerif-Regular',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          color: gris,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 205, 249),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        width: 500,
                        height: 200,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(right: 320),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundImage:
                                  AssetImage("assets/images/doc.jpg"),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 250,
                                  height: 100,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: mauve1,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Dr.douaa",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: red1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            letterSpacing: 2),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundImage: AssetImage(
                                                  "assets/images/images.jpg"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("8:00"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]))),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          color: gris,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 205, 249),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        width: 500,
                        height: 200,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(right: 320),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundImage:
                                  AssetImage("assets/images/pp.PNG"),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: mauve1,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Adole",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: red1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            letterSpacing: 2),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundImage: AssetImage(
                                                  "assets/images/images.jpg"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("8:00"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 100,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: mauve1,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Adole",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: red1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            letterSpacing: 2),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundImage: AssetImage(
                                                  "assets/images/images.jpg"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("8:00"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])))
              ])),
        ));
  }
}
