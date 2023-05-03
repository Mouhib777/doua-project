import 'dart:async';
import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'aff_med.dart';
import 'package:cron/cron.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'main.dart';

class for_med extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String name = 'Awesome Notifications - Example App';
  static const Color mainColor = Colors.deepPurple;
  // final DateTime initialDateTime;
  const for_med({
    Key? key,
  }) : super(key: key);

  @override
  State<for_med> createState() => _for_medState();
}

class _for_medState extends State<for_med> {
  // @override
  // void initState() {
  //   // Only after at least the action method is set, the notification events are delivered
  //   AwesomeNotifications().setListeners(
  //     onActionReceivedMethod: (ReceivedAction receivedAction) {
  //       NotificationController.onActionReceivedMethod(context, receivedAction);
  //     },
  //     onNotificationCreatedMethod: (ReceivedNotification receivedNotification) {
  //       NotificationController.onNotificationCreatedMethod(
  //           context, receivedNotification);
  //     },
  //     onNotificationDisplayedMethod:
  //         (ReceivedNotification receivedNotification) {
  //       NotificationController.onNotificationDisplayedMethod(
  //           context, receivedNotification);
  //     },
  //     onDismissActionReceivedMethod: (ReceivedAction receivedAction) {
  //       NotificationController.onDismissActionReceivedMethod(
  //           context, receivedAction);
  //     },
  //   );

  //   super.initState();
  // }

