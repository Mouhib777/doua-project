import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:douaa_project/widget/style.dart';

import 'package:flutter/material.dart';


class list_c extends StatefulWidget {
  @override
  list_cState createState() => list_cState();
}

class list_cState extends State<list_c> {
  late String docId;
  late DocumentReference docRef1;
  void _saveData() async {
    // Enregistrer les données dans Firebase Firestore
    String symptoms = '';
    if (_isChecked1) {
      symptoms += 'Crampes /';
    }
    if (_isChecked2) {
      symptoms += 'Fatigue /';
    }
    if (_isChecked3) {
      symptoms += 'Mal de dos /';
    }
    if (_isChecked4) {
      symptoms += 'Maux de tête /';
    }
    if (_isChecked5) {
      symptoms += 'Reflux acide /';
    }
    if (_isChecked6) {
      symptoms += 'Tachycardie /';
    }
    if (_isChecked7) {
      symptoms += 'Acouphénes' + '/';
    }
    if (_isChecked8) {
      symptoms += 'Affaiblissement /';
    }
    if (_isChecked9) {
      symptoms += 'Agitation' + '/';
    }
    if (_isChecked10) {
      symptoms += 'Allergies' + '/';
    }
    if (_isChecked11) {
      symptoms += 'Anxiété' + '/';
    }
    if (_isChecked12) {
      symptoms += 'Apathie' + '/';
    }
    if (_isChecked13) {
      symptoms += 'Ascite' + '/';
    }
    if (_isChecked14) {
      symptoms += 'Ballonnements' + '/';
    }
    if (_isChecked15) {
      symptoms += 'Bleusseures au pied' + '/';
    }
    if (_isChecked16) {
      symptoms += 'Bouche séche' + '/';
    }
    if (_isChecked17) {
      symptoms += 'Bouffées de chaleur' + '/';
    }
    if (_isChecked18) {
      symptoms += 'Bruouillard cérébral' + '/';
    }
    if (_isChecked19) {
      symptoms += 'Chutes' + '/';
    }
    if (_isChecked20) {
      symptoms += 'Conjonctivite' + '/';
    }
    if (_isChecked21) {
      symptoms += 'Constipation' + '/';
    }
    if (_isChecked22) {
      symptoms += 'Crampes abdominales' + '/';
    }
    if (_isChecked23) {
      symptoms += 'Crise' + '/';
    }
    if (_isChecked24) {
      symptoms += 'Crise de panique' + '/';
    }
    if (_isChecked25) {
      symptoms += 'Diarrhée ' + '/';
    }
    if (_isChecked26) {
      symptoms += 'Douleur' + '/';
    }
    if (_isChecked27) {
      symptoms += 'Douleur abdominale' + '/';
    }
    if (_isChecked28) {
      symptoms += 'Douleur articulaire' + '/';
    }
    if (_isChecked29) {
      symptoms += 'Douleur au fessier' + '/';
    }
    if (_isChecked30) {
      symptoms += 'Douleur au fessier droit' + '/';
    }
    if (_isChecked31) {
      symptoms += 'Douleur au fessier gauche' + '/';
    }
    if (_isChecked32) {
      symptoms += 'Douleur au genou' + '/';
    }
    if (_isChecked33) {
      symptoms += 'Douleur au poignet' + '/';
    }
    if (_isChecked34) {
      symptoms = 'Douleur dans le bas du dos' + '/';
    }
    if (_isChecked35) {
      symptoms = 'Douleur dans le haut du dos' + '/';
    }
    if (_isChecked36) {
      symptoms = 'Douleur de poitrine' + '/';
    }
    if (_isChecked37) {
      symptoms = 'Douleur du cou' + '/';
    }
    if (_isChecked38) {
      symptoms = 'Douleur musculaire' + '/';
    }
    if (_isChecked39) {
      symptoms = 'Douleur à la cheville' + '/';
    }
    if (_isChecked40) {
      symptoms = 'Douleur dans les ganglionslymphatiques(glandes)' + '/';
    }
    if (_isChecked41) {
      symptoms = 'Douleurs musculaires et articulaires' + '/';
    }
    if (_isChecked42) {
      symptoms = 'Dysarthrie' + '/';
    }
    if (_isChecked43) {
      symptoms = 'Dysfonction sexuelle' + '/';
    }
    if (_isChecked44) {
      symptoms = 'Dysphagie' + '/';
    }
    if (_isChecked45) {
      symptoms = 'Démangeaison' + '/';
    }
    if (_isChecked46) {
      symptoms = 'Dépression' + '/';
    }
    if (_isChecked47) {
      symptoms = 'Désespoir' + '/';
    }
    if (_isChecked48) {
      symptoms = 'Désespéré(e)' + '/';
    }
    if (_isChecked49) {
      symptoms = 'Désorientation' + '/';
    }
    if (_isChecked50) {
      symptoms = 'Engourdissement' + '/';
    }
    if (_isChecked51) {
      symptoms = 'Essouflement' + '/';
    }
    if (_isChecked52) {
      symptoms = 'Faiblesse' + '/';
    }
    if (_isChecked53) {
      symptoms = 'Fatigure mentale' + '/';
    }
    if (_isChecked54) {
      symptoms = 'Fiévre' + '/';
    }
    if (_isChecked55) {
      symptoms = 'Frustration' + '/';
    }
    if (_isChecked56) {
      symptoms = 'Glaires' + '/';
    }
    if (_isChecked57) {
      symptoms = 'Gonflement des articulations' + '/';
    }
    if (_isChecked58) {
      symptoms = 'Gonflement des jambes, pieds et chevilles' + '/';
    }
    if (_isChecked59) {
      symptoms = 'Gueule de bois' + '/';
    }
    if (_isChecked60) {
      symptoms = 'Humeur dépressive' + '/';
    }
    if (_isChecked61) {
      symptoms = 'Hypertension' + '/';
    }
    if (_isChecked62) {
      symptoms = 'Hyperventilation' + '/';
    }
    if (_isChecked63) {
      symptoms = 'Hématomes' + '/';
    }
    if (_isChecked64) {
      symptoms = 'Icontinence' + '/';
    }
    if (_isChecked65) {
      symptoms = 'Inquiétude excessive' + '/';
    }
    if (_isChecked66) {
      symptoms = 'Insomnie' + '/';
    }
    if (_isChecked67) {
      symptoms = 'Instabilité émotionnelle' + '/';
    }
    if (_isChecked68) {
      symptoms = "Irritabilité" + '/';
    }
    if (_isChecked69) {
      symptoms = 'Jalousie' + '/';
    }
    if (_isChecked70) {
      symptoms = 'Langueur' + '/';
    }
    if (_isChecked71) {
      symptoms = 'Larmoyant ' + '/';
    }
    if (_isChecked72) {
      symptoms = 'Lassitude' + '/';
    }
    if (_isChecked73) {
      symptoms = 'Léthargie' + '/';
    }
    if (_isChecked74) {
      symptoms = "Mal d'oreille" + '/';
    }
    if (_isChecked75) {
      symptoms = 'Mal de dent' + '/';
    }
    if (_isChecked76) {
      symptoms = 'Mal de gorge' + '/';
    }
    if (_isChecked77) {
      symptoms = 'Mal de tete' + '/';
    }
    if (_isChecked78) {
      symptoms = 'Mal de ventre' + '/';
    }
    if (_isChecked79) {
      symptoms = 'Malheur' + '/';
    }
    if (_isChecked80) {
      symptoms = 'Manque de joie' + '/';
    }
    if (_isChecked81) {
      symptoms = "Manque de motivation" + '/';
    }
    if (_isChecked82) {
      symptoms = 'Mictions fréquentes' + '/';
    }
    if (_isChecked83) {
      symptoms = 'Migraine' + '/';
    }
    if (_isChecked84) {
      symptoms = 'Nausée' + '/';
    }
    if (_isChecked85) {
      symptoms = 'Nervosité' + '/';
    }
    if (_isChecked86) {
      symptoms = "Nez qui coule" + '/';
    }
    if (_isChecked87) {
      symptoms = "Névralgie" + '/';
    }
    if (_isChecked88) {
      symptoms = "oppression autour de la poitrine/de l'abdomen" + '/';
    }
    if (_isChecked89) {
      symptoms = 'Orgelet' + '/';
    }
    if (_isChecked90) {
      symptoms = 'Palpitations' + '/';
    }
    if (_isChecked91) {
      symptoms = 'Paranoia' + '/';
    }
    if (_isChecked92) {
      symptoms = 'Peau séche' + '/';
    }
    if (_isChecked93) {
      symptoms = "Perte d'appétit" + '/';
    }
    if (_isChecked94) {
      symptoms = "Perte d'intéret" + '/';
    }
    if (_isChecked95) {
      symptoms = 'Perte de cheveux' + '/';
    }
    if (_isChecked96) {
      symptoms = 'Perte de gout' + '/';
    }
    if (_isChecked97) {
      symptoms = 'Peur' + '/';
    }
    if (_isChecked98) {
      symptoms = 'Picotements' + '/';
    }
    if (_isChecked99) {
      symptoms = 'Pied tombant' + '/';
    }
    if (_isChecked100) {
      symptoms = "Problémes d'équilibre" + '/';
    }
    if (_isChecked101) {
      symptoms = "Problémes de concentrations" + '/';
    }
    if (_isChecked102) {
      symptoms = "Problémes de mémoire" + '/';
    }
    if (_isChecked103) {
      symptoms = '"Problémes de vessie"' + '/';
    }
    if (_isChecked104) {
      symptoms = 'Paleur' + '/';
    }
    if (_isChecked105) {
      symptoms = 'Pétéchies' + '/';
    }
    if (_isChecked106) {
      symptoms = "Respiration sifflante" + '/';
    }
    if (_isChecked107) {
      symptoms = "Rhume" + '/';
    }
    if (_isChecked108) {
      symptoms = 'Rigidité musculaire' + '/';
    }
    if (_isChecked109) {
      symptoms = 'Rigidité/Spasticité' + '/';
    }
    if (_isChecked110) {
      symptoms = 'Régles' + '/';
    }
    if (_isChecked111) {
      symptoms = "Saignement de nez" + '/';
    }
    if (_isChecked112) {
      symptoms = "Saignement des gencives" + '/';
    }
    if (_isChecked113) {
      symptoms = 'Sang dans les selles' + '/';
    }
    if (_isChecked114) {
      symptoms = "Sautes d'humeur" + '/';
    }
    if (_isChecked115) {
      symptoms = 'Sciatique' + '/';
    }
    if (_isChecked116) {
      symptoms = 'Sciatique (droite)' + '/';
    }
    if (_isChecked117) {
      symptoms = 'Sciatique (gauche)' + '/';
    }
    if (_isChecked118) {
      symptoms = "Sensation de froid" + '/';
    }
    if (_isChecked119) {
      symptoms = "Sensibilité à la lumiére" + '/';
    }
    if (_isChecked120) {
      symptoms = 'Soif excessive' + '/';
    }
    if (_isChecked121) {
      symptoms = 'Somnolence' + '/';
    }
    if (_isChecked122) {
      symptoms = 'Spasme' + '/';
    }
    if (_isChecked123) {
      symptoms = 'Spasmes musculaires' + '/';
    }
    if (_isChecked124) {
      symptoms = 'Spasticité' + '/';
    }
    if (_isChecked125) {
      symptoms = 'Sueurs nocturnes' + '/';
    }
    if (_isChecked126) {
      symptoms = 'Surdité' + '/';
    }
    if (_isChecked127) {
      symptoms = 'Syndrome de Raynaud' + '/';
    }
    if (_isChecked128) {
      symptoms = 'Syndrome de des jambes sans repos' + '/';
    }
    if (_isChecked129) {
      symptoms = "Syndrome prémenstruel(SPM)" + '/';
    }
    if (_isChecked130) {
      symptoms = 'Tension' + '/';
    }
    if (_isChecked131) {
      symptoms = "Tension musculairee" + '/';
    }
    if (_isChecked132) {
      symptoms = "Toux" + '/';
    }
    if (_isChecked133) {
      symptoms = 'Transpiration' + '/';
    }
    if (_isChecked134) {
      symptoms = 'Tremblement' + '/';
    }
    if (_isChecked135) {
      symptoms = 'Tristesse' + '/';
    }
    if (_isChecked136) {
      symptoms = "Troubles de l'ATM(articulation temporo-mandibulaire)" + '/';
    }
    if (_isChecked137) {
      symptoms = "Troubles de la concentration" + '/';
    }
    if (_isChecked138) {
      symptoms = 'Troubles de la marche' + '/';
    }
    if (_isChecked139) {
      symptoms = 'Troubles de la motricité oculaire' + '/';
    }
    if (_isChecked140) {
      symptoms = 'Troubles de la mémoire' + '/';
    }
    if (_isChecked141) {
      symptoms = 'Troubles de la vision' + '/';
    }
    if (_isChecked142) {
      symptoms = 'Troubles du sommeil' + '/';
    }
    if (_isChecked143) {
      symptoms = "Troubles intestinaux" + '/';
    }
    if (_isChecked144) {
      symptoms = "Troubles sexuels" + '/';
    }
    if (_isChecked145) {
      symptoms = '"Troubles vésicaux' + '/';
    }
    if (_isChecked146) {
      symptoms = 'Vertiges' + '/';
    }
    if (_isChecked147) {
      symptoms = "Vide" + '/';
    }
    if (_isChecked148) {
      symptoms = "Vision double" + '/';
    }
    if (_isChecked149) {
      symptoms = "Vision floue" + '/';
    }
    if (_isChecked150) {
      symptoms = "Vomissement" + '/';
    }
    if (_isChecked151) {
      symptoms = "Yeux secs" + '/';
    }
    if (_isChecked152) {
      symptoms = "Epilepsie" + '/';
    }
    if (_isChecked153) {
      symptoms = "Epuisement" + '/';
    }
    if (_isChecked154) {
      symptoms = "Eruptions cutanées(rougeur,gonflemnt)" + '/';
    }
    if (_isChecked155) {
      symptoms = "Etat anxieux" + '/';
    }

    DocumentReference docRef1 =
        await FirebaseFirestore.instance.collection('s').add(
      {'effet': symptoms},
    );
  }

