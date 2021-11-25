import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tech_monkeys/src/api/pdf_api.dart';
import 'package:tech_monkeys/src/components/documents/body_correctivo.dart';
import 'package:tech_monkeys/src/components/documents/footer.dart';
import 'package:tech_monkeys/src/components/signature_pad.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';
import '../components/documents/head.dart';
import 'dart:ui' as ui;

class CorrectivoPage extends StatefulWidget {
  final int? id;
  const CorrectivoPage({Key? key, this.id}) : super(key: key);

  @override
  _CorrectivoPageState createState() => _CorrectivoPageState();
}

class _CorrectivoPageState extends State<CorrectivoPage> {
  late ReporteServicio reporteServicio;
  final keySignatureCustomerPad= GlobalKey<SfSignaturePadState>();
  final keySignatureTecnicoPad= GlobalKey<SfSignaturePadState>();
  bool signatureCustomer=false;
  bool signatureTecnico=false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if(widget.id!=null){
      refreshReportes();
    }else{
      reporteServicio = ReporteServicio();
      reporteServicio.servicioCorrectivo= ServicioCorrectivo();
    }
  }

  Future refreshReportes() async {
    setState(() => isLoading = true);
    reporteServicio = await ReporteCorrectivoDataBase.readReporteCorrectivo(widget.id!);
    if(reporteServicio.signatureCustomer!=null)signatureCustomer=true;
    if(reporteServicio.signatureTecnico!=null)signatureTecnico=true;
    setState(() => isLoading = false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporte Mantenimiento Correctivo"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Form(
          child: isLoading
            ? const Center(child: CircularProgressIndicator(),)
            :ListView(
            padding: const EdgeInsets.all(8),
            children: [
              HeadDoc(reporteServicio:(val)=> reporteServicio=val,reporte: reporteServicio,description: true,),
              BodyCorrectivo(servicioCallBack: (val)=>reporteServicio.servicioCorrectivo=val,correctivo: reporteServicio.servicioCorrectivo!,),
              FooterDoc(datosFuncionamiento: (val)=>reporteServicio.datosFuncionamiento=val,funcionamiento: reporteServicio.datosFuncionamiento,),
              SignaturePad(
                keySignaturePad: keySignatureCustomerPad,
                firmante: "Cliente",
                signature: reporteServicio.signatureCustomer,
                boolCallback: (val)=>signatureCustomer=val,
                uint8listCallback: (val)=>reporteServicio.signatureCustomer=val,
                isSigned:signatureCustomer
              ),
              SignaturePad(
                keySignaturePad: keySignatureTecnicoPad,
                firmante: "Técnico",
                signature: reporteServicio.signatureTecnico,
                boolCallback: (val)=>signatureTecnico=val,
                uint8listCallback: (val)=>reporteServicio.signatureTecnico=val,
                isSigned:signatureTecnico ,
              ),
              ElevatedButton(
                child: const Text("Guardar"),
                onPressed: guardar
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
    guardar();
    late final Uint8List imageSignatureCustomer;
    late final Uint8List imageSignatureTecnico;
    
    if((signatureCustomer&& keySignatureTecnicoPad.currentState!=null) || reporteServicio.signatureCustomer==null){
      imageSignatureCustomer= await signatureToUint8List(keySignatureCustomerPad);
    }else{
      imageSignatureTecnico=reporteServicio.signatureTecnico!;
    }
    if((signatureTecnico && keySignatureTecnicoPad.currentState!=null) ||reporteServicio.signatureTecnico==null){
      imageSignatureTecnico= await signatureToUint8List(keySignatureTecnicoPad);
    }else{
      imageSignatureTecnico= reporteServicio.signatureTecnico!;
    }
    final pdfProfile=await PdfApi.generatePDFCorrectivo(
      imageSignatureCustomer: imageSignatureCustomer,
      reporteServicio: reporteServicio,
      imageSignatureTecnico: imageSignatureTecnico, 
    );

    Navigator.of(context).pop();
    PdfApi.openFile(pdfProfile);
  }

  void guardar()async {
    if(signatureCustomer&& keySignatureCustomerPad.currentState!=null){
      reporteServicio.signatureCustomer=await signatureToUint8List(keySignatureCustomerPad);
    }else if(signatureTecnico && keySignatureTecnicoPad.currentState!= null){
      reporteServicio.signatureTecnico=await signatureToUint8List(keySignatureTecnicoPad);
    }
    if(reporteServicio.id==null){
      await ReporteCorrectivoDataBase.createCorrectivo(reporteServicio);
    }else{
      await ReporteCorrectivoDataBase.updateCorrectivo(reporteServicio);
    }
    Navigator.pop(context);
  }
  Future<Uint8List> signatureToUint8List(GlobalKey<SfSignaturePadState> keySignature)async{
    late final Uint8List uint8list;
    final signature=await keySignature.currentState?.toImage();
    final byteDataSignature= await signature!.toByteData(format: ui.ImageByteFormat.png);
    uint8list =byteDataSignature!.buffer.asUint8List();
    return uint8list;
  }
}