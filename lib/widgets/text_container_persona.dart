import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:flutter/material.dart';

class TextContainerPersona extends StatelessWidget {

  String clave;
  String valor;

  TextContainerPersona({required this.clave, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text("$clave", style: TextStyle(fontSize: 16)),
          SizedBox(width: 20),
          Text("$valor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}