import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

class aff_c extends StatefulWidget {
  final String docid;
  late List<Map<String, dynamic>> eventDataList1;

  aff_c({
    required this.eventDataList1,
    Key? key,
    required this.docid,
  }) : super(key: key);

  @override
  State<aff_c> createState() => _aff_cState();
}

class _aff_cState extends State<aff_c> {
  late Map<String, dynamic> eventData1;
  late String docId = '';
  @override
  void initState() {
    super.initState();
    _getEventDataList();
  }

  Future<void> _getEventDataList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('s').get();
      setState(() {
        widget.eventDataList1 = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (error) {
      print("erreur");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Une erreur s\'est produite')),
      // );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(250, 247, 254, 1),
                Color.fromARGB(255, 225, 197, 255),
              ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
            ),
            child: widget.eventDataList1 == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: widget.eventDataList1.length,
                    itemBuilder: (context, index) {
                      final item = widget.eventDataList1[index];
                      if (item['docId'] != null) {
                        docId = item['docId'];
                      }

                      return Column(
                        children: [
                          SizedBox(height: 45),
                          Container(
                        
                           
                            margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 246, 232, 255),
                              borderRadius: BorderRadius.circular(
                                  10), // apply circular border radius to the image
                            ),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text(
                                  "${item['date']}",
                                  style: TextStyle(
                                      color: red1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      letterSpacing: 7),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                      height: 50,
                                    ),
                                    Image(
                                        image:
                                            AssetImage("assets/images/j.PNG"),
                                        height: 80,
                                        width: 50),
                                    SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          "Controle des symptomes",
                                          style: TextStyle(
                                              color: green1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.5,
                                              fontFamily: "BreeSerif-Regular",
                                              shadows: [
                                                Shadow(
                                                    color: mauve1,
                                                    blurRadius: 2)
                                              ]),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${item['effet']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: mauve2),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "${item['heure']}",
                                      style: TextStyle(
                                          color: blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: blue,
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      );
                    })));
  }
}
