import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:flutter/material.dart';

class TextContainerPersona extends StatefulWidget {

  String clave;
  String valor;
  bool editarEnable;
  TextEditingController? editingController = null;
  String tipoField;

  TextContainerPersona({required this.clave, required this.valor, required this.editarEnable, this.editingController, this.tipoField = "texto"});

  @override
  State<TextContainerPersona> createState() => _TextContainerPersonaState();
}

class _TextContainerPersonaState extends State<TextContainerPersona> {

  bool activaredit = false;
  String generoString = "Masculino";

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
                if (widget.tipoField == "texto")
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: TextField(controller: widget.editingController),
                  )
                else if (widget.tipoField == "select")
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
              if(widget.editarEnable) GestureDetector(
                onTap: (){
                  activaredit = true;
                  setState(() {});
                } ,
                child: Icon(Icons.edit, color: Colors.blue
              ))
            ],
          )
        ],
      ),
    );
  }
}