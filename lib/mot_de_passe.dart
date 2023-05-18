
import 'package:douaa_project/login/login_view.dart';
import 'package:douaa_project/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login/login_viewmodel.dart';

class forgetpasswordpage extends StatefulWidget {
  const forgetpasswordpage({Key? key}) : super(key: key);

  @override
  _forgetpasswordpageState createState() => _forgetpasswordpageState();
}

class _forgetpasswordpageState extends State<forgetpasswordpage> {
  TextEditingController _forgotPasswordController = TextEditingController();
  final viewModel = LoginViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(255, 151, 150, 151),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(margin: EdgeInsets.only(right: 70), child: Text("Réinitialisation de mot de passe", textAlign: TextAlign.start,style:TextStyle ( fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: noire2,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),) ,),
              
                        SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Veuillez entrer l'adresse e-mail associée à votre compte, et nous vous enverrons un e-mail contenant des instructions pour réinitialiser votre mot de passe.",
                textAlign: TextAlign.start,  style: TextStyle(
                        
                        fontSize: 17,
                        color: noire2,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(margin: EdgeInsets.only(right: 200),child: Text("Adresse email",style:TextStyle ( fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: noire2,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(color: mauve1, blurRadius: 3)]),),),
            
                         SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: noire1,
                      blurRadius: 20,
                      offset: Offset(0, 10)),
                ],
              ),
              
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: noire1,
                  ),
                  hintText: "EMAIL",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
                validator:
                    viewModel.validateEmail, // call validateEmail on viewModel
                onChanged: viewModel.setEmail,
                controller: _forgotPasswordController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var forgotemail = _forgotPasswordController.text.trim();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgotemail);
                  print("email sent!");
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                } on FirebaseAuthException catch (e) {
                  print("error $e");
                }
              },
              child: Text('Envoyer les instructions '),
               style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 151, 150, 151),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 40, right: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 20),
            )
          ],
        ));
  }
}
