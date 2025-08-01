import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {

  VoidCallback dateSelect;
  TextEditingController? nombre;
  TextEditingController? direccion;

  EventForm(this.nombre, this.direccion, this.dateSelect);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {

  @override
  Widget build(BuildContext context) {
      
    return SizedBox(height: 350, width: 500,
      child: Form(child: Column(
        children: [
          Text("Registrar Evento", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.event),
              SizedBox(width: 20),
              Expanded(
                child: TextField(controller: widget.nombre, decoration: InputDecoration(
                label: Text("Nombre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                            )),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.route),
              SizedBox(width: 20),
              Expanded(
                child: TextField(controller: widget.direccion, decoration: InputDecoration(
                  label: Text("Dirección", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                )),
              ),
            ],
          ),
          SizedBox(height: 29),
          IconButton(color: Colors.blueAccent, onPressed: widget.dateSelect, icon: Icon(Icons.date_range)),
          Text("Seleccione una fecha y hora")
        ],
      )),
    );
  }
}