import 'package:asistenciasapp/widgets/card-event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  CollectionReference _eventos = FirebaseFirestore.instance.collection("EVENTOS");

  @override
  Widget build(BuildContext context) {

    void showDialogFormEvent(BuildContext context){
      showDialog(
        context: context, 
        builder: (BuildContext context)=>AlertDialog(
          title: Text("Registrar Evento"),
          content: Text("contenido"),
          actions: [
            MaterialButton(onPressed: (){},child: Text("Guardar")),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
            },child: Text("Cancelar"))
          ],
        ));
    }

    return Scaffold(
      floatingActionButton: CircleAvatar(backgroundColor: Colors.green, child: IconButton(onPressed: ()=> showDialogFormEvent(context),color: Colors.white, icon: Icon(Icons.calendar_month))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Text("Eventos", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            StreamBuilder(
              stream: _eventos.snapshots(), 
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return CardEvent(showDialogFormEvent);
                }

                return CircularProgressIndicator();
              }
            )        
          ],
        ),
      ),
    );
  }
}