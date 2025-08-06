import 'dart:io';
import 'package:asistenciasapp/models/asistencias_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrScanner extends StatefulWidget {
  QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  bool procesandoQR = false;
  QRViewController? controller;

  Widget SnackBarMessage(String mensaje, Color color){
    return SnackBar(content: Text("$mensaje", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)), backgroundColor: color);
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    if(Platform.isAndroid) {
      controller!.pauseCamera();
    }else if(Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey, 
              onQRViewCreated: _onQRViewCreated,
            )
          ),
          Expanded(
            flex: 1,
            child: result != null ? Center(child: Text("data: ${result!.code}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))) : Center(child: Text("Scan a code", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
          )
        ],
      ),
    );

  }
  
  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async{

      if(procesandoQR) return;
      procesandoQR = true;

      if(result != null && result!.code == scanData.code) {
        procesandoQR = false;
        return; 
      }
      result = scanData;
      final asistencia = await AsistenciasModel.getAsistenciaById(result!.code);
      if(asistencia != null) {
        if(asistencia.estado){
          ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage("Este participante ya se encuentra presente", Colors.red) as SnackBar);
          procesandoQR = false;
          return;
        }
        await AsistenciasModel.setEstado(!asistencia.estado, asistencia.id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage("Asistencia actualizada!", Colors.green) as SnackBar);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage("Este participante no se encontra registrado", Colors.red) as SnackBar);
      }

      procesandoQR = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
}