import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class for_ren extends StatefulWidget {
  for_renState createState() => for_renState();
}

class for_renState extends State<for_ren> {
  late String selectedDuration ;
  final DateTime today = DateTime.now();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late String nomMedecin;
  late String numMedecin;
  String selectedOption = "";
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
    String yyyy = date.year.toString();
    String MM = date.month.toString();
    String dd = date.day.toString();
    return '$dd/$MM/$yyyy';
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
    try {
      
        docRef = await FirebaseFirestore.instance.collection('r').add({
          'nomMedecin': nomMedecin,
          'numMedecin': numMedecin,
          'date': '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')}',
          'time':
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
          'rappelPersonnalis': selectedOption,
        });
      _formKey.currentState?.reset();

      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite $error')),
      );
    }
  }

  String? selectedOptionn;
  DateTime date = DateTime.now();
  String? date2;
  TimeOfDay time = TimeOfDay.now();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> showNotification(int duration) async {
  // Configuration de la notification
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  // Calcul de la nouvelle date et heure de l'alarme
  DateTime selectedDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
  DateTime alarmDateTime = selectedDateTime.subtract(Duration(hours: duration));

  // Affichage de la notification à l'heure de l'alarme
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Alarme',
    'Votre alarme est prête !',
    tz.TZDateTime.from(alarmDateTime, tz.local),
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    payload: 'notification_payload',
  );
}

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
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  keyboardType: TextInputType.number,
  validator: FormBuilderValidators.compose([
    FormBuilderValidators.required(context,
        errorText: 'Veuillez saisir un numéro de médecin'),
    FormBuilderValidators.minLength(context, 8,
        errorText: 'Le numéro doit contenir au moins 8 caractères'),
  ]),
  onChanged: (value) {
    setState(() {
      numMedecin = value!;
    });
  },
)

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
                        "${date != null ? DateFormat('dd/MM/yyyy').format(date) : DateFormat('dd/MM/yyyy').format(DateTime.now())}",
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
                       onChanged: (value) {
    setState(() {
      selectedOption = value!;
    });
  },
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

                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate() &&
                          ishValid == true &&
                          isDateValid == true) {
                        _addRDV();
                        int duration = 0;
      if (selectedOptionn != null) {
        if (selectedOptionn == "1h") {
          duration = 1;
        } else if (selectedOptionn == "2h") {
          duration = 2;
        } else if (selectedOptionn == "1j") {
          duration = 24;
        } else if (selectedOptionn == "3j") {
          duration = 72;
        }
      }
      showNotification(duration);

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
