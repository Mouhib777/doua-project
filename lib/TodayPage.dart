import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'TraitPage.dart';
import 'cnx.dart';
import 'login/login_view.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Benslimen douaa",
                    style:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                accountEmail: Text(
                  "Benslimendouaa2002@gmail.com",
                  style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      224, 155, 101, 164), // couleur de fond souhaitée
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                title: Text(
                  "Mon compte",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.account_box_rounded,
                  color: mauve2,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Paramètres",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.settings,
                  color: mauve2,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Contacter nous",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.contact_mail_sharp,
                  color: mauve2,
                ),
                onTap: () async {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: 'benslimendouaa2002@gmail.com',
                    query: 'subject=Feedback sur l\'application&body=Bonjour,',
                  );
                  String url = params.toString();
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Déconnexion",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: mauve2,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginView();
                  }));
                },
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 247, 234, 254),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(76, 249, 64, 255),
          title: const Text("Aujourd'hui"),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 225, 197, 255),
              Color.fromRGBO(250, 247, 254, 1)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(100),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/pp.PNG",
                  height: 150,
                  width: 400,
                ),
                SizedBox(height: 20),
                Text(
                  "Suivez facilement vos tâches",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'BreeSerif-Regular',
                      color: noire2,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Vos tâches quotidiennes apparaîtront ici une fois que vous les aurez planifiées dans le traitement ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(148, 19, 2, 42), fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(15)),
                ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TraitPage();
                    }));
                  }),
                  child: Text(
                    "Accéder au traitement",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
