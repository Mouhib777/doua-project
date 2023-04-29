import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class for_ren extends StatefulWidget {
  for_renState createState() => for_renState();
}

class for_renState extends State<for_ren> {
  final DateTime today = DateTime.now();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late String nomMedecin;
  late String numMedecin;
  late DocumentReference docRef;
  bool ishValid = true;
  bool isDateValid = true;
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

  Future<void> _addRDV() async {
    final formData = _formKey.currentState!.value;
    final selectedOption = formData['selectedOptionn'];
    final time = TimeOfDay.now(); // Add this line to define the "time" variable
    final date = DateTime.now();

    try {
      if (selectedOption == 'rappel personalisé') {
        final rappelPersonalise =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
        docRef = await FirebaseFirestore.instance.collection('r').add({
          'nomMedecin': nomMedecin,
          'numMedecin': numMedecin,
          'date': getdate(),
          'time':
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
          'rappelPersonnalis': rappelPersonalise,
        });
      } else {
        docRef = await FirebaseFirestore.instance.collection('r').add({
          'nomMedecin': nomMedecin,
          'numMedecin': numMedecin,
          'date': getdate(),
          'time':
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
          'rappelPersonnalis': selectedOption,
        });
      }

      _formKey.currentState?.reset();

      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite')),
      );
    }
  }

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
              image: AssetImage("image/oo.jpg"), fit: BoxFit.cover),
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
                    FormBuilderFieldOption(
                      value: "rappel personalisé",
                      child: Text(
                        "Rappel personalisé",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  onChanged: (value) async {
                    if (value == 'rappel personalisé') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Choisir un rappel personnalisé ",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 216, 210, 255),
                                ),
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 216, 210, 255),
                                  ),
                                  onPressed: () async {
                                    // Afficher un sélecteur de temps
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    // Afficher un sélecteur de date
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2030),
                                    );
                                    // Afficher un sélecteur de temps si l'utilisateur a sélectionné une date

                                    if (time != null) {
                                      // Calculer la différence entre le temps actuel et le temps sélectionné
                                      final now = DateTime.now();
                                      final selectedTime = DateTime(
                                          date!.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute);
                                      final difference =
                                          selectedTime.difference(now);

                                      // Calculer le nombre de jours, heures et minutes jusqu'au réveil
                                      final days = difference.inDays;
                                      final hours =
                                          difference.inHours.remainder(24);
                                      final minutes =
                                          difference.inMinutes.remainder(60);

                                      // Afficher le temps restant jusqu'au réveil
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 120, 21, 240),
                                          content: Text(
                                              'Réveil dans $days jour(s), $hours heure(s) et $minutes minute(s)'),
                                        ),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      );
                    }
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