  String _searchText = '';
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  bool _isChecked8 = false;
  bool _isChecked9 = false;
  bool _isChecked10 = false;
  bool _isChecked11 = false;
  bool _isChecked12 = false;
  bool _isChecked13 = false;
  bool _isChecked14 = false;
  bool _isChecked15 = false;
  bool _isChecked16 = false;
  bool _isChecked17 = false;
  bool _isChecked18 = false;
  bool _isChecked19 = false;
  bool _isChecked20 = false;
  bool _isChecked21 = false;
  bool _isChecked22 = false;
  bool _isChecked23 = false;
  bool _isChecked24 = false;
  bool _isChecked25 = false;
  bool _isChecked26 = false;
  bool _isChecked27 = false;
  bool _isChecked28 = false;
  bool _isChecked29 = false;
  bool _isChecked30 = false;
  bool _isChecked31 = false;
  bool _isChecked32 = false;
  bool _isChecked33 = false;
  bool _isChecked34 = false;
  bool _isChecked35 = false;
  bool _isChecked36 = false;
  bool _isChecked37 = false;
  bool _isChecked38 = false;
  bool _isChecked39 = false;
  bool _isChecked40 = false;
  bool _isChecked41 = false;
  bool _isChecked42 = false;
  bool _isChecked43 = false;
  bool _isChecked44 = false;
  bool _isChecked45 = false;
  bool _isChecked46 = false;
  bool _isChecked47 = false;
  bool _isChecked48 = false;
  bool _isChecked49 = false;
  bool _isChecked50 = false;
  bool _isChecked51 = false;
  bool _isChecked52 = false;
  bool _isChecked53 = false;
  bool _isChecked54 = false;
  bool _isChecked55 = false;
  bool _isChecked56 = false;
  bool _isChecked57 = false;
  bool _isChecked58 = false;
  bool _isChecked59 = false;
  bool _isChecked60 = false;
  bool _isChecked61 = false;
  bool _isChecked62 = false;
  bool _isChecked63 = false;
  bool _isChecked64 = false;
  bool _isChecked65 = false;
  bool _isChecked66 = false;
  bool _isChecked67 = false;
  bool _isChecked68 = false;
  bool _isChecked69 = false;
  bool _isChecked70 = false;
  bool _isChecked71 = false;
  bool _isChecked72 = false;
  bool _isChecked73 = false;
  bool _isChecked74 = false;
  bool _isChecked75 = false;
  bool _isChecked76 = false;
  bool _isChecked77 = false;
  bool _isChecked78 = false;
  bool _isChecked79 = false;
  bool _isChecked80 = false;
  bool _isChecked81 = false;
  bool _isChecked82 = false;
  bool _isChecked83 = false;
  bool _isChecked84 = false;
  bool _isChecked85 = false;
  bool _isChecked86 = false;
  bool _isChecked87 = false;
  bool _isChecked88 = false;
  bool _isChecked89 = false;
  bool _isChecked90 = false;
  bool _isChecked91 = false;
  bool _isChecked92 = false;
  bool _isChecked93 = false;
  bool _isChecked94 = false;
  bool _isChecked95 = false;
  bool _isChecked96 = false;
  bool _isChecked97 = false;
  bool _isChecked98 = false;
  bool _isChecked99 = false;
  bool _isChecked100 = false;
  bool _isChecked101 = false;
  bool _isChecked102 = false;
  bool _isChecked103 = false;
  bool _isChecked104 = false;
  bool _isChecked105 = false;
  bool _isChecked106 = false;
  bool _isChecked107 = false;
  bool _isChecked108 = false;
  bool _isChecked109 = false;
  bool _isChecked110 = false;
  bool _isChecked111 = false;
  bool _isChecked112 = false;
  bool _isChecked113 = false;
  bool _isChecked114 = false;
  bool _isChecked115 = false;
  bool _isChecked116 = false;
  bool _isChecked117 = false;
  bool _isChecked118 = false;
  bool _isChecked119 = false;
  bool _isChecked120 = false;
  bool _isChecked121 = false;
  bool _isChecked122 = false;
  bool _isChecked123 = false;
  bool _isChecked124 = false;
  bool _isChecked125 = false;
  bool _isChecked126 = false;
  bool _isChecked127 = false;
  bool _isChecked128 = false;
  bool _isChecked129 = false;
  bool _isChecked130 = false;
  bool _isChecked131 = false;
  bool _isChecked132 = false;
  bool _isChecked133 = false;
  bool _isChecked134 = false;
  bool _isChecked135 = false;
  bool _isChecked136 = false;
  bool _isChecked137 = false;
  bool _isChecked138 = false;
  bool _isChecked139 = false;
  bool _isChecked140 = false;
  bool _isChecked141 = false;
  bool _isChecked142 = false;
  bool _isChecked143 = false;
  bool _isChecked144 = false;
  bool _isChecked145 = false;
  bool _isChecked146 = false;
  bool _isChecked147 = false;
  bool _isChecked148 = false;
  bool _isChecked149 = false;
  bool _isChecked150 = false;
  bool _isChecked151 = false;
  bool _isChecked152 = false;
  bool _isChecked153 = false;
  bool _isChecked154 = false;
  bool _isChecked155 = false;

