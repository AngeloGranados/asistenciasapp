import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextContainerPersona extends StatefulWidget {

  String clave;
  String valor;
  bool editarEnable;
  TextEditingController? editingController = null;
  String? tipoField;
  String? campo;
  RegistradosModel? personaReg;

  TextContainerPersona({required this.clave, required this.valor, required this.editarEnable, this.editingController, this.tipoField = "string", this.campo, this.personaReg});

  @override
  State<TextContainerPersona> createState() => _TextContainerPersonaState();
}

class _TextContainerPersonaState extends State<TextContainerPersona> {

  bool activaredit = false;
  String generoString = "Masculino";

  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text("${widget.clave}", style: TextStyle(fontSize: 16)),
          SizedBox(width: 20),
          Row(
            children: [
              if (widget.editarEnable == true && activaredit == true) ...[
                if (widget.campo != "genero")
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: TextField(controller: _editingController, keyboardType: TextInputType.number),
                  )
                else
                  DropdownButton(
                    value: generoString,
                    items: [
                      DropdownMenuItem(value: "Masculino", child: Text("Masculino")),
                      DropdownMenuItem(value: "Femenino", child: Text("Femenino")),
                    ],
                    onChanged: (value) {
                      generoString = value!;
                      setState(() {});
                    },
                  )
              ] else
              Text(
                widget.valor,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 10),
              if(widget.editarEnable && activaredit != true) GestureDetector(
                onTap: (){
                  activaredit = true;
                  setState(() {});
                } ,
                child: Icon(Icons.edit, color: Colors.blue
              )),
              SizedBox(width: 10),
              if(activaredit) ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), 
              onPressed: (){
                 final nuevoValor = widget.campo != "genero" ? _editingController.text : generoString;

                CollectionReference _persona = FirebaseFirestore.instance.collection("PERSONAS");
                _persona.doc(widget.personaReg?.idpersona).update({
                  "${widget.campo}" : widget.campo != "genero"
                    ? widget.tipoField == "int"
                      ? int.tryParse(nuevoValor) ?? 0
                      : nuevoValor
                    : generoString
                });

                setState(() {
                  activaredit = false; 
                });
              }, child: Text("Editar", style: TextStyle(fontSize: 14, color: Colors.white),))
            ],
          )
        ],
      ),
    );
  }
}