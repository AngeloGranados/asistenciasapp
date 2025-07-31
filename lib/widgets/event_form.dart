import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
      
      DateTime? date;

      Future selectDate() async{
        return showDatePicker(
          context: context, 
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        ).then((value){
          if(value == null && value != date){
            date = value; 
            setState(() {});
          }
        });
      }

    return SizedBox(height: 350,
      child: Form(child: Column(
        children: [
          Text("Registrar Evento", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(decoration: InputDecoration(
            label: Text("Nombre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          TextField(decoration: InputDecoration(
            label: Text("Dirección", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          )),
          TextField(decoration: InputDecoration(
          label: Text("Dni", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)) 
          )),
          SizedBox(height: 20),
          IconButton(onPressed: () => selectDate(), icon: Icon(Icons.date_range))
        ],
      )),
    );
  }
}