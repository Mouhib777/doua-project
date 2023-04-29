import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:douaa_project/widget/style.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login/login_view.dart';
import 'menu.dart';

class inscrip extends StatefulWidget {
  const inscrip({super.key});

  @override
  State<inscrip> createState() => _inscripState();
}

class _inscripState extends State<inscrip> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _mdp = '';
  String _cmdp = '';

  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  bool _obscureText = true;
  bool _obscureText1 = true;
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return menu();
      }));

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _mdp);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': _name,
          'email': _email,
        });
        // Navigate to the home screen after successful registration

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "Erreur",
              body: Text('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "Erreur",
              body: Text('The account already exists for that email.'));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
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
                            color: Color.fromRGBO(7, 87, 84, 1),
                            width: 8,
                          ),
                          image: DecorationImage(
                              image: AssetImage("image/ww.png"))),
                    ),
                  ],
                ),
                Text(
                  "Insicrivez-vous!",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "BreeSerif-Regular",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      shadows: [Shadow(color: mauve2, blurRadius: 5)]),
                ),
                SizedBox(height: 20),
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(243, 243, 243, 1),
                          prefixIcon: Icon(Icons.person,
                              color: Color.fromRGBO(211, 129, 242, 1)),
                          hintText: "Nom et prénom",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(141, 141, 141, 0.35)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(166, 156, 169, 1))),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "entrez votre nom";
                          }
                          return null;
                        },
                        onSaved: (na) {
                          _name = na!;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(243, 243, 243, 1),
                            prefixIcon: Icon(Icons.mail,
                                color: Color.fromRGBO(211, 129, 242, 1)),
                            hintText: "Adresse mail",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(141, 141, 141, 0.35)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(166, 156, 169, 1))),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ce champ ne peut pas être vide';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Veuillez entrer une adresse email valide';
                            } else {
                              return null;
                            }
                            // ignore: dead_code
                            onSaved:
                            (val) {
                              _email = val;
                            };
                          }),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(243, 243, 243, 1),
                          prefixIcon: Icon(Icons.lock,
                              color: Color.fromRGBO(211, 129, 242, 1)),
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
                          hintText: "mot de passe",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(141, 141, 141, 0.35)),
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
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureText1,
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
                                _obscureText1 = !_obscureText1;
                              });
                            },
                          ),
                          hintText: "Confirmer mot de passe",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(141, 141, 141, 0.35)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(166, 156, 169, 1))),
                        ),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "Les mots de passe ne correspondent pas";
                          }
                          return null;
                        },
                        onSaved: (vae) {
                          _cmdp = vae!;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  child: Text(
                    "Inscription",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: noire2,
                      padding: EdgeInsets.only(
                          top: 7, bottom: 7, left: 15, right: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      elevation: 20),
                ),
                Padding(padding: EdgeInsets.all(10)),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LoginView();
                    }));
                  },
                  child: Text(
                    "Retourner à la page connexion",
                    style: TextStyle(
                        color: Color.fromARGB(255, 13, 0, 196),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ]))),
    ));
  }
}

class $_email {}
