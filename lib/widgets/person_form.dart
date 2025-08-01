import 'package:flutter/material.dart';

class PersonForm extends StatelessWidget {

  TextEditingController nombres;
  TextEditingController apellidos;
  TextEditingController genero;
  TextEditingController edad;
  TextEditingController telefono;

  PersonForm({required this.nombres, required this.apellidos, required this.telefono, required this.edad, required this.genero});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 350, width: 500,
      child: Form(child: Column(
        children: [
          Text("Registrar Persona", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(controller: nombres, decoration: InputDecoration(
            label: Text("Nombres", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          TextField(controller: apellidos, decoration: InputDecoration(
            label: Text("Apellidos", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          Row(
            children: [
              Expanded(
                child: TextField(controller: genero, decoration: InputDecoration(
                  label: Text("genero", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(keyboardType: TextInputType.number, controller: edad, decoration: InputDecoration(
                  label: Text("Edad", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
            ],
          ),
          TextField(controller: telefono, decoration: InputDecoration(
          label: Text("telefono", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)) 
          ))
        ],
      )),
    );
  }
}