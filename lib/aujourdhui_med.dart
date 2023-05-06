import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'detail_med.dart';

class aujourdhui_med extends StatefulWidget {
  final String docId;
  DateTime? today;
  late List<Map<String, dynamic>> eventDataList1;
  aujourdhui_med({
    required this.eventDataList1,
    required this.docId,
    DateTime? today,
    Key? key,
  }) : super(key: key);

  @override
  State<aujourdhui_med> createState() => _aujourdhui_medState();
}

class _aujourdhui_medState extends State<aujourdhui_med> {
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
        if (widget.eventDataList1.isNotEmpty) {
          docId = widget.eventDataList1[0][
              'docId']; // Initialiser la variable docId avec l'ID du premier élément de la liste
        }
        if (widget.today != null) {
          widget.eventDataList1 = widget.eventDataList1.where((item) {
            DateTime itemDate =
                DateFormat('M/d/y').parse(item['dureeDet_jour']);
            DateTime currentDate = DateTime.now();
            String itemDateString = DateFormat('MM-dd-yyyy').format(itemDate);
            String currentDateString =
                DateFormat('MM-dd-yyyy').format(currentDate);
            return itemDateString == currentDateString ||
                item['dureeIndet'].isNotEmpty;
          }).toList();
        }
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                                    AssetImage("assets/images/m.jpg"),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${item['nomMed']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(172, 0, 0, 0),
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
