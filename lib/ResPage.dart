import 'package:flutter/material.dart';
import 'for_ren.dart';

class ResPage extends StatefulWidget {
  const ResPage({Key? key}) : super(key: key);

  @override
  State<ResPage> createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 232, 210, 254),
          Color.fromRGBO(245, 239, 254, 1)
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(115),
        child: Column(
          children: [
            Image.asset(
              "image/pppp.png",
              height: 150,
              width: 400,
            ),
            SizedBox(height: 15),
            Text(
              "Suivez vos rendez-vous",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BreeSerif-Regular',
                  color: Color.fromARGB(255, 30, 69, 79),
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return for_ren();
                }));
              }),
              child: Text(
                "Commencer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 89, 119, 139),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
