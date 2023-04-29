
import 'package:douaa_project/widget/style.dart';
import 'package:flutter/material.dart';

import 'inscription.dart';

import 'package:email_validator/email_validator.dart';

import 'menu.dart';

class cnx extends StatefulWidget {
  @override
  State<cnx> createState() => _cnxState();
}

class _cnxState extends State<cnx> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  String _email = '';
  String _mdp = '';
  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  void dispose1() {
    mdpController.dispose();

    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    } else if (!EmailValidator.validate(value)) {
      return 'Veuillez entrer une adresse email valide';
    } else {
      return null;
    }
  }

  String? validateMdp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length > 8) {
      return 'Le mot de passe ne doit pas dépasser 8 caractères';
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromRGBO(167, 125, 202, 1)
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 30, 18, 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const SizedBox(
              height: 39,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(37),
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 218, 218),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: green2,
                        width: 8,
                      ),
                      image:
                          DecorationImage(image: AssetImage("image/ww.png"))),
                ),
              ],
            ),
            Text(
              "connectez-vous pour continuer",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "BreeSerif-Regular",
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  shadows: [Shadow(color: mauve2, blurRadius: 4)]),
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      prefixIcon: Icon(Icons.mail,
                          color: Color.fromRGBO(211, 129, 242, 1)),
                      hintText: "Adresse mail",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(141, 141, 141, 0.35)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(166, 156, 169, 1)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (value) {
                      _email = value!;
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(211, 129, 242, 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color.fromRGBO(211, 129, 242, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: "Mot de passe",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(141, 141, 141, 0.35)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(166, 156, 169, 1))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entrez votre mot de passe";
                      }
                      if (value.length < 8) {
                        return "entrez 8 caracteres au min";
                      }
                      return null;
                    },
                    onSaved: (vaue) {
                      _mdp = vaue!;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 180),
                    child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Mot de passe oublié?",
                          style: TextStyle(
                            color: Color.fromARGB(160, 42, 54, 95),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: (() {
                if (_formKey.currentState!.validate() &&
                    _formKey1.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _formKey1.currentState!.save();
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return menu();
                  }));
                }
              }),
              // ignore: prefer_const_constructors
              child: Text(
                "Se connecter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: noire2,
                  padding:
                      EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 20),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Vous n'avez pas de compte ?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: mauve2,
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return inscrip();
                  }));
                },
                child: Text(
                  "Inscription",
                  style: TextStyle(
                      color: blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ]),
        ),
      ),
    ));
  }
}
