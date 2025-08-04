import 'package:cloud_firestore/cloud_firestore.dart';

class RegistradosModel {
  String idasistencia;
  String idevento;
  String idpersona;
  String nombreCompleto;
  Timestamp fechaReg;
  Timestamp fechaMod;
  int telefono;
  int edad;
  String genero;
  bool estado;

  RegistradosModel({required this.fechaMod, required this.genero, required this.edad, required this.idasistencia, required this.idevento, required this.idpersona, required this.estado, required this.nombreCompleto, required this.fechaReg, required this.telefono});

  factory RegistradosModel.fromMap(Map<String,dynamic> map){
    return RegistradosModel(
      idasistencia: map['idasistencia'],
      idevento: map['idevento'], 
      idpersona: map['idpersona'], 
      fechaMod: map['fechaMod'],
      estado: map['estado'],
      edad: map['edad'], 
      genero: map['genero'],
      nombreCompleto: map['nombreCompleto'],
      telefono: map['telefono'],
      fechaReg: map['fechaReg']
    );
  }

    RegistradosModel copyWith({
    required int edad,
    required int telefono,
    required String genero,
  }) {
    return RegistradosModel(
      idasistencia: this.idasistencia,
      idevento: this.idevento, 
      idpersona: this.idpersona, 
      fechaMod: this.fechaMod,
      estado: this.estado,
      edad: edad, 
      genero: genero,
      nombreCompleto: this.nombreCompleto,
      telefono: telefono,
      fechaReg: this.fechaReg
    );
  }
}