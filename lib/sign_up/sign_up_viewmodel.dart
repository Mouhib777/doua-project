

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  
  String getPassword() {
    return _password;
  }

  String getCONFIRMPassword() {
    return _ConfirmPassword;
  }

  String getEmail() {
    return _email;
  }

  String getFullName() {
    return _fullName;
  }

  setPassword(String password) {
    _password = password;
    print('Password: ${getPassword()}');
  }

  setEmail(String email) {
    _email = email;
    print('Email: ${getEmail()}');
  }

  setFullName(String FullName) {
    _fullName = FullName;
    print('Full Name: ${getFullName()}');
  }

  setConfirmPassword(String ConfirmPassword) {
    _ConfirmPassword = ConfirmPassword;
    print('Confirm Password: ${getCONFIRMPassword()}');
  }

  late String _password;
  late String _email;
  late String _fullName;
  late String _ConfirmPassword;
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    } else if (!EmailValidator.validate(value)) {
      return 'Veuillez entrer une adresse email valide';
    } else {
      return null;
    }
  }

  String? ValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Ce champ ne peut pas être vide";
    } else if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    } else {
      return null;
    }
  }

  String? ValidateconfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Ce champ ne peut pas être vide";
    }
    if (value != _password) {
      return "Les mots de passe ne correspondent pas";
    }
    return null;
  }

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "Ce champ ne peut pas être vide";
    }
    if (value.length < 2) {
      return 'Le champ doit contenir au moins 3 caractères';
    }
    return null;
  }

  Future<bool> RegisterUser(
      String email, String password, String name, BuildContext context) async {
    setBusy(true);
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      user?.updateDisplayName(name);
      setBusy(false);
      return true;
    } catch (error) {
      setBusy(false);
      if (error is FirebaseAuthException) {
        if (error.code == 'email-already-in-use') {
          // Afficher la boîte de dialogue ici
          // Exemple :
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Erreur',
            desc: 'Un compte avec cet email existe déjà.',
            btnOkOnPress: () {},
          ).show();
        }
      }
      return false;
    }
  }
}
