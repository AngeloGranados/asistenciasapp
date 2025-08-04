import 'package:asistenciasapp/models/persona_model.dart';
import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:asistenciasapp/widgets/text_container_persona.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonaDetallesPage extends StatefulWidget {

  RegistradosModel personaReg;

  PersonaDetallesPage({required this.personaReg});

  @override
  State<PersonaDetallesPage> createState() => _PersonaDetallesPageState();
}

class _PersonaDetallesPageState extends State<PersonaDetallesPage> {
  CollectionReference _personaReference = FirebaseFirestore.instance.collection("PERSONAS");
  CollectionReference _asistenciasReference = FirebaseFirestore.instance.collection("ASISTENCIAS");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Icon(Icons.person),
          SizedBox(width: 10),
          Text("Participante", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ), backgroundColor: Colors.green), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: 
          StreamBuilder(
            stream: _personaReference.doc(widget.personaReg.idpersona).snapshots(), 
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasError){
                return Text("ERROR");
              }

              if(!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists){
                return Center(child: CircularProgressIndicator());
              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              final datos = snapshot.data.data();

              PersonaModel persona = PersonaModel.fromMap(datos, widget.personaReg.idpersona);

              if(snapshot.hasData && snapshot.data != null){
                return Column(
                  children: [
                    Icon(Icons.person_pin,size: 200),
                    Text("${widget.personaReg.nombreCompleto}",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(height: 40),
                    TextContainerPersona(tipoField: "int", personaReg: widget.personaReg, campo: "edad", clave: "Edad:", valor: "${persona.edad}", editarEnable: true),
                    TextContainerPersona(tipoField: "int", personaReg: widget.personaReg, campo: "telefono", clave: "Telefono:", valor: "${persona.telefono}",  editarEnable: true),
                    TextContainerPersona(clave: "Fecha de registro:", valor: "${DateFormat("dd/MM/yyyy").format(widget.personaReg.fechaReg.toDate())} - ${DateFormat("HH:mm").format(widget.personaReg.fechaReg.toDate())}",  editarEnable: false),
                    TextContainerPersona(clave: "Ultima modificación:", valor: "${DateFormat("dd/MM/yyyy").format(widget.personaReg.fechaMod.toDate())} - ${DateFormat("HH:mm").format(widget.personaReg.fechaMod.toDate())}", editarEnable: false),
                    TextContainerPersona(personaReg: widget.personaReg, campo: "genero", clave: "Genero", valor: "${persona.genero}",  editarEnable: true),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("ESTADO:"),
                        widget.personaReg.estado ? Row(
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
                    ),
                    SizedBox(height: 60),
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), 
                    onPressed: () async {
                       await _personaReference.doc(persona.id).delete();
                       await _asistenciasReference.doc(widget.personaReg.idasistencia).delete();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text("Participante eliminado correctamente", textAlign: TextAlign.center)));
                      Navigator.pop(context, true);
                    }, child: Center(child: Text("Eliminar participante", style: TextStyle(color: Colors.white))))
                  ],
                );
              }

              return Container();
            }),
      
      ),
    
    );
  }
}