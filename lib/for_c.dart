import 'package:douaa_project/widget/style.dart';
import 'package:douaa_project/widgets/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'list_c.dart';

class for_c extends StatefulWidget {
  @override
  _for_cState createState() => _for_cState();
}

class _for_cState extends State<for_c> {
  late DocumentReference docRef1;
  late String docId;
  final DateTime today = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  int? selectedDay = DateTime.now().day;
  int? selectedMonth = DateTime.now().month;
  int? selectedYear = DateTime.now().year;
  int? selectedHour = DateTime.now().hour;
  int? selectedMinute = DateTime.now().minute;
  bool isDateValid = true;
  bool ishValid = true;

  void _validateDate() {
    final selectedDate = DateTime(selectedYear!, selectedMonth!, selectedDay!);
    if (selectedDate.isBefore(today)) {
      setState(() {
        isDateValid = false;
      });
    } else {
      setState(() {
        isDateValid = true;
      });
    }
  }

  void _validateHour() {
    final selectedDateTime = DateTime(selectedYear!, selectedMonth!,
        selectedDay!, selectedHour!, selectedMinute!);
    if (selectedDateTime.isBefore(today)) {
      setState(() {
        ishValid = false;
      });
    } else {
      setState(() {
        ishValid = true;
      });
    }
  }

  String getSelectedDate() {
    String day = selectedDay.toString().padLeft(2, '0');
    String month = selectedMonth.toString().padLeft(2, '0');
    String year = selectedYear.toString();
    return '$day/$month/$year';
  }

  String getTime() {
    String h = selectedHour.toString();
    String m = selectedMinute.toString();
    return '$h:$m';
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> _addRD() async {
    try {
      if (selectedTime != null && selectedDate != null) {
        docRef1 = await FirebaseFirestore.instance.collection('s').add({
          'date': getSelectedDate(),
          'heure': getTime(),
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('RDV ajouté avec succès')),
      );

      // Effacer le formulaire après avoir ajouté le RDV
    } catch (error) {
      print("erreur");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Une erreur s\'est produite')),
      // );
    }
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _selectTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time != null && time != selectedTime) {
      setState(() {
        selectedTime = time;
      });
    }
    ;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      setState(() {
        selectedDateRange = null;
      });
      await _selectDateRange(context);
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: selectedDate,
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  DateTimeRange? selectedDateRange;
  Widget buildDateRangePicker(
      BuildContext context, DateTimeRange? dateTimeRange) {
    if (dateTimeRange != null) {
      return FormBuilderDateRangePicker(
        name: 'date_range_picker',
        validator: FormBuilderValidators.required(context,
            errorText: 'Veuillez choisir une option'),
        initialValue: dateTimeRange,
        decoration: InputDecoration(labelText: 'Sélectionnez une période'),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2100),
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 225, 197, 255),
                      Color.fromRGBO(250, 247, 254, 1)
                    ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      SizedBox(height: 65),
                      Text(
                        "Contrôle des symptômes",
                        style: TextStyle(
                            color: green2,
                            fontSize: 23,
                            letterSpacing: 3,
                            fontFamily: "BreeSerif-Regular",
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(color: mauve2, blurRadius: 4)]),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      test()));
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return list_c();
                          // }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(244, 233, 254, 1),
                          padding: EdgeInsets.only(
                              left: 70, top: 20, bottom: 20, right: 70),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 24,
                              color: noire2,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Ajouter un symptôme",
                              style: TextStyle(
                                  fontFamily: "BreeSerif-Regular",
                                  fontWeight: FontWeight.bold,
                                  color: noire2,
                                  fontSize: 17.3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(children: [
                        Padding(padding: EdgeInsets.only(right: 50)),
                        Icon(
                          Icons.date_range,
                          size: 20,
                          color: mauve2,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                              color: mauve2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "BreeSerif-Regular",
                              shadows: [Shadow(color: mauve2, blurRadius: 2)]),
                        ),
                      ]),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
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
                                  items: List<DropdownMenuItem<int>>.generate(
                                      31, (int index) {
                                    String dayText =
                                        (index + 1).toString().padLeft(2, '0');
                                    return DropdownMenuItem<int>(
                                      value: index + 1,
                                      child: Text(
                                        dayText,
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: mauve2,
                                        ),
                                      ),
                                    );
                                  }),
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedDay = value;
                                    });
                                    _validateDate();
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
                                  items: List<DropdownMenuItem<int>>.generate(
                                      12, (int index) {
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
                                    _validateDate();
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
                                  items: List<DropdownMenuItem<int>>.generate(
                                      10, (int index) {
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
                                    _validateDate();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (!isDateValid)
                        const Text(
                          "La date sélectionnée doit être supérieure ou égale à aujourd'hui",
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 50)),
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: mauve2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Heure",
                            style: TextStyle(
                                color: mauve2,
                                fontFamily: "BreeSerif-Regular",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(color: mauve2, blurRadius: 2)
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
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
                                    items: List<DropdownMenuItem<int>>.generate(
                                        24, (int index) {
                                      String hourText =
                                          index.toString().padLeft(2, '0');
                                      return DropdownMenuItem<int>(
                                        value: index,
                                        child: Text(
                                          hourText,
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: mauve2,
                                          ),
                                        ),
                                      );
                                    }),
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedHour = value;
                                      });
                                      _validateHour();
                                    },
                                  )),
                              const SizedBox(width: 16.0),
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
                                    items: List<DropdownMenuItem<int>>.generate(
                                        60, (int index) {
                                      String minuteText =
                                          index.toString().padLeft(2, '0');
                                      return DropdownMenuItem<int>(
                                        value: index,
                                        child: Text(
                                          minuteText,
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: mauve2,
                                          ),
                                        ),
                                      );
                                    }),
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedMinute = value;
                                      });
                                      _validateHour();
                                    },
                                  )),
                            ],
                          )
                        ],
                      ),
                      if (!ishValid)
                        Text(
                          "L'heure sélectionnée doit être supérieure ou égale à aujourd'hui",
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, bottom: 10, top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addRD();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ajouter maintenant",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: noire2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.check,
                                size: 32,
                                color: noire2,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: gris,
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 30, right: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 20),
                        ),
                      ),
                    ])))));
  }
}
