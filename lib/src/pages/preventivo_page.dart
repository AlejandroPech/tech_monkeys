import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tech_monkeys/src/api/pdf_api.dart';
import 'package:tech_monkeys/src/components/documents/body_preventivo.dart';
import 'package:tech_monkeys/src/components/documents/footer.dart';
import 'package:tech_monkeys/src/components/signature_pad.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/models/servicio_preventivo.dart';
import '../components/documents/head.dart';
import 'dart:ui' as ui;

class PreventivoPage extends StatefulWidget {
  const PreventivoPage({Key? key}) : super(key: key);

  @override
  _PreventivoPageState createState() => _PreventivoPageState();
}

class _PreventivoPageState extends State<PreventivoPage>{
  ReporteServicio reporteServicio= ReporteServicio();
  final keySignatureCustomerPad= GlobalKey<SfSignaturePadState>();
  final keySignatureTecnicoPad= GlobalKey<SfSignaturePadState>();

  @override
  void initState() {
    super.initState();
    reporteServicio.servicioPreventivo= ServicioPreventivo();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporte Mantenimiento Preventivo"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Form(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              HeadDoc(reporteServicio:(val)=> reporteServicio=val,reporte: reporteServicio,description: false,),
              BodyPreventivo(servicioCallBack:( val)=> reporteServicio.servicioPreventivo=val),
              FooterDoc(datosFuncionamiento: (val)=>reporteServicio.datosFuncionamiento=val),
              SignaturePad(keySignaturePad: keySignatureCustomerPad),
              SignaturePad(keySignaturePad: keySignatureTecnicoPad),
              ElevatedButton(
                child: const Text("Guardar PDF"),
                onPressed: guardar,
              ),
              ElevatedButton(
                child: const Text("Generar PDF"),
                onPressed: onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onSubmit() async{
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)=>const Center(child: CircularProgressIndicator(),),
    );
    final imageCustomer=await keySignatureCustomerPad.currentState?.toImage();
    final imageSignatureCustomer= await imageCustomer!.toByteData(format: ui.ImageByteFormat.png);
    final imageTecnico=await keySignatureTecnicoPad.currentState?.toImage();
    final imageSignatureTecnico= await imageTecnico!.toByteData(format: ui.ImageByteFormat.png);

    final pdfProfile=await PdfApi.generatePDFPreventivo(
      imageSignatureCustomer: imageSignatureCustomer??ByteData(0),
      reporteServicio: reporteServicio,
      imageSignatureTecnico: imageSignatureTecnico??ByteData(0), 
    );

    Navigator.of(context).pop();
    PdfApi.openFile(pdfProfile);
  }

  void guardar()async {
    final imageCustomer=await keySignatureCustomerPad.currentState?.toImage();
    final imageSignatureCustomer= await imageCustomer!.toByteData(format: ui.ImageByteFormat.png);
    reporteServicio.signatureCustomer=imageSignatureCustomer!.buffer.asUint8List();
    final imageTecnico=await keySignatureTecnicoPad.currentState?.toImage();
    final imageSignatureTecnico= await imageTecnico!.toByteData(format: ui.ImageByteFormat.png);
    reporteServicio.signatureTecnico=imageSignatureTecnico!.buffer.asUint8List();
    if(reporteServicio.id==null){
      await ReporteServicioDataBase.instance.create(reporteServicio);
    } 
  }
}