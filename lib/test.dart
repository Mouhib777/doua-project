import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class Facture extends StatefulWidget {
  @override
  _FactureState createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  String? _name;
  late String _date;
  int selectedMonths = 1;
  int selectedNumber = 2;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;
  var userData;
  Future<DocumentSnapshot> getUserData() async {
    var result = await FirebaseFirestore.instance
        .collection('user')
        .doc(user?.uid)
        .get();
    setState(() {
      userData = result;
    });
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 133, 187, 231),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: SingleChildScrollView(
         
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "images/stgll.png",
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Text("Facture"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 40),
                            child: FormBuilderDropdown(
                              name: 'selectedMonths',
                              decoration: InputDecoration(
                                hintText: "mois",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              initialValue: selectedMonths,
                 
                              items: [
                                DropdownMenuItem(
                                    value: 1, child: Text('1 mois')),
                                DropdownMenuItem(
                                    value: 2, child: Text('2 mois')),
                                DropdownMenuItem(
                                    value: 4, child: Text('4 mois')),
                                DropdownMenuItem(
                                    value: 6, child: Text('6 mois')),
                                DropdownMenuItem(
                                    value: 8, child: Text('8 mois')),
                                DropdownMenuItem(
                                    value: 10, child: Text('10 mois')),
                                DropdownMenuItem(
                                    value: 12, child: Text('12 mois')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedMonths = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 40),
                            child: FormBuilderDropdown(
                              name: 'selectedNumber',
                              decoration: InputDecoration(
                                hintText: "nombre",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              initialValue: selectedNumber,
                          
                              items: [
                                DropdownMenuItem(value: 2, child: Text('2')),
                                DropdownMenuItem(value: 3, child: Text('3')),
                                DropdownMenuItem(value: 4, child: Text('4')),
                                DropdownMenuItem(value: 5, child: Text('6')),
                                DropdownMenuItem(value: 5, child: Text('9')),
                                DropdownMenuItem(value: 5, child: Text('12')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedNumber = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(40),
                            child: FormBuilderTextField(
                              name: "index",
                              decoration: InputDecoration(
                                hintText: 'Entre nouveau index',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              controller: firstController,
                              validator: FormBuilderValidators.compose([
                               
                              ]),
                              onSaved: (value) {
                                firstController.text = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 40),
                            child: FormBuilderTextField(
                              name: "index",
                              decoration: InputDecoration(
                                hintText: 'Entre ancien index',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              controller: secondController,
                              validator: FormBuilderValidators.compose([
                            
                              ]),
                              onSaved: (value) {
                                secondController.text = value!;
                              },
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                var name = userData["nom&prenom"];
                                var ref = userData["ref"];
                                var district = userData["district"];
                                var addresse = userData["addresse"];

                                final User? user =
                                    FirebaseAuth.instance.currentUser;
                                final _uid = user!.uid;
                                print(_uid);
                                int indexAncien =
                                    int.parse(secondController.text);
                                int nouveauIndex =
                                    int.parse(firstController.text);
                                int quantite = nouveauIndex - indexAncien;
                                int mois = selectedMonths;
                                int moyenne = quantite ~/ mois;
                                double prixUnitaire = 0;

                                if (moyenne <= 200) {
                                  prixUnitaire = 176;
                                }

                                await FirebaseFirestore.instance
                                    .collection('facture')
                                    .doc()
                                    .set({
                                  'id': _uid,
                                  'name': name,
                                  'addresse': addresse,
                                  'district': district,
                                  'index ancien': secondController.text,
                                  'index nouveau': firstController.text,
                                  'nouveau index': firstController.text,
                                  'mois': selectedMonths,
                                  'puissance': selectedNumber,
                                  'quantité': quantite,
                                  'reference': ref,
                                  "moyenne": moyenne,
                                  'prix unitaire': prixUnitaire,
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      name: name,
                                      reference: ref,
                                      prixUnitaire: prixUnitaire.toString(),
                                      addresse: addresse,
                                      district: district,
                                      quantite: quantite.toString(),
                                      indexAncienne: secondController.text,
                                      moyenne: moyenne.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Suivant",
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 9,
                                shadowColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  final String name;
  final String addresse;
  final String reference;
  final String district;
  final String quantite;
  final String moyenne;
  final String indexAncienne;
  final String prixUnitaire;

  SecondPage({
    required this.name,
    required this.addresse,
    required this.district,
    required this.reference,
    required this.quantite,
    required this.indexAncienne,
    required this.moyenne,
    required this.prixUnitaire,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 187, 231),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.asset(
              "images/stgll.png",
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Text("Facture"),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Libellés')),
              DataColumn(label: Text('')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Nom')),
                DataCell(Text(name)),
              ]),
              DataRow(cells: [
                DataCell(Text('Quantité')),
                DataCell(Text(quantite)),
              ]),
              DataRow(cells: [
                DataCell(Text('Index ancien')),
                DataCell(Text(indexAncienne)),
              ]),
              DataRow(cells: [
                DataCell(Text('Moyenne')),
                DataCell(Text(moyenne)),
              ]),
              DataRow(cells: [
                DataCell(Text('Référence')),
                DataCell(Text(reference)),
              ]),
              DataRow(cells: [
                DataCell(Text('District')),
                DataCell(Text(district)),
              ]),
              DataRow(cells: [
                DataCell(Text('Adresse')),
                DataCell(Text(addresse)),
              ]),
              DataRow(cells: [
                DataCell(Text('prix unitaire')),
                DataCell(Text(prixUnitaire)),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}