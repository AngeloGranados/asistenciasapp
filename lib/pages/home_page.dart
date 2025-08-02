import 'dart:ffi';

import 'package:asistenciasapp/models/evento_model.dart';
import 'package:asistenciasapp/widgets/card-event.dart';
import 'package:asistenciasapp/widgets/event_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference _eventos = FirebaseFirestore.instance.collection("EVENTOS");

  Timestamp? fecha;
  TextEditingController? nombre = TextEditingController();
  TextEditingController? direccion = TextEditingController();

  void clearControllers(){
    nombre?.clear();
    direccion?.clear();
    fecha = null;
  }

  @override
  Widget build(BuildContext context) {

      Future selectDate() async{
        DateTime? pickeddate = await showDatePicker(
          locale: const Locale("es", "ES"),
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

            fecha = Timestamp.fromDate(combineddate);
            setState(() {});
          }
        }
    }

    void showDialogFormEvent({required BuildContext context, nuevoDatos = true, EventoModel? eventoM}){
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (BuildContext context)=>AlertDialog(
          title:  Icon(Icons.calendar_month),
          content: EventForm(nombreController: nombre, direccionController: direccion, dateSelect: ()=>selectDate(), eventM: eventoM, nuevosDatos: nuevoDatos),
          actions: [
            MaterialButton(
              color: Colors.lightGreen,
              onPressed: () async{

              if(EventoModel.validadEvento(
                nombreController: nombre?.text,
                direccionController: direccion?.text,
                fechaController: fecha
              )){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text("Error al ingresar los datos", textAlign: TextAlign.center)));
                return;
              } 

              if(nuevoDatos){
                final docRef = _eventos.doc();  
                EventoModel newevent = EventoModel(
                  id: docRef.id,
                  nombre: nombre!.text, 
                  direccion: direccion!.text, 
                  fecha: fecha
                );       
                

                await docRef.set(newevent.toMap());
              }else{
                _eventos.doc(eventoM?.id).update({
                    "nombre" : nombre!.text, 
                    "direccion" : direccion!.text, 
                    "fecha" : fecha
                });
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Evento guardado exitosamente!", textAlign: TextAlign.center)));
              Navigator.pop(context);
              clearControllers();

            },child: Text("Guardar")),
            MaterialButton(
              color: Colors.red,
              onPressed: (){
              Navigator.pop(context);
              clearControllers();
            },child: Text("Cancelar"))
          ],
        ));
    }

    return Scaffold(
      floatingActionButton: CircleAvatar(backgroundColor: Colors.green, child: IconButton(onPressed: ()=> showDialogFormEvent(context: context, nuevoDatos: true, eventoM: null),color: Colors.white, icon: Icon(Icons.calendar_month))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.date_range_sharp),
          SizedBox(width: 10),
          Text("Eventos", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            StreamBuilder(
              stream: _eventos.snapshots(), 
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.hasError){
                  return Text("error : ${snapshot.error}");
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.data.docs.length == 0){
                  return Center(child: Text("No se encontraron datos"));
                }
                final List<QueryDocumentSnapshot> docs = snapshot.data.docs; 
                  List<EventoModel> eventos = docs.map((event) => EventoModel.fromMap(event.data() as Map<String, dynamic>, event.id)).toList();
                  return Expanded(child: ListView.separated(itemCount: eventos.length,separatorBuilder: (context, index) => SizedBox(height: 15), itemBuilder: (BuildContext context, int index) => CardEvent(showDialogFormEvent, eventos[index])));
              }
            )        
          ],
        ),
      ),
    );
  }
}