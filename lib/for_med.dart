import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'aff_med.dart';

class for_med extends StatefulWidget {
  const for_med({
    Key? key,
  }) : super(key: key);

  @override
  State<for_med> createState() => _for_medState();
}

class _for_medState extends State<for_med> {
  List<String> horaires = [];
  String periode = '';
  late DocumentReference docRef;
  final _formKey = GlobalKey<FormState>();
  String nomMed = '';
  final DateTime today = DateTime.now();
  int? selectedDay = DateTime.now().day;
  int? selectedMonth = DateTime.now().month;
  int? selectedYear = DateTime.now().year;
  int? selectedHour = DateTime.now().hour;
  int? selectedMinute = DateTime.now().minute;

  String getSelectedDate() {
    String day = selectedDay.toString().padLeft(2, '0');
    String month = selectedMonth.toString().padLeft(2, '0');
    String year = selectedYear.toString();
    return '$day/$month/$year';
  }

  String getduree() {
    String nmbr = selectedCountry2.toString();
    String ajm = _counter.toString();
    return '$ajm $nmbr';
  }

  String getHoraire() {
    String h = horaires.toString();

    return '$h';
  }

  Future<void> _addRDV() async {
    String users1 = '';
    if (li) {
      users1 += 'Lindi' + '/';
    }
    if (mar) {
      users1 += 'Mardi' + '/';
    }
    if (mer) {
      users1 += 'Mercredi' + '/';
    }
    if (je) {
      users1 += 'Jeudi' + '/';
    }
    if (ven) {
      users1 += 'Vendredi' + '/';
    }
    if (sam) {
      users1 += 'Samdi' + '/';
    }
    if (dim) {
      users1 += 'Dimanche' + '/';
    }

    try {
      horaires
          .add('${selectedHour}:${selectedMinute} ${_c} ${selectedCountry}');
      if (selectedOptionn == "t") {
        periode = "Tous les jours";
      } else {
        periode = users1;
      }

      docRef = await FirebaseFirestore.instance.collection('u1').add({
        'nomMed': nomMed,
        'formeMed': selectedCountry,
        'voieMed': selectedCountry1,
        'dateDebMed': getSelectedDate(),
        'dureMed': getduree(),
        'horaireMed': getHoraire(),
        'prd': periode
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('RDV ajouté avec succès')),
      );
      // Effacer le formulaire après avoir ajouté le RDV
      _formKey.currentState?.reset();
      setState(() {
        horaires.clear();
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => aff_med(
                    docId: docRef.id,
                    eventDataList1: [],
                  )));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

  List<DropdownMenuItem<int>> _buildHourList() {
    List<DropdownMenuItem<int>> items = [];
    for (int hour = 0; hour <= 23; hour++) {
      items.add(
        DropdownMenuItem(
          value: hour,
          child: Text(hour.toString().padLeft(2, '0')),
        ),
      );
    }
    return items;
  }

// fonction d'aide pour construire la liste des minutes pour DropdownButton
  List<DropdownMenuItem<int>> _buildMinuteList() {
    List<DropdownMenuItem<int>> items = [];
    for (int minute = 0; minute <= 59; minute++) {
      items.add(
        DropdownMenuItem(
          value: minute,
          child: Text(minute.toString().padLeft(2, '0')),
        ),
      );
    }
    return items;
  }

  var selectedCountry;
  var selectedCountry1;
  var selectedCountry2;
  var notify = false;
  int _counter = 1;
  int _c = 1;
  String? selectedOptionn;
  bool li = false;
  bool mar = false;
  bool mer = false;
  bool je = false;
  bool ven = false;
  bool sam = false;
  bool dim = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _increment() {
    setState(() {
      _c++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_c > 1) {
        _c--;
      }
    });
  }

  List<String> selectedDays = [];
  final List<int> _days = List.generate(31, (index) => index + 1);
  final List<String> _months = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ];

  final List<int> _years =
      List.generate(100, (index) => index + DateTime.now().year - 99);

