import 'package:flutter/material.dart';

class PersonForm extends StatelessWidget {
  const PersonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 350,
      child: Form(child: Column(
        children: [
          Text("Registrar Persona", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(decoration: InputDecoration(
            label: Text("Nombres", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          TextField(decoration: InputDecoration(
            label: Text("Apellidos", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          Row(
            children: [
              Expanded(
                child: TextField(decoration: InputDecoration(
                  label: Text("genero", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(keyboardType: TextInputType.number, decoration: InputDecoration(
                  label: Text("Edad", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
            ],
          ),
          TextField(decoration: InputDecoration(
          label: Text("Dni", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)) 
          ))
        ],
      )),
    );
  }
}