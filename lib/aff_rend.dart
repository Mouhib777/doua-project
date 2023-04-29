
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ff.dart';

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
          pp(
            docid: "docRef.id",
            eventDataList: [],
          ),
          passer()
        ]),
      ),
    );
  }
}

class venir extends StatefulWidget {
  const venir({required this.docId, Key? key}) : super(key: key);

  final String docId;

  @override
  State<venir> createState() => _venirState();
}

class _venirState extends State<venir> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 300,
          height: 40,
          child: FloatingActionButton(
            backgroundColor: gris,
            shape: RoundedRectangleBorder(),
            onPressed: () {},
            child: Text(
              "Ajouter un rendez-vous",
              style: TextStyle(
                  color: green2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromRGBO(167, 125, 202, 1)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 50),
                _isVisible
                    ? Container(
                        color: Color.fromRGBO(218, 201, 234, 0),
                        width: 363,
                        height: 120,
                        child: Row(
                          children: [
                            Container(
                              width: 78,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: gris,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Mardi",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: green2,
                                        letterSpacing: 3),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: red1,
                                        letterSpacing: 3),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "12:00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: green2,
                                        letterSpacing: 3),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundImage:
                                          AssetImage("image/doctor.jpg"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Dr.",
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: noire2),
                                        ),
                                        Text(
                                          "hhhh",
                                          style: TextStyle(
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'BreeSerif-Regular',
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
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
                                            left: 22,
                                            right: 22),
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
                                        setState(() {
                                          _isVisible = false;
                                        });
                                      },
                                      child: Text(
                                        "Supprimer",
                                        style: TextStyle(
                                            fontSize: 17, color: red2),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: gris,
                                        padding: EdgeInsets.only(
                                            top: 1,
                                            bottom: 1,
                                            left: 22,
                                            right: 22),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 31,
                      ),
                Container(
                  color: Color.fromRGBO(218, 201, 234, 0),
                  width: 363,
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 78,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gris,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mardi",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: red1,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "12:00",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage("image/doctor.jpg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Dr.",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: noire2),
                                  ),
                                  Text(
                                    "Douaa Benslimen",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'BreeSerif-Regular',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Modifier",
                                  style: TextStyle(fontSize: 17, color: green2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: gris,
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Supprimer",
                                  style: TextStyle(fontSize: 17, color: red2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(184, 231, 228, 228),
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 31,
                ),
                Container(
                  color: Color.fromRGBO(218, 201, 234, 0),
                  width: 363,
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 78,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gris,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mardi",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: red1,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "12:00",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage("image/doctor.jpg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Dr.",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: noire2),
                                  ),
                                  Text(
                                    "Douaa Benslimen",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'BreeSerif-Regular',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Modifier",
                                  style: TextStyle(fontSize: 17, color: green2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: gris,
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Supprimer",
                                  style: TextStyle(fontSize: 17, color: red2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: gris,
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 31,
                ),
                Container(
                  color: Color.fromRGBO(218, 201, 234, 0),
                  width: 363,
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 78,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gris,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mardi",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: red1,
                                  letterSpacing: 3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "12:00",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: green2,
                                  letterSpacing: 3),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage("image/doctor.jpg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Dr.",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: noire2),
                                  ),
                                  Text(
                                    "Douaa Benslimen",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'BreeSerif-Regular',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Modifier",
                                  style: TextStyle(fontSize: 17, color: green2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: gris,
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Supprimer",
                                  style: TextStyle(fontSize: 17, color: red2),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: gris,
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 22, right: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class passer extends StatefulWidget {
  const passer({super.key});

  @override
  State<passer> createState() => _passerState();
}

class _passerState extends State<passer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromRGBO(167, 125, 202, 1)
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              color: Color.fromRGBO(218, 201, 234, 0),
              width: 363,
              height: 120,
              child: Row(
                children: [
                  Container(
                    width: 78,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: gris,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mardi",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green2,
                              letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: red1,
                              letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "12:00",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green2,
                              letterSpacing: 3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage("image/doctor.jpg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Dr.",
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: noire2),
                              ),
                              Text(
                                "Douaa Benslimen",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'BreeSerif-Regular',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Supprimer",
                              style: TextStyle(fontSize: 17, color: red2),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gris,
                              padding: EdgeInsets.only(
                                  top: 1, bottom: 1, left: 22, right: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Container(
              color: Color.fromRGBO(218, 201, 234, 0),
              width: 363,
              height: 120,
              child: Row(
                children: [
                  Container(
                    width: 78,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(153, 231, 226, 226),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mardi",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green2,
                              letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: red1,
                              letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "12:00",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green2,
                              letterSpacing: 3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage("image/doctor.jpg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Dr.",
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: noire2),
                              ),
                              Text(
                                "Douaa Benslimen",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'BreeSerif-Regular',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Supprimer",
                              style: TextStyle(fontSize: 17, color: red2),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gris,
                              padding: EdgeInsets.only(
                                  top: 1, bottom: 1, left: 22, right: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
