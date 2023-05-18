import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';

import 'package:flutter/material.dart';

import 'ResPage.dart';
import 'TodayPage.dart';
import 'TraitPage.dart';
import 'aff_c.dart';
import 'aff_med.dart';
import 'aff_rend.dart';
import 'auj.dart';
import 'for_c.dart';

class menu extends StatefulWidget {
  menu({Key? key}) : super(key: key);
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    TodayPage(),
  ];
  late List<Map<String, dynamic>> eventDataList;
  @override
  void initState() {
    super.initState();
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('r').get();
      setState(() {
        eventDataList = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (error) {
      print("erreur");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Une erreur s'est produite")),
      // );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(224, 1, 54, 32),
          iconSize: 30,
          unselectedItemColor: Color.fromARGB(255, 11, 11, 11),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: Color.fromRGBO(180, 138, 205, 0.945),
          items: [
            const BottomNavigationBarItem(
                label: " Aujourd'hui",
                icon: Icon(
                  Icons.notifications_active,
                  color: Color.fromARGB(255, 49, 26, 77),
                )),
            const BottomNavigationBarItem(
                label: "Controle des symptomes",
                icon: Icon(Icons.face, color: Color.fromARGB(255, 49, 26, 77))),
            BottomNavigationBarItem(
                label: "Réseau",
                icon: Icon(Icons.medical_services,
                    color: Color.fromARGB(255, 49, 26, 77))),
            BottomNavigationBarItem(
                label: "Traitement",
                icon: Icon(Icons.assignment,
                    color: Color.fromARGB(255, 49, 26, 77))),
          ],
        ),
        body: getCurrentPage(currentIndex));
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/aa.png"), fit: BoxFit.cover),
      ),
    );
  }

  Widget getCurrentPage(int index) {
    switch (index) {
      case 0:
        return auj();
      case 1:
        return contr();
      case 2:
        return aff_rend();
      case 3:
        return aff_med(
          docId: 'id',
          eventDataList1: [],
        );
      default:
        return Container();
    }
  }
}

class contr extends StatefulWidget {
  @override
  State<contr> createState() => _contrState();
}

class _contrState extends State<contr> {
  late String docId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              shadowColor: blue,
              backgroundColor: Color.fromRGBO(211, 144, 216, 0.933),
              title: Text(
                "Controle des symptomes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              bottom: TabBar(
                  indicatorColor: noire1,
                  indicatorPadding: EdgeInsets.all(5),
                  tabs: [
                    Tab(
                      child: Text(
                        "Accueil",
                        style: TextStyle(
                            color: noire1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Liste",
                        style: TextStyle(
                            color: noire1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  ]),
            ),
            body: TabBarView(children: [
              for_c(),
              aff_c(docid: '', eventDataList1: [],
               
              ),
            ])));
  }
}
