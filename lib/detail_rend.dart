
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detail_rend extends StatefulWidget {
  final Map<String, dynamic> medicineData;

  detail_rend({required this.medicineData});

  @override
  _MedicineDetailsPageState createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<detail_rend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mauve1,
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'DR.${widget.medicineData['nomMedecin']}',
                    style: TextStyle(
                      color: Color.fromARGB(193, 100, 47, 131),
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'BreeSerif-Regular',
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Center(
                    child: Image.asset(
                      'image/doctor.jpg',
                      fit: BoxFit.cover,
                      height: 230,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 240),
                    child: ElevatedButton(
                      onPressed: () =>
                          launch('tel:${widget.medicineData['numMedecin']}'),
                      child: Text(
                        "Appeler",
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 40, right: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android,
                              size: 20,
                              color: Color.fromARGB(255, 56, 56, 237),
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Numero du medecin:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 237),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              '${widget.medicineData['numMedecin']}',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'BreeSerif-Regular',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 56, 56, 237),
                            ),
                            SizedBox(width: 6),
                            Text(
                              "date de rendez_vous:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 237),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              '${widget.medicineData['date']}',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'BreeSerif-Regular',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              size: 20,
                              color: Color.fromARGB(255, 56, 56, 237),
                            ),
                            SizedBox(width: 6),
                            Text(
                              "l'heure de rendez-vous:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 237),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              '${widget.medicineData['time']}',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'BreeSerif-Regular',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              size: 20,
                              color: Color.fromARGB(255, 56, 56, 237),
                            ),
                            SizedBox(width: 6),
                            Text(
                              "rappel :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 237),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              '${widget.medicineData['rappelPersonnalis']}',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'BreeSerif-Regular',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
