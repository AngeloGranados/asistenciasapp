import 'package:cloud_firestore/cloud_firestore.dart';

class RegistradosModel {
  String idasistencia;
  String idevento;
  String idpersona;
  String nombreCompleto;
  Timestamp fechaReg;
  int telefono;
  bool estado;

  RegistradosModel({required this.idasistencia, required this.idevento, required this.idpersona, required this.estado, required this.nombreCompleto, required this.fechaReg, required this.telefono});

  factory RegistradosModel.fromMap(Map<String,dynamic> map){
    return RegistradosModel(
      idasistencia: map['idasistencia'],
      idevento: map['idevento'], 
      idpersona: map['idpersona'], 
      estado: map['estado'], 
      nombreCompleto: map['nombreCompleto'],
      telefono: map['telefono'],
      fechaReg: map['fechaReg']
    );
  }
}