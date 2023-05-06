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
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('u1').get();
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
        String? dateTime = item['dureeDet_jour'];
        if (dateTime != null && dateTime.isNotEmpty) {
          DateTime itemDate;
          if (dateTime.contains('/')) {
            // Date est au format dd/MM/yyyy
            itemDate = DateFormat('MMM d, y h:mm a').parse(dateTime);
          } else {
            // Date est au format yyyy-MM-dd
            itemDate = DateTime.parse(dateTime);
          }
          // Comparer la date de l'élément avec la date d'aujourd'hui
          DateTime today = DateTime.now();
          return itemDate.year == today.year &&
              itemDate.month == today.month &&
              itemDate.day == today.day;
        }
        return false;
      }).toList();
      // Initialiser la variable docId avec l'ID du premier élément de la liste filtrée
      if (widget.eventDataList1.isNotEmpty) {
        docId = widget.eventDataList1[0]['docId'];
      }
    }
  });
} catch (error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Une erreur s\'est produite $error')),
  );
}

}


  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView.builder(
          itemCount: widget.eventDataList1.length,
          itemBuilder: (context, index) {
            final item = widget.eventDataList1[index];
            docId = item['docId'] ?? '';
            
      //         if (item['dureeindet'] != null) {
      //           DateTime itemDate;
      //        if (item['dureeindet'].contains('/')) {
      //   // Date est au format dd/MM/yyyy
      //   itemDate = DateFormat('yyyy-MM-dd').parse(item['dureeindet']);
      // } else {
      //   // Date est au format yyyy-MM-dd
      //   itemDate = DateTime.parse(item['dureeindet']);
      // }

      // if (itemDate.year == widget.today!.year &&
      //     itemDate.month == widget.today!.month &&
      //     itemDate.day == widget.today!.day) {
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
                                "${item['formeMed']}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                    color: blue),
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
}));}}
    
  

