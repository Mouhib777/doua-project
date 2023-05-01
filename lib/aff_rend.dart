
import 'package:douaa_project/passer.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'venir_ren.dart';

class aff_rend extends StatefulWidget {
  @override
  State<aff_rend> createState() => _aff_rendState();
}

class _aff_rendState extends State<aff_rend> {
  late DocumentReference docRef;
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: blue,
          backgroundColor: Color.fromRGBO(211, 144, 216, 0.933),
          title: Text(
            "Mes rendez-vous",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          bottom: TabBar(
              indicatorColor: noire1,
              indicatorPadding: EdgeInsets.all(5),
              tabs: [
                Tab(
                  child: Text(
                    "A venir",
                    style: TextStyle(
                        color: noire1,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Tab(
                  child: Text(
                    "Passer",
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
          venir_ren(
            docid: "docRef.id",
            eventDataList: [],
          ),
          passer(docid: 'docRef.id',eventDataList: [],)
        ]),
      ),
    );
  }
}



