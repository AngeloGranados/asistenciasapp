import 'package:asistenciasapp/firebase_options.dart';
import 'package:asistenciasapp/pages/home_page.dart';
import 'package:asistenciasapp/pages/persona_detalles_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [
      const Locale("es"),
      const Locale("en")
    ],
     home: HomePage(), debugShowCheckedModeBanner: false));
}

