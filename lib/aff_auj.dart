import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

class aff_auj extends StatefulWidget {
  const aff_auj({super.key});

  @override
  State<aff_auj> createState() => _aff_aujState();
}

// ignore: camel_case_types
class _aff_aujState extends State<aff_auj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromRGBO(167, 125, 202, 1),
              ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 30, 18, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 300),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/dd.jpg"),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: 340,
                            height: 120,
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                    width: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Image.asset(
                                      "assets/images/m.jpg",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const Text(
                                      "Cetamol",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: green2,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'BreeSerif-Regular'),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 40),
                                    child: Image.asset(
                                      "assets/images/images.jpg",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "10:00 et 20:00",
                                    style: TextStyle(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        letterSpacing: 4),
                                  ),
                                ],
                              )
                            ])),
                        Container(
                            width: 340,
                            height: 120,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                    width: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Image.asset(
                                      "assets/images/m.jpg",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const Text(
                                      "Cetamol",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: green2,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'BreeSerif-Regular'),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 100),
                                    child: Image.asset(
                                      "assets/images/images.jpg",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "10:00 ",
                                    style: TextStyle(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        letterSpacing: 4),
                                  ),
                                ],
                              )
                            ])),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: 340,
                            height: 120,
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                    width: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Image.asset(
                                      "assets/images/doctor.jpg",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const Text(
                                      "Dr.Douaa benslimen",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: green2,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'BreeSerif-Regular'),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 40),
                                    child: Image.asset(
                                      "assets/images/images.jpg",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "10:00 ",
                                    style: TextStyle(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        letterSpacing: 4),
                                  ),
                                ],
                              )
                            ])),
                      ])),
            )));
  }
}
