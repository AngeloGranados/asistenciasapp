import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {

  Timestamp? fecha;

  @override
  Widget build(BuildContext context) {
      Future selectDate() async{
        DateTime? pickeddate = await showDatePicker(
          context: context, 
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );

        if(pickeddate != null){
           TimeOfDay? pickedtime = await showTimePicker(
            context: context, 
            initialTime: TimeOfDay.now()
          ); 

          if(pickedtime != null){
            DateTime combineddate = DateTime(
              pickeddate.year,
              pickeddate.month,
              pickeddate.day,
              pickedtime.hour,
              pickedtime.minute
            );

            setState(() {
              fecha = Timestamp.fromDate(combineddate);
            });
          }
        }
      }

    return SizedBox(height: 350, width: 500,
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