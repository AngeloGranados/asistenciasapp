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
}