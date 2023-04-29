
import 'package:flutter/material.dart';

import 'login/login_view.dart';
import 'main.dart';

class second extends StatelessWidget {
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 253, 246, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/captureee.png',
              width: 300,
            ),
            SizedBox(height: 30),
            Text(
              'BIENÊTRE',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 11, 59, 62),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 5,
                fontFamily: 'BreeSerif-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
