import 'package:asistenciasapp/widgets/card-person.dart';
import 'package:flutter/material.dart';

class AceptedPage extends StatelessWidget {
  const AceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 20),
      child: Column(
        spacing: 10,
        children: [
          CardPerson(),
          CardPerson(),
          CardPerson(),
        ],
      ),
    );
  }
}