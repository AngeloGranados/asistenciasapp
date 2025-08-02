import 'package:asistenciasapp/models/persona_model.dart';
import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AsistenciasModel {
  String id;
  String idevento;
  String idpersona;
  Timestamp fecha;
  Timestamp fechaMod;
  bool estado;

  AsistenciasModel({required this.fechaMod, required this.id, required this.idpersona, required this.idevento, required this.estado, required this.fecha}); 

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "idevento" : idevento,
      "idpersona" : idpersona,
      "fecha" : fecha,
      "fechaMod" : fechaMod,
      "estado" : estado
    };
  }

  factory AsistenciasModel.fromMap(Map<String,dynamic> map, String id){
    return AsistenciasModel(
      id: id,
      idpersona: map["idpersona"], 
      fechaMod: map["fechaMod"],
      idevento: map["idevento"], 
      estado: map["estado"], 
      fecha: map["fecha"]
    );
  }

  static Future setEstado(bool estado, String id) async{
    CollectionReference _asistenciaReference = FirebaseFirestore.instance.collection("ASISTENCIAS");
    await _asistenciaReference.doc(id).update({"estado" : estado});
    await _asistenciaReference.doc(id).update({"fechaMod": DateTime.now()});
  }

  static Future<List<RegistradosModel>> getRegistrados(String idevento, bool estado) async{

    CollectionReference _asistenciaReference = FirebaseFirestore.instance.collection("ASISTENCIAS");
    QuerySnapshot asistenciasDocs =  await _asistenciaReference.where("idevento" , isEqualTo: idevento).get(); 
    List<DocumentSnapshot> asistenciaById = asistenciasDocs.docs;

    List<AsistenciasModel> asistaux = asistenciaById.map((asist)=> AsistenciasModel.fromMap(asist.data() as Map<String,dynamic>, asist.id)).toList();
    List<RegistradosModel> registrados = [];
    for(var value in asistaux){
      CollectionReference _personaReference = FirebaseFirestore.instance.collection("PERSONAS");
      QuerySnapshot personasDocs = await _personaReference.where("id", isEqualTo: value.idpersona).get();
      PersonaModel personaById = personasDocs.docs.map((persona)=> PersonaModel.fromMap(persona.data() as Map<String,dynamic>, persona.id)).toList()[0];
      RegistradosModel registrado = RegistradosModel(
        idasistencia: value.id,
        idevento: value.idevento, 
        fechaMod: value.fechaMod,
        idpersona: value.idpersona, 
        estado: value.estado, 
        genero: personaById.genero,
        edad: personaById.edad,
        nombreCompleto: "${personaById.nombres} ${personaById.apellidos}",
        fechaReg: personaById.fechaReg,
        telefono: personaById.telefono
      );
      registrados.add(registrado);
    }

    return registrados.where((registrado) => registrado.estado == estado).toList();
  }
}