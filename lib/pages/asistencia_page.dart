import 'package:asistenciasapp/models/asistencias_model.dart';
import 'package:asistenciasapp/models/evento_model.dart';
import 'package:asistenciasapp/models/persona_model.dart';
import 'package:asistenciasapp/pages/acepted_page.dart';
import 'package:asistenciasapp/pages/qr_scanner.dart';
import 'package:asistenciasapp/pages/registed_page.dart';
import 'package:asistenciasapp/widgets/person_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AsistenciaPage extends StatefulWidget {

  EventoModel eventoM;

  AsistenciaPage(this.eventoM);

  @override
  State<AsistenciaPage> createState() => _AsistenciaPageState();
}

class _AsistenciaPageState extends State<AsistenciaPage> {

  TextEditingController _nombres = TextEditingController();
  TextEditingController _apellidos = TextEditingController();
  String genero = "Masculino";
  TextEditingController _edad = TextEditingController();
  TextEditingController _telefono = TextEditingController();

  void clearControllers(){
    _nombres.clear();
    _apellidos.clear();
    genero = "Masculino";
    _edad.clear();
    _telefono.clear();
  }

  void showDialogFormPerson(BuildContext context){
    showDialog(barrierDismissible: false, context: (context), builder: (context)=> AlertDialog(
      title: Icon(Icons.person_2),
      content: PersonForm(
        nombres: _nombres,
        apellidos: _apellidos,
        onChangegenero: (value){
          genero = value!;
        },
        edad: _edad,
        telefono: _telefono,
      ),
      actions: [
        MaterialButton(
          color: Colors.lightGreen,
          onPressed: () async {

            final DocRef = FirebaseFirestore.instance.collection("PERSONAS").doc();

            if(PersonaModel.validarPersona(
                apellidosController:  _apellidos.text,
                nombresController:  _nombres.text,
                telefonoController:  _telefono.text,
                generoController:  genero,
                edadController: _edad.text
            )){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text("Error al ingresar los datos", textAlign: TextAlign.center)));
              return;
            }
            
            PersonaModel persona = PersonaModel(
              id: DocRef.id,
              apellidos: _apellidos.text, 
              nombres: _nombres.text, 
              telefono: int.parse(_telefono.text), 
              genero: genero,
              edad: int.parse(_edad.text),
              fechaReg: Timestamp.fromDate(DateTime.now())
            );

            DocRef.set(persona.toMap());

            if(!DocRef.id.isEmpty && DocRef.id != null){

              final docRefAsist = FirebaseFirestore.instance.collection("ASISTENCIAS").doc();
              AsistenciasModel asistencia = AsistenciasModel(
                id: docRefAsist.id,
                idpersona: DocRef.id, 
                idevento: widget.eventoM.id, 
                estado: false, 
                fechaMod: Timestamp.fromDate(DateTime.now()),
                fecha: Timestamp.fromDate(DateTime.now())
              );

              docRefAsist.set(asistencia.toMap());
            }

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Persona registrada exitosamente!", textAlign: TextAlign.center,)));
            clearControllers();
            setState(() {});
            Navigator.pop(context);
          
          }, child: Text("Guardar")),
        MaterialButton(
          color: Colors.red,
          onPressed: (){
          clearControllers();
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
        floatingActionButton: CircleAvatar(backgroundColor: Colors.green,
         child: IconButton(
          onPressed: () {
            showDialogFormPerson(context);
          },
          color: Colors.white, icon: Icon(Icons.person_add)
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> QrScanner()));
            }, icon: Icon(Icons.camera))
          ],
          title: Row(
          children: [
            Icon(Icons.date_range),
            SizedBox(width: 10),
            Text("${widget.eventoM.nombre}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),backgroundColor: Colors.green),
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
                      RegistedPage(eventM: widget.eventoM),
                      AceptedPage(eventM: widget.eventoM)
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