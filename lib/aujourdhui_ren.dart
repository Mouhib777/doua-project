import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class aujourdhui_ren extends StatefulWidget {
  const aujourdhui_ren({super.key});

  @override
  State<aujourdhui_ren> createState() => _aujourdhui_renState();
}

class _aujourdhui_renState extends State<aujourdhui_ren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rendez vous ajourd'hui"),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('r').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("famesh rendez-vous"),
                );
              }
              if (snapshot.data.docs.length < 1) {
                return Center(
                  child: Text("mizelt makhdhyt hata rendez-vous"),
                );
              }
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 30,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var docId = snapshot.data.docs[index].id;
                  return FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('r')
                        .doc(docId)
                        .get(),
                    builder: (context, AsyncSnapshot asyncsnapshot) {
                      var rend = asyncsnapshot.data;
                      DateTime currentDate = DateTime.now();
                      Timestamp timestamp = rend['datee'];
                      DateTime dateToCheck = timestamp.toDate();
                      if (asyncsnapshot.hasData) {
                        if (dateToCheck.year == currentDate.year &&
                            dateToCheck.month == currentDate.month &&
                            dateToCheck.day == currentDate.day) {
                          return Center(
                            child: Text(
                                "rendez-vous à ${rend['date']} chez Dr ${rend['nomMedecin']} "),
                          );
                        }
                      }
                      return Center(
                        child: Text("pas de rendez-vous aujourd'hui"),
                      );
                    },
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
