import 'package:flutter/material.dart';
import 'for_med.dart';

class TraitPage extends StatelessWidget {
  const TraitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(76, 249, 64, 255),
          title: const Text('Traitement'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 225, 197, 255),
              Color.fromRGBO(251, 247, 255, 1)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(100),
            child: Column(
              children: [
                Image.asset(
                  "image/jj.png",
                  height: 180,
                  width: 430,
                ),
                SizedBox(height: 25),
                Text(
                  "Commencons!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'BreeSerif-Regular',
                      color: Color.fromARGB(255, 30, 69, 79),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Recervez des rappels concernant vos médicaments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(148, 19, 2, 42), fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(15)),
                ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return for_med();
                    }));
                  }),
                  child: Text(
                    "Ajouter un rappel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 89, 119, 139),
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
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
