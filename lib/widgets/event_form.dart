import 'package:asistenciasapp/models/evento_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {

  VoidCallback dateSelect;
  TextEditingController? nombreController;
  TextEditingController? direccionController;

  EventoModel? eventM;
  bool nuevosDatos;

  EventForm({required this.nombreController, required this.direccionController, required this.dateSelect, this.eventM, required this.nuevosDatos});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!widget.nuevosDatos){
      widget.nombreController?.text = widget.eventM!.nombre;
      widget.direccionController?.text = widget.eventM!.direccion;
    }
  }

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
                child: TextField(controller: widget.nombreController, decoration: InputDecoration(
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
                child: TextField(controller: widget.direccionController, decoration: InputDecoration(
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