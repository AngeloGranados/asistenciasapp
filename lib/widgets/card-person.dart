import 'package:asistenciasapp/models/asistencias_model.dart';
import 'package:asistenciasapp/models/registrados_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardPerson extends StatefulWidget {

  RegistradosModel personRegisted;

  CardPerson({required this.personRegisted});

  @override
  State<CardPerson> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson> {
  bool estado = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    estado = widget.personRegisted.estado;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 47, 47, 47),
            offset: Offset(3, 2),
            blurRadius: 4
          )
        ]
      ),
      child: ListTile(
        title: Column(
          children: [
            Text("${widget.personRegisted.nombreCompleto}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.personRegisted.telefono}", style: TextStyle(fontSize: 13)),
                Text("${DateFormat.yMMMd().format(widget.personRegisted.fechaReg.toDate())}", style: TextStyle(fontSize: 13))
              ],
            )
          ],
        ),
        leading: Icon(Icons.person_2_outlined),
        trailing: Checkbox(value: estado, onChanged: (value){
          estado = value!;
          AsistenciasModel.setEstado(estado, widget.personRegisted.idasistencia);
          setState(() {});
        }),
      )
    );
  }
}