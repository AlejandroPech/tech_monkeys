import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tech_monkeys/src/api/pdf_api.dart';

import 'dart:ui' as ui;

import 'package:tech_monkeys/src/components/form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keySignaturePad= GlobalKey<SfSignaturePadState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Tech Monkeys"),
      ),
      body:const SafeArea(
        child: FormController(),
      ),
    );
  }

  void onSubmit2() async{
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)=>const Center(child: CircularProgressIndicator(),),
    );
    final image=await keySignaturePad.currentState?.toImage();
    final imageSignature= await image!.toByteData(format: ui.ImageByteFormat.png);
    final pdfProfile=await PdfApi.generatePDF2(imageSignature: imageSignature??ByteData(8));
    Navigator.of(context).pop();
    PdfApi.openFile(pdfProfile);
  }

  void onSubmit()async {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)=>const Center(child: CircularProgressIndicator(),),
    );

    final image=await keySignaturePad.currentState?.toImage();
    final imageSignature= await image!.toByteData(format: ui.ImageByteFormat.png);
    
    
    final file= await PdfApi.generatePDF(
      imageSignature:imageSignature??ByteData(8),
    );

    Navigator.of(context).pop();

    await OpenFile.open(file.path);
  }
}