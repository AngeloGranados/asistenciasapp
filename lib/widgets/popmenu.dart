import 'package:asistenciasapp/models/evento_model.dart';
import 'package:flutter/material.dart';

class Popmenu extends StatelessWidget {

  Function showDialogFormEvent; 
  EventoModel eventoM;

  void showDialogEliminarEvento(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        icon: Icon(Icons.warning, color: Colors.amber),
        title: Text("ELIMINAR EVENTO", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        content: Text("¿Esta seguro de eliminar este evento?"),
        actions: [
          MaterialButton(
            color: Colors.lightGreen,
            onPressed: (){
              EventoModel.eliminarEvento(eventoM.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("${eventoM.nombre} eliminado correctamente", textAlign: TextAlign.center))
              );
              Navigator.pop(context);
            },
            child: Text("Aceptar")
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancelar")
          )
        ],
      )  
    );
  }

  Popmenu(this.showDialogFormEvent, this.eventoM);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context)=>[
      PopupMenuItem(value: 1, child: Text("Editar"), onTap: ()=> showDialogFormEvent(context: context, nuevoDatos : false, eventoM : eventoM)),
      PopupMenuItem(value: 2, child: Text("Eliminar"), onTap: (){
        showDialogEliminarEvento(context);
      })
    ]);
  }
}