  // late DateTime _selectedDate;
  // late TimeOfDay _selectedTime;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final cron = Cron();
  void openAlarmApp() async {
    var packageName = 'com.google.android.deskclock';
    final url = 'market://details?id=$packageName';
    // final url = 'alarms://';
    // final url = 'clock:';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //! edheya fonction li t7el widget li takhtar mnha date w wa9t
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? selectedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (selectedDateTime != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (selectedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            selectedDateTime.year,
            selectedDateTime.month,
            selectedDateTime.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
      final dateTimeFormat = DateFormat('MMM d, y h:mm a');
      final formattedDateTime = dateTimeFormat.format(_selectedDateTime);
    }
  }

  //!! toufa houni
  DateTime? _selectedDate1;
  DateTime? _selectedDate2;

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100),
        initialDatePickerMode: DatePickerMode.day);
    if (picked1 != null && picked1 != _selectedDate1) {
      setState(() {
        _selectedDate1 = picked1;
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100),
        initialDatePickerMode: DatePickerMode.day);
    if (picked2 != null && picked2 != _selectedDate2) {
      setState(() {
        _selectedDate2 = picked2;
      });
    }
  }

  TimeOfDay? _selectedTime3_;

  Future<void> _selectTime3_(BuildContext context) async {
    final TimeOfDay? picked3_ = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked3_ != null) {
      setState(() {
        _selectedTime3_ = picked3_;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${picked3_.hour}:${picked3_.minute.toString().padLeft(2, '0')}'),
          ],
        )),
      );
    }
  }

  TimeOfDay? _selectedTime3;

  Future<void> _selectTime3(BuildContext context) async {
    final TimeOfDay? picked3 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked3 != null) {
      setState(() {
        _selectedTime3 = picked3;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${picked3.hour}:${picked3.minute.toString().padLeft(2, '0')}'),
          ],
        )),
      );
    }
  }

  TimeOfDay? _selectedTime4;
  Future<void> _selectTime4(BuildContext context) async {
    final TimeOfDay? picked4 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked4 != null) {
      setState(() {
        _selectedTime4 = picked4;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${picked4.hour}:${picked4.minute.toString().padLeft(2, '0')}'),
          ],
        )),
      );
    }
  }

  TimeOfDay? _selectedTime5;
  Future<void> _selectTime5(BuildContext context) async {
    final TimeOfDay? picked5 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked5 != null) {
      setState(() {
        _selectedTime5 = picked5;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${picked5.hour}:${picked5.minute.toString().padLeft(2, '0')}'),
          ],
        )),
      );
    }
  }

  TimeOfDay? _selectedTime6;
  Future<void> _selectTime6(BuildContext context) async {
    final TimeOfDay? picked6 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked6 != null) {
      setState(() {
        _selectedTime6 = picked6;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${picked6.hour}:${picked6.minute.toString().padLeft(2, '0')}'),
          ],
        )),
      );
    }
  }

  // Future<void> _selectTime3(BuildContext context) async {
  //   final TimeOfDay? picked3 = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked3 != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //           content: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //               '${picked3.hour}:${picked3.minute.toString().padLeft(2, '0')}'),
  //         ],
  //       )),
  //     );
  //     setState(() {
  //       selectedTime = picked3;
  //     });
  //   }
  // }

  int id_alarmb = Random().nextInt(65312);

  DateTime _selectedDateTime = DateTime.now();
  DateTime _selectedDateTime1 = DateTime.now();
  DateTime _selectedDateTime2 = DateTime.now();
  // DateTime selectedDateTime = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime3 = TimeOfDay.now();
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
  List<AlarmSettings> alarmSettings = [];

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
        'prd': periode,
        'day': selectedDay,
        'month': selectedMonth,
        'year': selectedYear,
        'heure': selectedHour,
        'minute': selectedMinute,
        'determine': notify,
        'jour _perd': selectedCountry2,
        'c': _c,
        "_counter": _counter
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
  TimeOfDay _selectedTime1 = TimeOfDay.now();

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: _selectedTime,
  //   );
  //   if (picked != null && picked != _selectedTime) {
  //     setState(() {
  //       _selectedTime = picked;
  //     });
  //   }
  // }
  // DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String timeString = _selectedTime3 == null
        ? ''
        : '${_selectedTime3!.hour.toString().padLeft(2, '0')}:${_selectedTime3!.minute.toString().padLeft(2, '0')}';
    String timeString_ = _selectedTime3_ == null
        ? ''
        : '${_selectedTime3_!.hour.toString().padLeft(2, '0')}:${_selectedTime3_!.minute.toString().padLeft(2, '0')}';
    //?
    String timeString4 = _selectedTime4 == null
        ? ''
        : '${_selectedTime4!.hour.toString().padLeft(2, '0')}:${_selectedTime4!.minute.toString().padLeft(2, '0')}';
    String timeString5 = _selectedTime5 == null
        ? ''
        : '${_selectedTime5!.hour.toString().padLeft(2, '0')}:${_selectedTime5!.minute.toString().padLeft(2, '0')}';
    String timeString6 = _selectedTime6 == null
        ? ''
        : '${_selectedTime6!.hour.toString().padLeft(2, '0')}:${_selectedTime6!.minute.toString().padLeft(2, '0')}';
    final dateTimeFormat = DateFormat('MMM d, y h:mm a');

    final formattedDateTime = dateTimeFormat.format(_selectedDateTime);
    final formattedDateTime1 = dateTimeFormat.format(_selectedDateTime1);
    final formattedDateTime2 = dateTimeFormat.format(_selectedDateTime2);

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
                image: AssetImage("assets/images/oo.jpg"), fit: BoxFit.cover),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "alarm mara barka fi date w nhar mou3ayn",
                      style: TextStyle(color: Colors.red),
                    ),
                    //! edheya button li t7el widget te3 wkt w date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDateTime(context),
                          child: Text("akhtar date"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'selected: $formattedDateTime',
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        // await pushNotification(selectedTime);
                        // setState(() {
                        //   horaires.add(
                        //       '$selectedHour:$selectedMinute $_c $selectedCountry');
                        //   _c = 1;
                        // });
                        //! 7asb package li stamlt'ha lezem 'timee' ikoun bil format edheya besh yfhemha
                        final time_en_string = formattedDateTime;
                        final time_format = DateFormat('MMM d, y h:mm a');
                        final timee = time_format.parse(time_en_string);
                        print(timee);
                        EasyLoading.showToast(
                            'besh ndhakrek maa ${time_en_string}');

                        await Alarm.set(
                          alarmSettings: AlarmSettings(
                            id: id_alarmb, //! je l'ai declaré fou9 besh alarm id ikoun nafsou w akeka tnjm twa9fou
                            dateTime: timee,
                            // DateTime.parse(
                            //     '$selectedYear-${selectedMonth.toString().padRight(2, '0')}-${selectedDay}T${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().toString().padLeft(2, '0')}:00Z'),
                            assetAudioPath: 'assets/sounds/alarm.mp3',
                            loopAudio: true,
                            vibrate: true,
                            fadeDuration: 10.0,
                            notificationTitle: 'Prenez votre medicament!',
                            notificationBody: nomMed,
                            stopOnNotificationOpen: true,
                            enableNotificationOnKill: true,
                          ),
                        );

                        // alarmSettings
                        //     .map((e) async => await Alarm.set(alarmSettings: e));
                        // setState(() {});
                      },
                      icon: Icon(Icons.add, color: noire1, size: 24),
                      label: Text(
                        "Set alarm",
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
                    Text(
                      "alarm fi periode mouaayna",
                      style: TextStyle(color: Colors.red),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _selectDate1(context);
                            EasyLoading.showInfo(
                                'Selected date: ${DateFormat('yyyy-MM-dd').format(_selectedDate1!)}');
                          },
                          child: Text("debut"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          _selectedDate1 == null
                              ? 'debut'
                              : 'Selected date: ${DateFormat('yyyy-MM-dd').format(_selectedDate1!)}',
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _selectDate2(context);
                            EasyLoading.showInfo(
                                'Selected date: ${DateFormat('yyyy-MM-dd').format(_selectedDate2!)}');
                          },
                          child: Text("fin"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          _selectedDate2 == null
                              ? 'fin'
                              : 'Selected date: ${DateFormat('yyyy-MM-dd').format(_selectedDate2!)}',
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime3_(context),
                          child: Text('Select Time'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Selected Time: $timeString_',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        openAlarmApp();

                        print(DateTime(2022, 01, 10));
                        // final Cron cron = Cron();
                        // cron.schedule(
                        //     Schedule.parse(
                        //         '${_selectedTime3_!.minute.toString().padLeft(2, '0')} ${_selectedTime3_!.hour.toString().padLeft(2, '0')} * * * ${DateFormat('yyyy-MM-dd').format(_selectedDate1!)} ${DateFormat('yyyy-MM-dd').format(_selectedDate2!)}'),
                        //     () async {});
                      },
                      icon: Icon(Icons.add, color: noire1, size: 24),
                      label: Text(
                        "Set alarm2",
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "edheyya ki thot w9t yo93ed iaawd'ha kol 24h",
                      style: TextStyle(color: Colors.red),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime3(context),
                          child: Text('Select Time'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Selected Time: $timeString',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        print(DateTime(2022, 01, 10));
                        final Cron cron = Cron();
                        cron.schedule(
                            Schedule.parse(
                                '0 ${_selectedTime3!.minute.toString().padLeft(2, '0')} ${_selectedTime3!.hour.toString().padLeft(2, '0')} * * *'),
                            () async {
                          EasyLoading.showSuccess('mriguel1');
                          print("1");
                          // await sendNotification();
                        });

                        print(DateTime(2022, 01, 10));
                      },
                      icon: Icon(Icons.add, color: noire1, size: 24),
                      label: Text(
                        "Set alarm3",
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

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "edheyya ki thot 3 aw9at fard nhar yo93ed iaawd'hom kol 24h",
                      style: TextStyle(color: Colors.red),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime4(context),
                          child: Text('Select Time'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Selected Time: $timeString4',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime5(context),
                          child: Text('Select Time'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Selected Time: $timeString5',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime6(context),
                          child: Text('Select Time'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Selected Time: $timeString6',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        print(DateTime(2022, 01, 10));
                        final Cron cron = Cron();

                        if (_selectedTime5 == null && _selectedTime6 == null) {
                          cron.schedule(
                              Schedule.parse(
                                  '0 ${_selectedTime4!.minute.toString().padLeft(2, '0')} ${_selectedTime4!.hour.toString().padLeft(2, '0')} * * *'),
                              () async {
                            EasyLoading.showSuccess('mriguel4');
                            print("4");
                            //! houni 7ot shnya t7ebou yaaml
                            // await sendNotification();
                          });
                        } else if (_selectedTime6 == null) {
                          cron.schedule(
                              Schedule.parse(
                                  '0 ${_selectedTime4!.minute.toString().padLeft(2, '0')} ${_selectedTime4!.hour.toString().padLeft(2, '0')} * * *'),
                              () async {
                            EasyLoading.showSuccess('mriguel4');
                            //! houni 7ot shnya t7ebou yaaml
                            print("4");
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime5!.minute.toString().padLeft(2, '0')} ${_selectedTime5!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              EasyLoading.showSuccess('mriguel5');
                              print("5");
                              //! houni 7ot shnya t7ebou yaaml
                              // await sendNotification();
                            });
                            // cron.schedule(
                            //     Schedule.parse(
                            //         '0 ${_selectedTime6!.minute.toString().padLeft(2, '0')} ${_selectedTime6!.hour.toString().padLeft(2, '0')} * * *'),
                            //     () async {
                            //   EasyLoading.showSuccess('mriguel6');
                            //   print("6");
                            //   // await sendNotification();
                            // });
                            // await sendNotification();
                          });
                        } else {
                          cron.schedule(
                              Schedule.parse(
                                  '0 ${_selectedTime4!.minute.toString().padLeft(2, '0')} ${_selectedTime4!.hour.toString().padLeft(2, '0')} * * *'),
                              () async {
                            EasyLoading.showSuccess('mriguel4');
                            print("4");
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime5!.minute.toString().padLeft(2, '0')} ${_selectedTime5!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              EasyLoading.showSuccess('mriguel5');
                              print("5");
                              // await sendNotification();
                              //! houni 7ot shnya t7ebou yaaml
                            });
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime6!.minute.toString().padLeft(2, '0')} ${_selectedTime6!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              EasyLoading.showSuccess('mriguel6');
                              print("6");
                              //! houni 7ot shnya t7ebou yaaml
                              // await sendNotification();
                            });
                            // await sendNotification();
                          });
                        }

                        print(DateTime(2022, 01, 10));
                      },
                      icon: Icon(Icons.add, color: noire1, size: 24),
                      label: Text(
                        "Set alarm4",
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

                    // print()

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Container(
                    //           height: 40,
                    //           decoration: BoxDecoration(
                    //             border: Border.all(width: 1, color: mauve1),
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: gris,
                    //           ),
                    //           alignment: Alignment.center,
                    //           width: 80,
                    //           // child: DropdownButton<int>(
                    //           //   value: selectedHour,
                    //           //   items: List<DropdownMenuItem<int>>.generate(24,
                    //           //       (int index) {
                    //           //     return DropdownMenuItem<int>(
                    //           //       value: index,
                    //           //       child: Text(
                    //           //         index.toString().padLeft(2,
                    //           //             '0'), // Afficher toujours deux chiffres avec des zéros à gauche si nécessaire
                    //           //         style: TextStyle(
                    //           //           fontStyle: FontStyle.italic,
                    //           //           fontWeight: FontWeight.bold,
                    //           //           color: mauve2,
                    //           //         ),
                    //           //       ),
                    //           //     );
                    //           //   }),
                    //           //   onChanged: (int? value) {
                    //           //     setState(() {
                    //           //       selectedHour = value;
                    //           //     });
                    //           //     print(selectedHour);
                    //           //   },
                    //           // ),
                    //         ),
                    //         // SizedBox(width: 3),
                    //         // const Text(
                    //         //   ':',
                    //         //   style: TextStyle(
                    //         //     fontSize: 23,
                    //         //     fontWeight: FontWeight.bold,
                    //         //   ),
                    //         // ),
                    //         // SizedBox(width: 3),
                    //         // Container(
                    //         //   height: 40,
                    //         //   decoration: BoxDecoration(
                    //         //     border: Border.all(width: 1, color: mauve1),
                    //         //     borderRadius: BorderRadius.circular(10),
                    //         //     color: gris,
                    //         //   ),
                    //         //   alignment: Alignment.center,
                    //         //   width: 80,
                    //         //   child: DropdownButton<int>(
                    //         //     value: selectedMinute,
                    //         //     items: List<DropdownMenuItem<int>>.generate(60,
                    //         //         (int index) {
                    //         //       return DropdownMenuItem<int>(
                    //         //         value: index,
                    //         //         child: Text(
                    //         //           '${index.toString().padLeft(2, '0')}', // Afficher toujours deux chiffres avec des zéros à gauche si nécessaire
                    //         //           style: TextStyle(
                    //         //             fontStyle: FontStyle.italic,
                    //         //             fontWeight: FontWeight.bold,
                    //         //             color: mauve2,
                    //         //           ),
                    //         //         ),
                    //         //       );
                    //         //     }),
                    //         //     onChanged: (value) {
                    //         //       setState(() {
                    //         //         selectedMinute = value;
                    //         //       });
                    //         //     },
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   width: 12,
                    // ),
                    // FloatingActionButton(
                    //   heroTag: 'btn1',
                    //   mini: true,
                    //   backgroundColor: Color.fromARGB(141, 240, 197, 249),
                    //   onPressed: _increment,
                    //   tooltip: 'Inc',
                    //   child: Icon(
                    //     Icons.add,
                    //     color: mauve2,
                    //     size: 20,
                    //   ),
                    // ),
                    // Text(
                    //   '$_c',
                    //   style:
                    //       TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    // ),
                    // FloatingActionButton(
                    //   heroTag: 'btn1',
                    //   mini: true,
                    //   backgroundColor: Color.fromARGB(141, 240, 197, 249),
                    //   onPressed: _decrement,
                    //   tooltip: 'Dec',
                    //   child: Icon(
                    //     Icons.remove,
                    //     color: mauve2,
                    //     size: 20,
                    //   ),
                    // ),
                    // Text(
                    //   "${selectedCountry}(s)",
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // await pushNotification(selectedTime);
                      // setState(() {
                      //   horaires.add(
                      //       '$selectedHour:$selectedMinute $_c $selectedCountry');
                      //   _c = 1;
                      // });
                      //! 7asb package li stamlt'ha lezem 'timee' ikoun bil format edheya besh yfhemha
                      final time_en_string = formattedDateTime;
                      final time_format = DateFormat('MMM d, y h:mm a');
                      final timee = time_format.parse(time_en_string);
                      print(timee);
                      EasyLoading.showToast(
                          'besh ndhakrek maa ${time_en_string}');
                      AwesomeNotifications().createNotification(
                          content: NotificationContent(
                              id: 10,
                              channelKey: 'basic_channel',
                              title: 'Simple Notification',
                              body: 'Simple body',
                              actionType: ActionType.Default));

                      await Alarm.set(
                        alarmSettings: AlarmSettings(
                          id: id_alarmb, //! je l'ai declaré fou9 besh alarm id ikoun nafsou w akeka tnjm twa9fou
                          dateTime: timee,
                          // DateTime.parse(
                          //     '$selectedYear-${selectedMonth.toString().padRight(2, '0')}-${selectedDay}T${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().toString().padLeft(2, '0')}:00Z'),
                          assetAudioPath: 'assets/sounds/alarm.mp3',
                          loopAudio: true,
                          vibrate: true,
                          fadeDuration: 10.0,
                          notificationTitle: 'Prenez votre medicament!',
                          notificationBody: nomMed,
                          stopOnNotificationOpen: true,
                          enableNotificationOnKill: true,
                        ),
                      );

                      // alarmSettings
                      //     .map((e) async => await Alarm.set(alarmSettings: e));
                      // setState(() {});
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
                ElevatedButton(
                  onPressed: () async {
                    await Alarm.stop(id_alarmb);
                    EasyLoading.showSuccess('alarm we9fet');
                  },
                  child: Text("wa9ef alarm"),
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

  Future<void> sendNotification() async {
    // Set up the notification details
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'daily_notifications',
      'Daily Notifications',
      // 'Notifications for daily reminders',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Create the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'Daily Reminder',
      'It is time to do your daily tasks!',
      platformChannelSpecifics,
    );
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    for_med.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
}
