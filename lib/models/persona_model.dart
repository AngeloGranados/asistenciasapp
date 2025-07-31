class PersonaModel {
  String apellidos;
  String nombres;
  int dni;
  String genero;

  PersonaModel({required this.apellidos, required this.nombres, required this.dni, required this.genero});

  Map<String, dynamic> toMap(){
    return {
      "nombres" : nombres,
      "apellidos" : apellidos,
      "dni" : dni,
      "genero" : genero 
    };
  }

  factory PersonaModel.fromMap(Map<String, dynamic> map, int id){
    return PersonaModel(
      apellidos: map["apellidos"], 
      nombres: map["nombres"], 
      dni: map["dni"], 
      genero: map["genero"]
    );
  }
}