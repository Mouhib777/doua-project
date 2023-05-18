import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../menu.dart';
import '../mot_de_passe.dart';
import '../sign_up/sign_up_view.dart';
import '../widget/style.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Form(
      key: _formKey,
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
                        image: DecorationImage(
                            image: AssetImage("assets/images/ww.png"))),
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
              Column(
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
                    validator: viewModel.validateEmail,
                    onChanged: viewModel.setEmail,
                  )
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                 TextFormField(
  obscureText: viewModel.obscureText,
  decoration: InputDecoration(
    filled: true,
    fillColor: Color.fromRGBO(243, 243, 243, 1),
    prefixIcon: Icon(
      Icons.lock,
      color: Color.fromRGBO(211, 129, 242, 1),
    ),
    suffixIcon: IconButton(
      icon: Icon(viewModel.obscureText ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        viewModel.togglePasswordVisibility();
      },
    ),
    hintText: "Mot de passe",
    hintStyle: TextStyle(
      color: Color.fromRGBO(141, 141, 141, 0.35),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Color.fromRGBO(166, 156, 169, 1),
      ),
    ),
  ),
  validator: viewModel.ValidatePassword,
  onChanged: viewModel.setPassword,
),

                  Container(
                    margin: EdgeInsets.only(left: 180),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return forgetpasswordpage();
                          }));
                        },
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool success = await viewModel.loginUser(
                        viewModel.getEmail(), viewModel.getPassword());
                    if (success) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return menu();
                      }));
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.SCALE,
                        title: 'Erreur de connexion',
                        desc:
                            'Veuillez vérifier vos informations de connexion et réessayer',
                        btnOkOnPress: () {},
                      )..show();
                    }
                  }
                },
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
                      return RegisterView();
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
      ),
    ));
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
  @override
  bool get reactive => false;
}
