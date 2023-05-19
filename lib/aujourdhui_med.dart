import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class aujourdhui_med extends StatefulWidget {
  const aujourdhui_med({super.key});

  @override
  State<aujourdhui_med> createState() => _aujourdhui_medState();
}

class _aujourdhui_medState extends State<aujourdhui_med> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos medicament pour aujourd'hui"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('u1').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("tu n'as pas de medicament aujourd'hui"),
            );
          }
          if (snapshot.data.docs.length == 0) {
            return Center(
              child: Text("tu n'as pas de medicament aujourd'hui"),
            );
          }

          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 30),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var docId = snapshot.data.docs[index].id;
              // DateTime currentDate = DateTime.now();
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('u1')
                    .doc(docId)
                    .get(),
                builder: (context, AsyncSnapshot asyncSnapshot) {
                  var med = asyncSnapshot.data;
                  DateTime currentDate = DateTime.now();
                  Timestamp timestamp = med['dureeDet_jour'];
                  DateTime dateToCheck = timestamp.toDate();

                  if (asyncSnapshot.hasData) {
                    if (dateToCheck.year == currentDate.year &&
                        dateToCheck.month == currentDate.month &&
                        dateToCheck.day == currentDate.day) {
                      var messages =
                          "${med['dose']} de ${med['nomMed']} pour ajourd'hui";

                      return Center(
                        child: Text(
                            "${med['dose']} de ${med['nomMed']} pour ajourd'hui"),
                      );
                    }
                  } else if (asyncSnapshot.hasData) {
                    if (dateToCheck.year != currentDate.year &&
                        dateToCheck.month != currentDate.month &&
                        dateToCheck.day != currentDate.day) {
                      return Center(
                        child: Text("tu n'as pas de medicament aujourdhui"),
                      );
                    }
                  }
                  return Center(child: Text(""));
                },
              );
            },
          );
        },
      ),
    );
  }
}
