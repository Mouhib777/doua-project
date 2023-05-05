import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'detail_rend.dart';

extension DateTimeExtension on DateTime {}

class aujourdhui_ren extends StatefulWidget {
  final String docid;
  late List<Map<String, dynamic>> eventDataList;
  DateTime? today;
  aujourdhui_ren({
    required this.eventDataList,
    required this.docid,
    this.today,
    Key? key,
  }) : super(key: key);

  @override
  State<aujourdhui_ren> createState() => _aujourdhui_renState();
}

class _aujourdhui_renState extends State<aujourdhui_ren> {
  late Map<String, dynamic> eventData;
  late String docid;
  DateTime aujourdhui = DateTime.now();
  @override
  void initState() {
    super.initState();
    widget.eventDataList = [];
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('r').get();
      setState(() {
        if (widget.today == null) {
          widget.eventDataList = querySnapshot.docs
              .map((doc) => {
                    ...doc.data() as Map<String, dynamic>,
                    'docid': doc.id, // Ajouter l'ID du document à la map
                  })
              .toList();
        } else {
          // List<Item> filteredItems = items.where((item) => item.date == date).toList();

        }
      });
      if (widget.eventDataList.isNotEmpty) {
        docid = widget.eventDataList[0][
            'docid']; // Initialiser la variable docId avec l'ID du premier élément de la liste
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: widget.eventDataList.length,
                itemBuilder: (context, index) {
                  final item = widget.eventDataList[index];
                  docid = item['docId'] ?? '';
                  return Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detail_rend(
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
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Dr.${item['nomMedecin']}",
                                          style: TextStyle(
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'BreeSerif-Regular',
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: AssetImage(
                                            "assets/images/doctor.jpg"),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.timer,
                                        size: 20,
                                        color: noire2,
                                      ),
                                      Text(
                                        "${item['time']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: green2,
                                            letterSpacing: 3),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Icon(
                                        Icons.date_range,
                                        size: 20,
                                        color: noire2,
                                      ),
                                      Text(
                                        "${item['date']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: green2,
                                            letterSpacing: 3),
                                      ),
                                    ],
                                  ),
                                ],
                              ))),
                    )
                  ]);
                })));
  }
}
