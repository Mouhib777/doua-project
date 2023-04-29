
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

class detail_med extends StatefulWidget {
  final Map<String, dynamic> medicineData;

  detail_med({required this.medicineData});

  @override
  _MedicineDetailsPageState createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<detail_med> {
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
                  Center(
                    child: Image.asset(
                      'image/ss.jpg',
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nom du médicament :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['nomMed']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Forme pharmaceutique:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['formeMed']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "voie d’administration :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['voieMed']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Date de début:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['dateDebMed']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Durée du medicament :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['dureMed']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Periode de la prise:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          '${widget.medicineData['prd']}',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'BreeSerif-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Horaire de la prise:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: red1,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '${widget.medicineData['horaireMed']}',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'BreeSerif-Regular',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
