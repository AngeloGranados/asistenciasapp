import 'package:asistenciasapp/models/persona_model.dart';
import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:asistenciasapp/widgets/text_container_persona.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonaDetallesPage extends StatelessWidget {

  RegistradosModel personaReg;

  PersonaDetallesPage({required this.personaReg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Participante", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.green), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Icon(Icons.person,size: 200),
            Text("${personaReg.nombreCompleto}",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 40),
            TextContainerPersona(clave: "Edad:", valor: "${personaReg.edad}"),
            TextContainerPersona(clave: "Telefono:", valor: "${personaReg.telefono}"),
            TextContainerPersona(clave: "Fecha de registro:", valor: "${DateFormat("dd/MM/yyyy").format(personaReg.fechaReg.toDate())} - ${DateFormat("HH:mm").format(personaReg.fechaReg.toDate())}"),
            TextContainerPersona(clave: "Ultima modificación:", valor: "${DateFormat("dd/MM/yyyy").format(personaReg.fechaMod.toDate())} - ${DateFormat("HH:mm").format(personaReg.fechaMod.toDate())}"),
            TextContainerPersona(clave: "Genero", valor: "${personaReg.genero}"),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("ESTADO:"),
                personaReg.estado ? Row(
                  children: [
                    Text("ASISTIÓ", style: TextStyle(color: Colors.green)),
                    SizedBox(width: 5),
                    Icon(Icons.check, color: Colors.green,)
                  ],
                ) : Row(
                  children: [
                    Text("NO ASISTIÓ", style: TextStyle(color: Colors.red)),
                    SizedBox(width: 5),
                    Icon(Icons.cancel, color: Colors.red)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    
    );
  }
}