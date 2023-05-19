import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class aujourdhui_med extends StatefulWidget {
  const aujourdhui_med({super.key});

  @override
  State<aujourdhui_med> createState() => _aujourdhui_medState();
}

class _aujourdhui_medState extends State<aujourdhui_med> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos medicament pour aujourd'hui"),
      ),
    );
  }
}
