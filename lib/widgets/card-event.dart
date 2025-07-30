import 'package:asistenciasapp/pages/asistencia_page.dart';
import 'package:asistenciasapp/widgets/popmenu.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  
  Function showDialogFormEvent;

  CardEvent(this.showDialogFormEvent);

  @override
  Widget build(BuildContext context) {

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
                Text("Cena cumpleaños", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("Del Rio Restobar"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.abc),
                        Text("38/05/02")
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.abc_rounded),
                        Text("08:00")
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