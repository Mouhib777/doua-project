import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<dynamic> _symptoms = [
    'Crampes',
    'Fatigue',
    'Mal de dos',
    'Maux de tête',
    'Reflux acide',
    'Tachycardie',
    'Acouphénes',
    'Affaiblissement',
    'Agitation',
    'Allergies',
    'Anxiété',
    'Apathie',
    'Ascite',
    'Ballonnements',
    'Bleusseures au pied',
    'Bouche séche',
    'Bouffées de chaleur',
    'Bruouillard cérébral',
    'chutes',
    'Conjonctivite',
    'Constipation',
    'Crampes abdominales',
    'Crise',
    'Crise de panique',
    'Diarrhée',
    'Douleur',
    'Douleur abdominale',
    'Douleur articulaire',
    'Douleur au fessier',
    'Douleur au fessier droit',
    'Douleur au fessier gauche',
    'Douleur au genou',
    'Douleur au poignet',
    'Douleur dans le bas du dos',
    'Douleur dans le haut du dos',
    'Douleur de poitrine',
    'Douleur du cou',
    'Douleur musculaire',
    'Douleur à la cheville',
    'Douleurs dans les ganglions lymphatiques(glandes)',
    'Douleurs musculaires et articulaires',
    'Dysarthrie',
    'Dysfonction sexuelle',
    'Dysphagie',
    'Démangeaison',
    'Dépression',
    'Désespoir'
        'Désespéré(e)',
    'Désorientation',
    'Engourdissement',
    'Essouflement',
    'Faiblesse',
    'Fatigure mentale',
    'Fiévre',
    'Frustration',
    'Glaires',
    'Gonflement des articulations',
    'Gonflement des jambes, pieds et chevilles',
    'Gueule de bois',
    'Humeur dépressive',
    'Hypertension',
    'Hyperventilation',
    'Hématomes',
    'Icontinence',
    'Inquiétude excessive',
    'Insomnie',
    'Instabilité émotionnelle',
    'Irritabilité',
    'Jalousie',
    'Langueur',
    'Larmoyant',
    'Lassitude',
    'Léthargie',
    "Mal d'oreille",
    'Mal de dent',
    'Mal de gorge',
    'Mal de tete',
    'Mal de ventre',
    'Malheur',
    'Manque de joie',
    'Manque de motivation',
    'Mictions fréquentes',
    'Migraine',
    'Nausée',
    'Nervosité',
    'Nez qui coule',
    'Névralgie',
    "oppression autour de la poitrine/de l'abdomen",
    'Orgelet',
    'Palpitations',
    'Paranoia',
    'Peau séche',
    "Perte d'appétit",
    "Perte d'intéret",
    'Perte de cheveux',
    'Perte de gout',
    'Peur',
    'Picotements',
    'Pied tombant',
    "Problémes d'équilibre",
    'Problémes de concentrations',
    'Problémes de mémoire',
    'Problémes de vessie',
    'Paleur',
    'Pétéchies',
    'Respiration sifflante',
    'Rhume',
    'Rigidité musculaire',
    'Rigidité/Spasticité',
    'Régles',
    'Saignement de nez',
    'Saignement des gencives',
    'Sang dans les selles',
    "Sautes d'humeur",
    "Sciatique",
    'Sciatique (droite)',
    'Sciatique (gauche)',
    'Sensation de froid',
    'Sensibilité à la lumiére',
    'Soif excessive',
    'Somnolence',
    'Spasme',
    'Spasmes musculaires',
    'Spasticité',
    "Sueurs nocturnes",
    'Surdité',
    'Syndrome de Raynaud',
    'Syndrome de des jambes sans repos',
    'Syndrome prémenstruel(SPM)',
    'Tension',
    'Tension musculaire',
    'Toux',
    'Transpiration',
    'Tremblement',
    'Tristesse',
    "Troubles de l'ATM(articulation temporo-mandibulaire)",
    "Troubles de la concentration",
    "Troubles de la marche",
    "Troubles de la motricité oculaire",
    "Troubles de la mémoire",
    "Troubles de la vision",
    "Troubles du sommeil",
    "Troubles intestinaux",
    "Troubles sexuels",
    "Troubles vésicaux",
    "Vertiges",
    "Vide",
    "Vision double",
    "Vision floue",
    "Vomissement",
    'Yeux secs',
    'Epilepsie',
    "Epuisement",
    "Eruptions cutanées(rougeur,gonflemnt)",
    'Etat anxieux',
  ];
  List<String> checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 225, 197, 255),
            Color.fromRGBO(250, 247, 254, 1)
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Checklist'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
          itemCount: _symptoms.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              tileColor: Colors.purple.shade100,
              selectedColor: Colors.purple,
              selectedTileColor: Colors.purple,
              title: Text(_symptoms[index]),
              trailing: Checkbox(
                value: checkedItems.contains(_symptoms[index]),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      checkedItems.add(_symptoms[index]);
                    } else {
                      checkedItems.remove(_symptoms[index]);
                    }
                  });
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            DateTime now = DateTime.now();
            String formattedDate = DateFormat('dd/MM/yyyy').format(now);
            print(formattedDate);
            await FirebaseFirestore.instance.collection("symptomes").doc().set({
              'selected': checkedItems,
              "Datetime": formattedDate,
              "heure_minute":
                  "${DateTime.now().hour} : ${DateTime.now().minute.toString().padLeft(2, '0')}"
            });
          },
          //  () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           CheckedItemsPage(checkedItems: checkedItems),
          //     ),
          //   );
          // },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class CheckedItemsPage extends StatelessWidget {
  final List<String> checkedItems;

  CheckedItemsPage({required this.checkedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checked Items'),
      ),
      body: ListView.builder(
        itemCount: checkedItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(checkedItems[index]),
          );
        },
      ),
    );
  }
}
