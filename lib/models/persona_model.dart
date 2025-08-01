import 'package:cloud_firestore/cloud_firestore.dart';

class PersonaModel {
  String id;
  String apellidos;
  String nombres;
  int telefono;
  String genero;
  Timestamp fechaReg;

  PersonaModel({required this.id, required this.apellidos, required this.nombres, required this.telefono, required this.genero, required this.fechaReg});

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "nombres" : nombres,
      "apellidos" : apellidos,
      "telefono" : telefono,
      "genero" : genero,
      "fechaReg" : fechaReg 
    };
  }

  factory PersonaModel.fromMap(Map<String, dynamic> map, String id){
    return PersonaModel(
      id: id,
      apellidos: map["apellidos"], 
      nombres: map["nombres"], 
      telefono: map["telefono"], 
      genero: map["genero"],
      fechaReg: map["fechaReg"]
    );
  }

  static bool validarPersona({nombresController, apellidosController, telefonoController, generoController, fechaRegController, edadController}){
    return nombresController.isEmpty || apellidosController.isEmpty || telefonoController.toString().isEmpty || generoController.isEmpty || int.tryParse(telefonoController) == null || int.tryParse(edadController) == null;
  }
}