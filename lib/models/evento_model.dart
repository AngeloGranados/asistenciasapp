import 'package:cloud_firestore/cloud_firestore.dart';

class EventoModel {
  String id;
  String nombre;
  String direccion;
  Timestamp? fecha;

  EventoModel({required this.id, required this.nombre, required this.direccion, required this.fecha});

  factory EventoModel.fromMap(Map<String, dynamic> map, String id){
    return EventoModel(
      id : map['id'] ?? "",
      nombre: map['nombre'], 
      direccion: map['direccion'], 
      fecha: map['fecha']);
  }
  
  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "nombre" : nombre,
      "direccion" : direccion,
      "fecha" : fecha
    };
  }

  static Future<void> eliminarEvento(String idevento) async{
    CollectionReference _evento = FirebaseFirestore.instance.collection("EVENTOS");
    CollectionReference _personas = FirebaseFirestore.instance.collection("PERSONAS");
    CollectionReference _asistencias = FirebaseFirestore.instance.collection("ASISTENCIAS");

    QuerySnapshot asistencia = await _asistencias.where("idevento", isEqualTo: idevento).get();
    List<DocumentSnapshot> asistenciaTodelete = asistencia.docs; 

    for(var value in asistenciaTodelete){
      final asistmap = value.data() as Map<String, dynamic>;
      _personas.doc(asistmap['idpersona']).delete();
      _asistencias.doc(value.id).delete();
    }
    await _evento.doc(idevento).delete();
  }

  static bool validadEvento(
    {
      nombreController,
      direccionController,
      fechaController
    }
  ){
    return nombreController.isEmpty || fechaController == null || direccionController.isEmpty;
  } 
}