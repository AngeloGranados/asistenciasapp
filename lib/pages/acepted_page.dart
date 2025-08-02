import 'package:asistenciasapp/models/asistencias_model.dart';
import 'package:asistenciasapp/models/evento_model.dart';
import 'package:asistenciasapp/widgets/card-person.dart';
import 'package:flutter/material.dart';

class AceptedPage extends StatelessWidget {
  
  EventoModel eventM;
  AceptedPage({required this.eventM});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 20),
      child: FutureBuilder(
        future: AsistenciasModel.getRegistrados(eventM.id, true),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError){
            return Text("ERROR:${snapshot.error}");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.data.length == 0){
            return Center(child: Text("No se encontraron datos"));
          }
          return ListView.separated(
          itemBuilder: (context, index){
            return CardPerson(personRegisted: snapshot.data[index]);
          }, 
          separatorBuilder: (context, index)=>SizedBox(height: 20), 
          itemCount: snapshot.data.length);
        })
    );
  }
}