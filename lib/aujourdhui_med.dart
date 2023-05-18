import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'detail_med.dart';

class aujourdhui_med extends StatefulWidget {
  final String docId;
  late List<Map<String, dynamic>> eventDataList1;
 DateTime? today;

  aujourdhui_med({
    required this.eventDataList1,
    required this.docId,
    required this.today,
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
    widget.eventDataList1 = [];
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('u1 ').get();
      setState(() {
        widget.eventDataList1 = querySnapshot.docs
            .map((doc) => {
                  ...doc.data() as Map<String, dynamic>,
                  'docId': doc.id, // Ajouter l'ID du document à la map
                })
            .toList();
        // Vérifier si la date d'aujourd'hui est spécifiée
        if (widget.today != null) {
          // Filtrer les éléments pour ne garder que ceux qui ont une date égale à la date d'aujourd'hui
          widget.eventDataList1 = widget.eventDataList1.where((item) {
            String? dureeDet_jour = item['date'];
            if (dureeDet_jour != null && dureeDet_jour.isNotEmpty) {
              DateTime itemDate;
              if (dureeDet_jour.contains('/')) {
                // Date est au format dd/MM/yyyy
                itemDate = DateFormat('dd/MM/yyyy').parse(dureeDet_jour);
              } else {
                // Date est au format yyyy-MM-dd
                itemDate = DateTime.parse(dureeDet_jour);
              }
              // Comparer la date de l'élément avec la date d'aujourd'hui
              return itemDate.year == widget.today!.year &&
                  itemDate.month == widget.today!.month &&
                  itemDate.day == widget.today!.day;
            }
            return false;
          }).toList();
        }
        // Initialiser la variable docId avec l'ID du premier élément de la liste filtrée
        if (widget.eventDataList1.isNotEmpty) {
          docId = widget.eventDataList1[0]['docId'];
        }
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.eventDataList1.map((item) {
            return Padding(
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 363 + 10, // Ajout d'un espace de 10 pixels
                child: InkWell(
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(239, 240, 249, 0.438),
                    ),
                    width: 363,
                    height: 160,
                    child: Padding(
                                           padding: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage("assets/images/m.jpg"),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${item['nomMed']}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(172, 0, 0, 0),
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'BreeSerif-Regular',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "${item['formeMed']}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                    color: blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

