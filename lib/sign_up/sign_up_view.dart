import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:douaa_project/sign_up/sign_up_viewmodel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../login/login_view.dart';
import '../menu.dart';
import '../widget/style.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  RegisterView({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText1 = true;
  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Form(
            key: _formkey,
            child: Container(
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
                                      image:
                                          AssetImage("assets/images/ww.png"))),
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
                        Column(
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
                                        color:
                                            Color.fromRGBO(166, 156, 169, 1))),
                              ),
                              validator: viewModel.validateText,
                              onChanged: viewModel.setFullName,
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
                                        color:
                                            Color.fromRGBO(166, 156, 169, 1))),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: viewModel.validateEmail,
                              onChanged: viewModel.setEmail,
                            ),
                            SizedBox(height: 30),
                            TextFormField(
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
                                  onPressed: () {},
                                ),
                                hintText: "mot de passe",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(141, 141, 141, 0.35)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(166, 156, 169, 1))),
                              ),
                              validator: viewModel.ValidatePassword,
                              onChanged: viewModel.setPassword,
                            ),
                            SizedBox(height: 30),
                            TextFormField(
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
                                  onPressed: () {},
                                ),
                                hintText: "Confirmer mot de passe",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(141, 141, 141, 0.35)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(166, 156, 169, 1))),
                              ),
                              validator: viewModel.ValidateconfirmPassword,
                              onChanged: viewModel.setConfirmPassword,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              
        await FirebaseFirestore.instance.collection('users').add({
          'nom_user': viewModel.getFullName(),
          'mot_de_passe_user': viewModel.getPassword(),
          'email_user': viewModel.getEmail(),
        });
                              final result = await viewModel.RegisterUser(
                                  viewModel.getEmail(),
                                  viewModel.getPassword(),
                                  viewModel.getFullName(),
                                  context);
                              if (result) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return menu();
                                }));
                              }
                            }
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
            )));
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
