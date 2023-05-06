import 'dart:async';
import 'dart:math';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
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
  if (selectedDateTime != null ) {
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
 String getTime() {
    String a = _selectedTime4.toString();
    String b = _selectedTime5.toString();
    String c = _selectedTime6.toString();
    return '$a/$b/ $c';
  }
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



  String getdureedet() {
    String nmbr = _selectedDateTime.toString();
   
    return '$nmbr';
  }
  Future<void> _addRDV() async {

    try {

      docRef = await FirebaseFirestore.instance.collection('u1').add({
        'nomMed': nomMed,
        'formeMed': selectedCountry,
        'voieMed': selectedCountry1,
        'dureeDet_jour':getdureedet(),
        'dureeIndet':getTime()
     
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('RDV ajouté avec succès')),
      );
      // Effacer le formulaire après avoir ajouté le RDV
      _formKey.currentState?.reset();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => aff_med(
                    docId: docRef.id,
                    eventDataList1: [],
                  )));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite $error')),
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

  void _increment() {
    setState(() {
      _counter++;
    });
  }
  void _decrement() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  // List<String> selectedDays = [];
  // final List<int> _days = List.generate(31, (index) => index + 1);
  // final List<String> _months = [
  //   'Janvier',
  //   'Février',
  //   'Mars',
  //   'Avril',
  //   'Mai',
  //   'Juin',
  //   'Juillet',
  //   'Août',
  //   'Septembre',
  //   'Octobre',
  //   'Novembre',
  //   'Décembre'
  // ];

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
                Text("(Veuillez sélectionner si votre médicament est classé comme étant déterminé ou indéterminé)",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: noire2,
                        fontStyle: FontStyle.italic,
                      ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 25,
                ),
                Row(children: [  Icon(
                              Icons.circle,
                              size: 13,
                              color: noire2,
                            ),
                  Container(margin: EdgeInsets.only(right: 180),
                    child:Text(
                    "Durée déternimée",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 23,
                        color: noire2,
                        fontStyle: FontStyle.italic),
                  ),
                  ),],),
              
    SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Durée un jour ",
                                              style: TextStyle(
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),),
                                              SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => _selectDateTime(context),
                          child: Text("Selectionner",style: TextStyle(
                         
                            fontWeight: FontWeight.bold,
                            fontSize: 16),),style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 139, 121, 168),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
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
                            'Alarme dans  ${time_en_string}');

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
                     
                       child: Text(
                        "Confirmer",
                        style: TextStyle(
                            color:green2,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 221, 213, 235),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                    ),
                     
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(children: [Container(margin:EdgeInsets.only(left: 25),child:Text("Plus d'un jour ",
                                              style: TextStyle(
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),),), SizedBox(width: 20,), ElevatedButton(
                      onPressed: () {
                        openAlarmApp();

                        print(DateTime(2022, 01, 10));
                        // final Cron cron = Cron();
                        // cron.schedule(
                        //     Schedule.parse(
                        //         '${_selectedTime3_!.minute.toString().padLeft(2, '0')} ${_selectedTime3_!.hour.toString().padLeft(2, '0')} * * * ${DateFormat('yyyy-MM-dd').format(_selectedDate1!)} ${DateFormat('yyyy-MM-dd').format(_selectedDate2!)}'),
                        //     () async {});
                      },
                     
                      child: Text(
                        "Selectionner une periode ",
                        style: TextStyle(
                         
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 188, 177, 206),
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, left: 8, right: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                    ),],),
                    
                  
                   
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [ Icon(
                              Icons.circle,
                              size: 12,
                              color: noire2,
                            ),Container(margin: EdgeInsets.only(right: 180),
                    child:Text(
                    "Durée indéternimée",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 23,
                        color: noire2,
                        fontStyle: FontStyle.italic),
                  ),
                  ),],),
                   
                  SizedBox(height: 20,),
                    Text(
                      "Choisissez l'horaire de prise de votre médicament:",
                       style: TextStyle(
                                               
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),
                    ),
SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime4(context),
                          child: Text('Heure',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 188, 177, 206),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Le premier horaire: $timeString4',
                         style: TextStyle(
                                               
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: green2,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),
                        ),
                      ],
                    ),
                     SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime5(context),
                          child: Text('Heure',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 188, 177, 206),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Le deuxième horaire: $timeString5',
                           style: TextStyle(
                                               
                                                fontWeight: FontWeight.bold,
                                                color: green2,
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime6(context),
                          child:Text ('Heure',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 188, 177, 206),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'le troisième horaire: $timeString6',
                          style: TextStyle(
                                               
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: green2,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'BreeSerif-Regular',
                                              ),
                        ),
                      ],
                    ),
                    Container(margin:EdgeInsets.only(left: 250), child: ElevatedButton(
                      onPressed: () {
                        print(DateTime(2022, 01, 10));
                        final Cron cron = Cron();

                        if (_selectedTime5 == null && _selectedTime6 == null) {
                          cron.schedule(
                              Schedule.parse(
                                  '0 ${_selectedTime4!.minute.toString().padLeft(2, '0')} ${_selectedTime4!.hour.toString().padLeft(2, '0')} * * *'),
                              () async {
                            EasyLoading.showSuccess('Il est temps de prendre vos médicaments: $nomMed');
                            print("4");
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/sounds/alarm.mp3"),
                              // autoPlay: true,
                              showNotification: true,
                            );

                            //! houni 7ot shnya t7ebou yaaml
                            await sendNotification();
                          });
                        } else if (_selectedTime6 == null) {
                          cron.schedule(
                              Schedule.parse(
                                  '0 ${_selectedTime4!.minute.toString().padLeft(2, '0')} ${_selectedTime4!.hour.toString().padLeft(2, '0')} * * *'),
                              () async {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/sounds/alarm.mp3"),
                              // autoPlay: true,
                              showNotification: true,
                            );
                            EasyLoading.showSuccess('Il est temps de prendre vos médicaments: $nomMed !');
                            //! houni 7ot shnya t7ebou yaaml
                            print("4");
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime5!.minute.toString().padLeft(2, '0')} ${_selectedTime5!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              AssetsAudioPlayer.newPlayer().open(
                                Audio("assets/sounds/alarm.mp3"),
                                // autoPlay: true,
                                showNotification: true,
                              );
                              EasyLoading.showSuccess('Il est temps de prendre vos médicaments: $nomMed !');
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
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/sounds/alarm.mp3"),
                              // autoPlay: true,
                              showNotification: true,
                            );
                            EasyLoading.showSuccess('mriguel4');
                            print("4");
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime5!.minute.toString().padLeft(2, '0')} ${_selectedTime5!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              AssetsAudioPlayer.newPlayer().open(
                                Audio("assets/sounds/alarm.mp3"),
                                // autoPlay: true,
                                showNotification: true,
                              );
                              EasyLoading.showSuccess('Il est temps de prendre vos médicaments: $nomMed !');
                              print("5");
                              // await sendNotification();
                              //! houni 7ot shnya t7ebou yaaml
                            });
                            cron.schedule(
                                Schedule.parse(
                                    '0 ${_selectedTime6!.minute.toString().padLeft(2, '0')} ${_selectedTime6!.hour.toString().padLeft(2, '0')} * * *'),
                                () async {
                              AssetsAudioPlayer.newPlayer().open(
                                Audio("assets/sounds/alarm.mp3"),
                                // autoPlay: true,
                                showNotification: true,
                              );
                              EasyLoading.showSuccess('Il est temps de prendre vos médicaments: $nomMed !');
                              print("6");
                              //! houni 7ot shnya t7ebou yaaml
                              // await sendNotification();
                            });
                            // await sendNotification();
                          });
                        }

                        print(DateTime(2022, 01, 10));
                      },
                      
                      child: Text(
                        "Confirmer",
                        style: TextStyle(
                            color:green2,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 221, 213, 235),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          elevation: 20),
                    ),),
                    

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Alarm.stop(id_alarmb);
                    EasyLoading.showSuccess("L'alarme est éteinte");
                  },
                  child: Text("Arrêtez l'alarme"),
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
