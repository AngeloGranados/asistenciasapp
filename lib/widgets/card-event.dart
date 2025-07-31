import 'package:asistenciasapp/models/evento_model.dart';
import 'package:asistenciasapp/pages/asistencia_page.dart';
import 'package:asistenciasapp/widgets/popmenu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardEvent extends StatelessWidget {
  
  Function showDialogFormEvent;
  EventoModel eventoM;

  CardEvent(this.showDialogFormEvent, this.eventoM);

  @override
  Widget build(BuildContext context) {

    print(eventoM.fecha.toDate());

    return Stack(
      children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AsistenciaPage()));
            },
            child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 28, 28, 28),
                  offset: Offset(5, 2),
                  blurRadius: 10
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color.fromARGB(255, 142, 210, 64)
            ),
            child: Column(
              spacing: 10,
              children: [
                Text("${eventoM.nombre}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("${eventoM.direccion}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.date_range),
                        Text("${DateFormat('dd/MM/yyyy').format(eventoM.fecha.toDate())}")
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.alarm),
                        Text("${DateFormat('HH:mm').format(eventoM.fecha.toDate())}")
                      ],
                    )
                  ],
                )
              ],
            ),
                    ),
          ),
        Positioned(right: 10, top: 10, child: Popmenu(showDialogFormEvent))
      ]
    );
  }
}