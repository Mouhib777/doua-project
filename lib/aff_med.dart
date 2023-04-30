
import 'package:douaa_project/modifier_med.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'TraitPage.dart';
import 'detail_med.dart';
import 'for_med.dart';

class aff_med extends StatefulWidget {
  final String docId;
  late List<Map<String, dynamic>> eventDataList1;
  aff_med({
    required this.eventDataList1,
    required this.docId,
    Key? key,
  }) : super(key: key);

  @override
  State<aff_med> createState() => _aff_medState();
}

class _aff_medState extends State<aff_med> {
  late Map<String, dynamic> eventData;
  late String docId;
  @override
  void initState() {
    super.initState();
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('u1').get();
      setState(() {
        widget.eventDataList1 = querySnapshot.docs
            .map((doc) => {
                  ...doc.data() as Map<String, dynamic>,
                  'docId': doc.id, // Ajouter l'ID du document à la map
                })
            .toList();
      });
      if (widget.eventDataList1.isNotEmpty) {
        docId = widget.eventDataList1[0][
            'docId']; // Initialiser la variable docId avec l'ID du premier élément de la liste
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  Future<void> _deleteDocument(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("u1").doc(docId).delete();
      setState(() {
        widget.eventDataList1.removeWhere((item) => item["docId"] == docId);
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.eventDataList1 == null || widget.eventDataList1.isEmpty
            ? null
            : AppBar(
                backgroundColor: Color.fromARGB(76, 249, 64, 255),
                title: const Text('Traitement'),
              ),
        floatingActionButton:
            widget.eventDataList1 == null || widget.eventDataList1.isEmpty
                ? null
                : Container(
                    margin: EdgeInsets.only(right: 30),
                    width: 300,
                    height: 40,
                    child: FloatingActionButton(
                      backgroundColor: gris,
                      shape: RoundedRectangleBorder(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => for_med()));
                      },
                      child: Text(
                        "Ajouter un médicament",
                        style: TextStyle(
                            color: mauve2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
        body: widget.eventDataList1 == null || widget.eventDataList1.isEmpty
            ? TraitPage()
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromRGBO(167, 125, 202, 1)
                  ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
                ),
                child: ListView.builder(
                    itemCount: widget.eventDataList1.length,
                    itemBuilder: (context, index) {
                      final item = widget.eventDataList1[index];
                      docId = item['docId'] ?? '';
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detail_med(
                                    medicineData: item,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 370,
                              height: 180,
                              margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(162, 255, 255, 255),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(117, 232, 197, 242),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 57,
                                          width: 9,
                                        ),
                                        CircleAvatar(
                                          radius: 22,
                                          backgroundImage:
                                              AssetImage("image/m.jpg"),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "${item['nomMed']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(172, 0, 0, 0),
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'BreeSerif-Regular'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${item['prd']}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 2,
                                              color: blue),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${item['horaireMed']}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: green2,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 9,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 160),
                                          child: Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        modifier_med(
                                                            docId:
                                                                item['docId'],
                                                            eventDataList:
                                                                item)),
                                              );},
                                                child: Text(
                                                  "Modifier",
                                                  style: TextStyle(
                                                      color: green1,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: gris,
                                                    padding: EdgeInsets.only(
                                                        top: 10,
                                                        bottom: 10,
                                                        left: 10,
                                                        right: 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    elevation: 20),
                                              ),
                                              SizedBox(width: 4),
                                              ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Supprimer'),
                                                        content: Text(
                                                          'Voulez-vous vraiment supprimer ce medicament ?',
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child:
                                                                Text('Annuler'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              _deleteDocument(
                                                                  item[
                                                                      'docId']);
                                                            },
                                                            child: Text(
                                                                'Supprimer'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  "Supprimer",
                                                  style: TextStyle(
                                                      color: red1,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: gris,
                                                    padding: EdgeInsets.only(
                                                        top: 10,
                                                        bottom: 10,
                                                        left: 10,
                                                        right: 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    elevation: 20),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ));
  }
}
