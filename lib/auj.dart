import 'package:animate_do/animate_do.dart';
import 'package:douaa_project/TodayPage.dart';
import 'package:douaa_project/aujourdhui_med.dart';
import 'package:douaa_project/aujourdhui_ren.dart';
import 'package:douaa_project/inscription.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login/login_view.dart';

class auj extends StatefulWidget {
  late List<Map<String, dynamic>> eventDataList;
  auj({
    Key? key,
  }) : super(key: key);
  @override
  State<auj> createState() => _aujState();
}

class _aujState extends State<auj> {
  @override
  void initState() {
    widget.eventDataList = [];
    super.initState();
  }

  void getUser() {
    var user = FirebaseAuth.instance.currentUser;
    String? displayName = user?.displayName;
    String? email = user?.email;
  }

  DateTime today = DateTime.now();
  Widget build(BuildContext context) {
    bool isToday = false;

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                    FirebaseAuth.instance.currentUser?.displayName ?? '',
                    style:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                accountEmail: Text(
                  FirebaseAuth.instance.currentUser?.email ?? '',
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
                      "Salut",
                      style: TextStyle(
                        color: red1,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'BreeSerif-Regular',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName ?? '',
                    style: TextStyle(
                      color: red1,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'BreeSerif-Regular',
                    ),
                  )
                ]),
                SizedBox(
                  height: 70,
                ),
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                          Row(
                            children: [
                              Container(
                                  width: 380,
                                  height: 120,
                                  child: aujourdhui_med()),
                            ],
                          ),
                        ]))),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 500,
                        height: 200,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(right: 320),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/pp.PNG"),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 380,
                                  height: 120,
                                  child: aujourdhui_ren(
                                    docid: '',
                                    today: today,
                                    eventDataList: [],
                                  )),
                            ],
                          ),
                        ])))
              ])),
        ));
  }
}
