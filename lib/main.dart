import 'package:asistenciasapp/firebase_options.dart';
import 'package:asistenciasapp/pages/asistencia_page.dart';
import 'package:asistenciasapp/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}