  List<String> _symptoms = [
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
  List<bool> _symptomsChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> _filteredSymptoms = [];

  void _filterSymptoms(String query) {
    setState(() {
      _filteredSymptoms = _symptoms
          .where(
              (symptom) => symptom.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher...',
        hintStyle: TextStyle(color: noire1),
        border: InputBorder.none,
        icon: Icon(
          size: 22,
          Icons.search,
          color: noire2,
        ),
      ),
      onChanged: (query) {
        _filterSymptoms(query);
      },
    );
  }

  Widget _buildSymptomList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredSymptoms.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(_filteredSymptoms[index]),
          value: _symptomsChecked[index],
          onChanged: (value) {
            setState(() {
              _symptomsChecked[index] = value ?? false;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(220, 187, 127, 219),
          title: _buildSearchBar(),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: green2,
              )),
          shadowColor: Color.fromARGB(255, 140, 99, 150),
          elevation: 20,
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 30),
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: Colors.black12),
          child: FloatingActionButton(
            backgroundColor: green1,
            shape: RoundedRectangleBorder(),
            onPressed: () {
              _saveData();
              Navigator.of(context).pop();
            },
            child: Text("Enregistrer"),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromRGBO(167, 125, 202, 1)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 40, right: 200),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    )),
                Text(
                  "Symptomes fréquents",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 8, 58, 50),
                            blurRadius: 2)
                      ]),
                ),
                _buildSymptomList(),
                CheckboxListTile(
                  title: Text('Crampes'),
                  value: _isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked1 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Fatigue'),
                  value: _isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked2 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mal de dos'),
                  value: _isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked3 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Maux de tete'),
                  value: _isChecked4,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked4 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Reflux acide'),
                  value: _isChecked5,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked5 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Tachycardie'),
                  value: _isChecked6,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked6 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Acouphénes'),
                  value: _isChecked7,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked7 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Affaiblissement'),
                  value: _isChecked8,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked8 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Agitation'),
                  value: _isChecked9,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked9 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Allergies'),
                  value: _isChecked10,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked10 = value ?? false;
                    });
                  },
                ),
                Text(
                  "Plus de symptomes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 8, 58, 50),
                            blurRadius: 2)
                      ]),
                ),
                CheckboxListTile(
                  title: Text('Anxiété'),
                  value: _isChecked11,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked11 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Apathie'),
                  value: _isChecked12,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked12 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Ascite'),
                  value: _isChecked13,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked13 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Ballonnements'),
                  value: _isChecked14,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked14 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Blessures au pied'),
                  value: _isChecked15,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked15 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Bouche séche'),
                  value: _isChecked16,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked16 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Bouffées de chaleur'),
                  value: _isChecked17,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked17 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Brouillard cérébral'),
                  value: _isChecked18,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked18 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Chutes'),
                  value: _isChecked19,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked19 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Conjonctivite'),
                  value: _isChecked20,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked20 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Constipation'),
                  value: _isChecked21,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked21 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Crampes abdominales'),
                  value: _isChecked22,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked22 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Crise'),
                  value: _isChecked23,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked23 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Crise de panique'),
                  value: _isChecked24,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked24 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Diarrhée'),
                  value: _isChecked25,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked25 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur'),
                  value: _isChecked26,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked26 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur abdominale'),
                  value: _isChecked27,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked27 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur articulaire'),
                  value: _isChecked28,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked28 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur au fessier'),
                  value: _isChecked29,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked29 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur au fessier droit'),
                  value: _isChecked30,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked30 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur au fessier gauche'),
                  value: _isChecked31,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked31 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur au genou'),
                  value: _isChecked32,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked32 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur au poignet'),
                  value: _isChecked33,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked33 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur dans le bas du dos'),
                  value: _isChecked34,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked34 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur dans le haut du dos'),
                  value: _isChecked35,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked35 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur de poitrine'),
                  value: _isChecked36,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked36 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur du cou'),
                  value: _isChecked37,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked37 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur musculaire'),
                  value: _isChecked38,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked38 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleur à la cheville'),
                  value: _isChecked39,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked39 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title:
                      Text('Douleur dans les ganglionslymphatiques(glandes)'),
                  value: _isChecked40,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked40 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Douleurs musculaires et articulaires'),
                  value: _isChecked41,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked41 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Dysarthrie'),
                  value: _isChecked42,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked42 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Dysfonction sexuelle'),
                  value: _isChecked43,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked43 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Dysphagie'),
                  value: _isChecked44,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked44 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Démangeaison'),
                  value: _isChecked45,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked45 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Dépression'),
                  value: _isChecked46,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked46 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Désespoir'),
                  value: _isChecked47,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked47 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Désespéré(e)'),
                  value: _isChecked48,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked48 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Désorientation'),
                  value: _isChecked49,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked49 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Engourdissement'),
                  value: _isChecked50,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked50 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Essouflement'),
                  value: _isChecked51,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked51 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Faiblesse'),
                  value: _isChecked52,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked52 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Fatigure mentale'),
                  value: _isChecked53,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked53 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Fiévre'),
                  value: _isChecked54,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked54 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Frustration'),
                  value: _isChecked55,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked55 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Glaires'),
                  value: _isChecked56,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked56 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gonflement des articulations'),
                  value: _isChecked57,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked57 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gonflement des jambes, pieds et chevilles'),
                  value: _isChecked58,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked58 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gueule de bois'),
                  value: _isChecked59,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked59 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Humeur dépressive'),
                  value: _isChecked60,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked60 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Hypertension'),
                  value: _isChecked61,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked61 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Hyperventilation'),
                  value: _isChecked62,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked62 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Hématomes'),
                  value: _isChecked63,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked63 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Icontinence'),
                  value: _isChecked64,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked64 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Inquiétude excessive'),
                  value: _isChecked65,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked65 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Insomnie'),
                  value: _isChecked66,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked66 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Instabilité émotionnelle'),
                  value: _isChecked67,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked67 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Irritabilité'),
                  value: _isChecked68,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked68 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Jalousie'),
                  value: _isChecked69,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked69 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Langueur'),
                  value: _isChecked70,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked70 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Larmoyant'),
                  value: _isChecked71,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked71 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Lassitude'),
                  value: _isChecked72,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked72 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Léthargie'),
                  value: _isChecked73,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked73 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Mal d'oreille"),
                  value: _isChecked74,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked74 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mal de dent'),
                  value: _isChecked75,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked75 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mal de gorge'),
                  value: _isChecked76,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked76 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mal de tete'),
                  value: _isChecked77,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked77 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mal de ventre'),
                  value: _isChecked78,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked78 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Malheur'),
                  value: _isChecked79,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked79 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Manque de joie'),
                  value: _isChecked80,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked80 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Manque de motivation'),
                  value: _isChecked81,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked81 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Mictions fréquentes'),
                  value: _isChecked82,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked82 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Migraine'),
                  value: _isChecked83,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked83 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Nausée'),
                  value: _isChecked84,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked84 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Nervosité'),
                  value: _isChecked85,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked85 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Nez qui coule'),
                  value: _isChecked86,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked86 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Névralgie'),
                  value: _isChecked87,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked87 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("oppression autour de la poitrine/de l'abdomen"),
                  value: _isChecked88,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked88 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Orgelet"),
                  value: _isChecked89,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked89 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Palpitations"),
                  value: _isChecked90,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked90 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Paranoia"),
                  value: _isChecked91,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked91 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Peau séche"),
                  value: _isChecked92,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked92 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Perte d'appétit"),
                  value: _isChecked93,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked93 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Perte d'intéret"),
                  value: _isChecked94,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked94 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Perte de cheveux"),
                  value: _isChecked95,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked95 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Perte de gout"),
                  value: _isChecked96,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked96 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Peur"),
                  value: _isChecked97,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked97 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Picotements"),
                  value: _isChecked98,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked98 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Pied tombant"),
                  value: _isChecked99,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked99 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Problémes d'équilibre"),
                  value: _isChecked100,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked100 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Problémes de concentrations"),
                  value: _isChecked101,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked101 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Problémes de mémoire"),
                  value: _isChecked102,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked102 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Problémes de vessie"),
                  value: _isChecked103,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked103 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Paleur"),
                  value: _isChecked104,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked104 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Pétéchies"),
                  value: _isChecked105,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked105 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Respiration sifflante"),
                  value: _isChecked106,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked106 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Rhume"),
                  value: _isChecked107,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked107 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Rigidité musculaire"),
                  value: _isChecked108,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked108 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Rigidité/Spasticité"),
                  value: _isChecked109,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked109 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Régles"),
                  value: _isChecked110,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked110 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Saignement de nez"),
                  value: _isChecked111,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked111 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Saignement des gencives"),
                  value: _isChecked112,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked112 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sang dans les selles"),
                  value: _isChecked113,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked113 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sautes d'humeur"),
                  value: _isChecked114,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked114 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sciatique"),
                  value: _isChecked115,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked115 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sciatique (droite)"),
                  value: _isChecked116,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked116 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sciatique (gauche)"),
                  value: _isChecked117,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked117 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sensation de froid"),
                  value: _isChecked118,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked118 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sensibilité à la lumiére"),
                  value: _isChecked119,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked119 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Soif excessive"),
                  value: _isChecked120,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked120 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Somnolence"),
                  value: _isChecked121,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked121 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Spasme"),
                  value: _isChecked122,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked122 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Spasmes musculaires"),
                  value: _isChecked123,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked123 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Spasticité"),
                  value: _isChecked124,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked124 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sueurs nocturnes"),
                  value: _isChecked125,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked125 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Surdité"),
                  value: _isChecked126,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked126 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Syndrome de Raynaud"),
                  value: _isChecked127,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked127 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Syndrome de des jambes sans repos"),
                  value: _isChecked128,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked128 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Syndrome prémenstruel(SPM)"),
                  value: _isChecked129,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked129 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tension"),
                  value: _isChecked130,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked130 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tension musculaire"),
                  value: _isChecked131,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked131 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Toux"),
                  value: _isChecked132,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked132 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Transpiration"),
                  value: _isChecked133,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked133 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tremblement"),
                  value: _isChecked134,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked134 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tristesse"),
                  value: _isChecked135,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked135 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                      "Troubles de l'ATM(articulation temporo-mandibulaire)"),
                  value: _isChecked136,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked136 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles de la concentration"),
                  value: _isChecked137,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked137 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles de la marche"),
                  value: _isChecked138,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked138 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles de la motricité oculaire"),
                  value: _isChecked139,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked139 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles de la mémoire"),
                  value: _isChecked140,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked140 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles de la vision"),
                  value: _isChecked141,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked141 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles du sommeil"),
                  value: _isChecked142,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked142 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles intestinaux"),
                  value: _isChecked143,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked143 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles sexuels"),
                  value: _isChecked144,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked144 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troubles vésicaux"),
                  value: _isChecked145,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked145 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Vertiges"),
                  value: _isChecked146,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked146 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Vide"),
                  value: _isChecked147,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked147 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Vision double"),
                  value: _isChecked148,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked148 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Vision floue"),
                  value: _isChecked149,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked149 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Vomissement"),
                  value: _isChecked150,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked150 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Yeux secs"),
                  value: _isChecked151,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked151 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Epilepsie"),
                  value: _isChecked152,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked152 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Epuisement"),
                  value: _isChecked153,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked153 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Eruptions cutanées(rougeur,gonflemnt)"),
                  value: _isChecked154,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked154 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Etat anxieux"),
                  value: _isChecked155,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked155 = value ?? false;
                    });
                  },
                ),
                _buildSymptomList(),
              ],
            ),
          ),
        ));
  }
}
