import 'package:asistenciasapp/models/evento_model.dart';
import 'package:flutter/material.dart';

class Popmenu extends StatelessWidget {

  Function showDialogFormEvent; 
  EventoModel eventoM;

  Popmenu(this.showDialogFormEvent, this.eventoM);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context)=>[
      PopupMenuItem(value: 1, child: Text("Editar"), onTap: ()=> showDialogFormEvent(context)),
      PopupMenuItem(value: 2, child: Text("Eliminar"), onTap: (){
        EventoModel.eliminarEvento(eventoM.id);
      })
    ]);
  }
}