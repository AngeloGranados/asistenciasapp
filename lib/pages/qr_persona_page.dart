import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPersonaPage extends StatelessWidget {

  String idasistenciaReg;

  QrPersonaPage({required this.idasistenciaReg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR - ASISTENCIA", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: QrImageView(
          data: idasistenciaReg,
          size: 200,
          version: QrVersions.auto,
          gapless: false,
          errorStateBuilder: (context, error) => 
            Center(
              child: Text(
                "Error Generating QR",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
        ),
      ),
    );
  }
}