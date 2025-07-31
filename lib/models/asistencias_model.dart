import 'package:cloud_firestore/cloud_firestore.dart';

class AsistenciasModel {
  String idevento;
  String idpersona;
  Timestamp fecha;
  bool estado;

  AsistenciasModel({required this.idpersona, required this.idevento, required this.estado, required this.fecha}); 

  Map<String, dynamic> toMap(){
    return {
      "idevento" : idevento,
      "idpersona" : idpersona,
      "fecha" : fecha,
      "estado" : estado
    };
  }

  factory AsistenciasModel.fromMap(Map<String,dynamic> map, int id){
    return AsistenciasModel(
      idpersona: map["idevento"], 
      idevento: map["idpersona"], 
      estado: map["fecha"], 
      fecha: map["estado"]
    );
  }
}