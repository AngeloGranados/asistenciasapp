import 'package:cloud_firestore/cloud_firestore.dart';

class EventoModel {
  String nombre;
  String direccion;
  Timestamp? fecha;

  EventoModel({required this.nombre, required this.direccion, required this.fecha});

  factory EventoModel.fromMap(Map<String, dynamic> map, String id){
    return EventoModel(
      nombre: map['nombre'], 
      direccion: map['direccion'], 
      fecha: map['fecha']);
  }
  
  Map<String, dynamic> toMap(){
    return {
      "nombre" : nombre,
      "direccion" : direccion,
      "fecha" : fecha
    };
  }
}