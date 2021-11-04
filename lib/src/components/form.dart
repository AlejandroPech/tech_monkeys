import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tech_monkeys/src/api/pdf_api.dart';
import 'package:tech_monkeys/src/components/documents/preventivo.dart';
import 'documents/footer.dart';
import 'documents/head.dart';
import 'dart:ui' as ui;

class FormController extends StatefulWidget {
  const FormController({Key? key}) : super(key: key);

  @override
  _FormControllerState createState() => _FormControllerState();
}

class _FormControllerState extends State<FormController> {
  final keySignaturePad= GlobalKey<SfSignaturePadState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children:  <Widget>[
          const HeadDoc(),
          const BodyPreventivo(),
          SfSignaturePad(
              key: keySignaturePad,
              backgroundColor: Colors.yellow.withOpacity(0.2),
            ),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: onSubmit,
            ),
            ElevatedButton(
              child: const Text("Submit2"),
              onPressed: onSubmit2,
            ),
          // const FooterDoc(),
        ],
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
