import 'package:asistenciasapp/pages/acepted_page.dart';
import 'package:asistenciasapp/pages/registed_page.dart';
import 'package:asistenciasapp/widgets/card-person.dart';
import 'package:flutter/material.dart';

class AsistenciaPage extends StatelessWidget {
  const AsistenciaPage({super.key});

  void showDialogFormPerson(BuildContext context){
    showDialog(context: (context), builder: (context)=> AlertDialog(
      title: Text("Registrar Persona"),
      content: Text("contenido"),
      actions: [
        MaterialButton(onPressed: (){}, child: Text("Guardar")),
        MaterialButton(onPressed: (){
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
        appBar: AppBar(title: Text("Cena", style: TextStyle(fontWeight: FontWeight.bold)),backgroundColor: Colors.green),
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