  int _hour = 0;
  int _minute = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(158, 230, 207, 252),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/oo.jpg"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  child: Text(
                    "Nom du médicament",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: blue,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),
                  ),
                  margin: EdgeInsets.only(right: 170),
                ),
                SizedBox(height: 15),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      hintText: "Nom du médicament",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(141, 141, 141, 0.35)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(166, 156, 169, 1))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir un nom de médecin';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        nomMed = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    "Forme pharmaceutique",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: blue,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),
                  ),
                  margin: EdgeInsets.only(right: 140),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(156, 166, 169, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(9),
                    color: Color.fromRGBO(243, 242, 242, 1),
                  ),
                  child: FormBuilderDropdown(
                    name: "form_field_name",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "erreur"),
                    ]),
                    dropdownColor: Colors.white,
                    hint: Text(
                      "choisissez",
                      style: TextStyle(fontSize: 15),
                    ),
                    items: [
                      "Comprimé",
                      "Capsule",
                      "Solution",
                      "Suspension",
                      "Sirop",
                      "Pommade ",
                      "Inhalateur",
                      "Suppositoire"
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                "$e",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 99, 63, 104),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCountry = val;
                      });
                    },
                    initialValue: selectedCountry,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Text(
                    "voie d’administration ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: blue,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),
                  ),
                  margin: EdgeInsets.only(right: 150),
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(166, 156, 169, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(9),
                      color: Color.fromRGBO(243, 242, 242, 1),
                    ),
                    child: FormBuilderDropdown(
                      name: 'voie',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "erreur"),
                      ]),
                      hint: Text(
                        "choisissez",
                        style: TextStyle(fontSize: 15),
                      ),
                      items: [
                        "Voie orale ",
                        "Voie sublinguale",
                        "Voie rectale ",
                        "Voie transdermique",
                        "Voie intraveineuse",
                        "Voie intramusculaire ",
                        "Voie inhalée",
                        "Voie sous-cutanée"
                      ]
                          .map((e) => DropdownMenuItem(
                                child: Text(
                                  "$e",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 99, 63, 104),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedCountry1 = val;
                        });
                      },
                      initialValue: selectedCountry1,
                    )),
                SizedBox(height: 15),
                Container(
                  child: Text(
                    "Traitement",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: blue,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),
                  ),
                  margin: EdgeInsets.only(right: 260),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 190),
                  child: Text(
                    "Date de début ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 23,
                        color: noire1,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          // Dropdown pour le jour
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: mauve1),
                              borderRadius: BorderRadius.circular(10),
                              color: gris,
                            ),
                            alignment: Alignment.center,
                            width: 60,
                            child: DropdownButton<int>(
                              value: selectedDay,
                              items: List<DropdownMenuItem<int>>.generate(31,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: mauve2),
                                  ),
                                );
                              }),
                              onChanged: (int? value) {
                                setState(() {
                                  selectedDay = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          // Dropdown pour le mois
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: mauve1),
                              borderRadius: BorderRadius.circular(10),
                              color: gris,
                            ),
                            alignment: Alignment.center,
                            width: 110,
                            child: DropdownButton<int>(
                              value: selectedMonth,
                              items: List<DropdownMenuItem<int>>.generate(12,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Text(
                                    DateFormat('MMMM').format(
                                        DateTime(today.year, index + 1, 1)),
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: mauve2),
                                  ),
                                );
                              }),
                              onChanged: (int? value) {
                                setState(() {
                                  selectedMonth = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          // Dropdown pour l'année
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: mauve1),
                              borderRadius: BorderRadius.circular(10),
                              color: gris,
                            ),
                            alignment: Alignment.center,
                            width: 80,
                            child: DropdownButton<int>(
                              value: selectedYear,
                              items: List<DropdownMenuItem<int>>.generate(10,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: today.year + index,
                                  child: Text(
                                    '${today.year + index}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: mauve2),
                                  ),
                                );
                              }),
                              onChanged: (int? value) {
                                setState(() {
                                  selectedYear = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SwitchListTile(
                  title: Text(
                    "Durée indéternimée",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 23,
                        color: noire1,
                        fontStyle: FontStyle.italic),
                  ),
                  value: notify,
                  activeColor: mauve1,
                  onChanged: (val) {
                    setState(() {
                      notify = val;
                    });
                  },
                ),
                if (notify)
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: gris,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(9),
                              color: gris,
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: 'btn1',
                            mini: true,
                            backgroundColor: gris,
                            onPressed: _incrementCounter,
                            tooltip: 'Increment',
                            child: Icon(
                              Icons.add,
                              color: mauve2,
                              size: 20,
                            ),
                          ),
                          Text(
                            '$_counter',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          FloatingActionButton(
                            heroTag: 'btn1',
                            mini: true,
                            backgroundColor: gris,
                            onPressed: _decrementCounter,
                            tooltip: 'Decrement',
                            child: Icon(Icons.remove, size: 20, color: mauve2),
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            iconSize: 19,
                            dropdownColor: Colors.white,
                            hint: Text(
                              "Jour(s)",
                            ),
                            items: ["Jour(s)", "Semaine(s)", "Mois"]
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        "$e",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: green2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedCountry2 = val;
                              });
                            },
                            value: selectedCountry2,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Radio(
                            value: "t",
                            groupValue: selectedOptionn,
                            onChanged: (value) {
                              setState(() {
                                selectedOptionn = value;
                              });
                            },
                          ),
                          Text(
                            "Tous les jours",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Radio(
                            value: "c",
                            groupValue: selectedOptionn,
                            onChanged: (value) {
                              setState(() {
                                selectedOptionn = value;
                              });
                              if (value == "c") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 5),
                                        backgroundColor:
                                            Color.fromARGB(255, 75, 9, 87),
                                        content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text("lin"),
                                                  Checkbox(
                                                      value: li,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          li = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Mar"),
                                                  Checkbox(
                                                      value: mar,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          mar = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Mer"),
                                                  Checkbox(
                                                      value: mer,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          mer = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Jeu"),
                                                  Checkbox(
                                                      value: je,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          je = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Mar"),
                                                  Checkbox(
                                                      value: ven,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          ven = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Sam"),
                                                  Checkbox(
                                                      value: sam,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          sam = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Dim"),
                                                  Checkbox(
                                                      value: dim,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          dim = val!;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ])));
                              }
                            },
                          ),
                          Text(
                            "Certaines jours",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(right: 180),
                  child: Text(
                    "Horaire de la prise",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: blue,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: mauve1),
                              borderRadius: BorderRadius.circular(10),
                              color: gris,
                            ),
                            alignment: Alignment.center,
                            width: 80,
                            child: DropdownButton<int>(
                              value: selectedHour,
                              items: List<DropdownMenuItem<int>>.generate(24,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  child: Text(
                                    '$index',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: mauve2),
                                  ),
                                );
                              }),
                              onChanged: (int? value) {
                                setState(() {
                                  selectedHour = value;
                                });
                              },
                            )),
                        SizedBox(
                          width: 3,
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: mauve1),
                              borderRadius: BorderRadius.circular(10),
                              color: gris,
                            ),
                            alignment: Alignment.center,
                            width: 80,
                            child: DropdownButton<int>(
                              value: selectedMinute,
                              items: List<DropdownMenuItem<int>>.generate(60,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  child: Text(
                                    '$index',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: mauve2),
                                  ),
                                );
                              }),
                              onChanged: (int? value) {
                                setState(() {
                                  selectedMinute = value;
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    FloatingActionButton(
                      heroTag: 'btn1',
                      mini: true,
                      backgroundColor: Color.fromARGB(141, 240, 197, 249),
                      onPressed: _increment,
                      tooltip: 'Inc',
                      child: Icon(
                        Icons.add,
                        color: mauve2,
                        size: 20,
                      ),
                    ),
                    Text(
                      '$_c',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    FloatingActionButton(
                      heroTag: 'btn1',
                      mini: true,
                      backgroundColor: Color.fromARGB(141, 240, 197, 249),
                      onPressed: _decrement,
                      tooltip: 'Dec',
                      child: Icon(
                        Icons.remove,
                        color: mauve2,
                        size: 20,
                      ),
                    ),
                    Text(
                      "${selectedCountry}(s)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        // Ajouter le dernier horaire à la liste des horaires

                        horaires.add(
                            '${selectedHour}:${selectedMinute} ${_c} ${selectedCountry}');

                        selectedHour = 0;
                        selectedMinute = 0;
                        _c = 1;
                      });
                      setState(() {});
                    },
                    icon: Icon(Icons.add, color: noire1, size: 24),
                    label: Text(
                      "Ajouter un horaire",
                      style: TextStyle(
                          color: noire1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: gris,
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 5, right: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                        elevation: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState?.validate() ?? false) {
                        _addRDV();
                      }
                    }),
                    child: Text(
                      "Confirmer",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(145, 66, 137, 134),
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 40, right: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        elevation: 20),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      _addRDV();

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return for_med();
                      }));
                    }),
                    child: const Text(
                      "Ajouter un autre médicament",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 136, 112, 151),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 40, right: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 20),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
