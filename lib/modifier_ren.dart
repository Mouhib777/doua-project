import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/for_ren.dart';
import 'package:douaa_project/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class modifier_ren extends StatefulWidget {
  final docid; // add String type annotation here
  final eventDataList;

  modifier_ren({this.docid, this.eventDataList});

  modifier_renState createState() => modifier_renState();
}

class modifier_renState extends State<modifier_ren> {
  final DateTime today = DateTime.now();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late String nomMedecin;
String selectedOption = "";
  late String numMedecin;
  bool ishValid = true;
  bool isDateValid = true;
  void initState() {
    super.initState();
    nomMedecin = widget.eventDataList['nomMedecin'];
    numMedecin = widget.eventDataList['numMedecin'];
    selectedOption = widget.eventDataList['rappelPersonnalis'];

  }

  String getDuree() {
    String y = date.year.toString();
    String m = date.month.toString();
    String d = date.day.toString();
    String h = time.hour.toString();
    String mn = time.minute.toString();

    return '$y / $m / $d    $h: $mn';
  }

  String getdate() {
    String y = date.year.toString();
    String m = date.month.toString();
    String d = date.day.toString();

    return '$d / $m / $y';
  }

  void _validateDate() {
    final selectedDate = DateTime(date.year, date.month, date.day);
    if (selectedDate.isBefore(today)) {
      setState(() {
        isDateValid = false;
      });
    } else if (selectedDate.isAtSameMomentAs(today)) {
      if (time.hour < today.hour + 1 ||
          (time.hour == today.hour + 1 && time.minute < today.minute)) {
        setState(() {
          isDateValid = false;
        });
      } else {
        setState(() {
          isDateValid = true;
        });
      }
    } else {
      setState(() {
        isDateValid = true;
      });
    }
  }

  void _validateHour() {
    final selectedDateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

    if (selectedDateTime.isAfter(today)) {
      // si la date est supérieure à aujourd'hui
      setState(() {
        ishValid = true;
      });
    } else if (selectedDateTime.isAtSameMomentAs(today)) {
      // si la date est aujourd'hui
      if (time.hour > today.hour ||
          (time.hour == today.hour && time.minute >= today.minute + 1)) {
        setState(() {
          ishValid = true;
        });
      } else {
        setState(() {
          ishValid = false;
        });
      }
    } else {
      // si la date est antérieure à aujourd'hui
      setState(() {
        ishValid = false;
      });
    }
  }

  @override
  Future<void> _addRDV() async {
   
    try {
      await FirebaseFirestore.instance
          .collection("r")
          .doc(widget.docid)
          .update({
        'nomMedecin': nomMedecin,
        'numMedecin': numMedecin,
        'date': getdate(),
        'time':
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
        'rappelPersonnalis': selectedOption,
      });

      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite: $error')),
      );
    }
  }

// ...

  String? selectedOptionn;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FormBuilder(
      key: _formKey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/oo.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 65),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Rendez-vous",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 30,
                      fontFamily: 'BreeSerif-Regular',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 186, 106, 186),
                          blurRadius: 5.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Nom du médecin :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blue,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: FormBuilderTextField(
                        initialValue: widget.eventDataList['nomMedecin'],
                        name: 'nomMedecin',
                        decoration: InputDecoration(
                          prefix: Text(
                            "DR.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context,
                              errorText: 'Veuillez saisir un nom de médecin'),
                        ]),
                        onChanged: (value) {
                          setState(() {
                            nomMedecin = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Num du médecin :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blue,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: FormBuilderTextField(
                        initialValue: widget.eventDataList['numMedecin'],
                        name: 'numMedecin',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context,
                              errorText: 'Veuillez saisir un nom de médecin'),
                        ]),
                        onChanged: (value) {
                          setState(() {
                            numMedecin = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Choisissez la date de votre Rendez-vous:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: blue),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    Text(
                        "${date != null ? "${date.day}/${date.month}/${date.year}" : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.all(20)),
                    ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          try {
                            if (selectedDate != null) {
                              setState(() {
                                date = selectedDate;
                              });
                              _validateDate();
                            }
                          } on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Une erreur s\'est produite')),
                            );
                          }
                        },
                        child: Text(
                          "date",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(145, 70, 146, 142),
                          padding: EdgeInsets.only(
                              top: 2, bottom: 2, left: 50, right: 50),
                        )),
                  ],
                ),
                if (!isDateValid)
                  const Text(
                    "La date sélectionnée doit être supérieure ou égale à aujourd'hui",
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 30),
                Text(
                  "Choisissez l'heure de votre Rendez-vous:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19, color: blue),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    Text(
                      "${time != null ? time.hour.toString().padLeft(2, '0') : TimeOfDay.now().hour.toString().padLeft(2, '0')}:${time != null ? time.minute.toString().padLeft(2, '0') : TimeOfDay.now().minute.toString().padLeft(2, '0')}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(35)),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        if (selectedTime != null) {
                          setState(() {
                            time = selectedTime;
                          });
                          _validateHour();
                        }
                      },
                      child: Text(
                        "heure",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(145, 70, 146, 142),
                        padding: EdgeInsets.only(
                            top: 2, bottom: 2, left: 50, right: 50),
                      ),
                    ),
                  ],
                ),
                if (!ishValid)
                  Text(
                    "L'heure sélectionnée doit être supérieure ou égale à aujourd'hui",
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 15),
                Text(
                  "Rappelez moi avant:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: blue),
                ),
                                FormBuilderRadioGroup(
                  name: 'selectedOptionn',
                  validator: FormBuilderValidators.required(context,
                      errorText: 'Veuillez choisir une option'),
                  options: [
                    FormBuilderFieldOption(
                      value: "1h",
                      child: Text(
                        "1H",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: "2h",
                      child: Text(
                        "2H",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: "1j",
                      child: Text(
                        "1Jour",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: "3j",
                      child: Text(
                        "3Jours",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  
                  ],
  onChanged: (value) {
    setState(() {
      selectedOption = value!;
    });
  },
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate() &&
                          ishValid == true &&
                          isDateValid == true) {
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
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => for_ren()));
                    }),
                    child: const Text(
                      "Ajouter un autre rendez-vous",
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
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
