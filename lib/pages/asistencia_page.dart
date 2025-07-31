import 'package:asistenciasapp/models/evento_model.dart';
import 'package:asistenciasapp/pages/acepted_page.dart';
import 'package:asistenciasapp/pages/registed_page.dart';
import 'package:asistenciasapp/widgets/card-person.dart';
import 'package:asistenciasapp/widgets/person_form.dart';
import 'package:flutter/material.dart';

class AsistenciaPage extends StatelessWidget {

  EventoModel eventoM;

  AsistenciaPage(this.eventoM);

  void showDialogFormPerson(BuildContext context){
    showDialog(barrierDismissible: false, context: (context), builder: (context)=> AlertDialog(
      title: Icon(Icons.person_2),

      content: PersonForm(),
      actions: [
        MaterialButton(
          color: Colors.lightGreen,
          onPressed: (){}, child: Text("Guardar")),
        MaterialButton(
          color: Colors.red,
          onPressed: (){
          Navigator.pop(context);
        }, child:  Text("Cancelar"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: CircleAvatar(backgroundColor: Colors.green, child: IconButton(onPressed: ()=>showDialogFormPerson(context),color: Colors.white, icon: Icon(Icons.person_add))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(title: Text("${eventoM.nombre}", style: TextStyle(fontWeight: FontWeight.bold)),backgroundColor: Colors.green),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                TabBar(
                  indicatorColor: Colors.green, 
                  labelColor: Colors.green,
                  tabs: [
                  Tab(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 8),
                      Text("Registrados")
                    ],              
                  )),
                  Tab(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.checklist),
                      SizedBox(width: 8),
                      Text("Aceptados")
                    ],              
                  )),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      AceptedPage(),
                      RegistedPage()
                    ]
                  ),
                )         
            ],
          ),
        ),
      ),
    );
  }
}