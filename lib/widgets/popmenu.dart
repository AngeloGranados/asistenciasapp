import 'dart:ffi';

import 'package:flutter/material.dart';

class Popmenu extends StatelessWidget {

  Function showDialogFormEvent; 

  Popmenu(this.showDialogFormEvent);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context)=>[
      PopupMenuItem(value: 1, child: Text("Editar"), onTap: ()=> showDialogFormEvent(context)),
      PopupMenuItem(value: 2, child: Text("Eliminar"), onTap: (){})
    ]);
  }
}