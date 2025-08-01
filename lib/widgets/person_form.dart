import 'package:flutter/material.dart';

class PersonForm extends StatefulWidget {

  TextEditingController nombres;
  TextEditingController apellidos;
  Function onChangegenero;
  TextEditingController edad;
  TextEditingController telefono;

  PersonForm({required this.nombres, required this.apellidos, required this.telefono, required this.edad, required this.onChangegenero});

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {

  String genero = "Masculino";

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 350, width: 500,
      child: Form(child: Column(
        children: [
          Text("Registrar Persona", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(controller: widget.nombres, decoration: InputDecoration(
            label: Text("Nombres", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          TextField(controller: widget.apellidos, decoration: InputDecoration(
            label: Text("Apellidos", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          Row(
            children: [
              DropdownButton(
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 80, 80, 80)),
                value: genero,
                items: [
                  DropdownMenuItem(child: Text("Masculino"), value: "Masculino"),
                  DropdownMenuItem(child: Text("Femenino"), value: "Femenino")
                ], 
                onChanged: (value) {
                  widget.onChangegenero(value);
                  genero = value!;
                  setState(() {});
                } 
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(controller: widget.edad, decoration: InputDecoration(
                  label: Text("Edad", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
            ],
          ),
          TextField(controller: widget.telefono, decoration: InputDecoration(
          label: Text("telefono", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)) 
          ))
        ],
      )),
    );
  }
}