import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class test2 extends StatefulWidget {
  const test2({super.key});

  @override
  State<test2> createState() => _test2State();
}

class _test2State extends State<test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("symptomes")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("hh"),
                        );
                      }
                      return ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 30,
                        ),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          var docId = snapshot.data.docs[index].id;
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('symptomes')
                                .doc(docId)
                                .get(),
                            builder: (context, AsyncSnapshot asyncsnapshot) {
                              var item = asyncsnapshot.data;
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Tous les symptomes',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        content: Text(
                                          "${item["selected"]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            child: Text(
                                              'Ok',
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 45),
                                    Container(
                                      // width:
                                      //     MediaQuery.of(context).size.width * 0.4,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,

                                        // color: Color.fromARGB(255, 246, 232, 255),
                                        borderRadius: BorderRadius.circular(
                                            10), // apply circular border radius to the image
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20)),
                                            // Text(
                                            //   "${item['date']}",
                                            //   style: TextStyle(
                                            //       color: red1,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontSize: 20,
                                            //       letterSpacing: 7),
                                            // ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                  height: 50,
                                                ),
                                                Image(
                                                    image: AssetImage(
                                                        "assets/images/j.PNG"),
                                                    height: 80,
                                                    width: 50),
                                                SizedBox(width: 20),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "${item['Datetime']}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "Controle des symptomes",
                                                      style: TextStyle(
                                                          color: green1,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17.5,
                                                          fontFamily:
                                                              "BreeSerif-Regular",
                                                          shadows: [
                                                            Shadow(
                                                                color: mauve1,
                                                                blurRadius: 2)
                                                          ]),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Container(
                                                      width: 200,
                                                      child: Text(
                                                        "${item['selected']}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                            color: mauve2),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                // SizedBox(width: 15),
                                                // Text(
                                                //   // "${item['heure']}",
                                                //   style: TextStyle(
                                                //       color: blue,
                                                //       fontWeight: FontWeight.bold,
                                                //       fontSize: 15),
                                                // ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Column(
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      color: blue,
                                                    ),
                                                    Text(
                                                      "${item['heure_minute']}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
