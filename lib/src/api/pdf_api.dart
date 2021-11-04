import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' as pd;
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:ui';

class PdfApi{
  static Future<File> generatePDF({
    required ByteData imageSignature,
  })async{
    final document=PdfDocument();
    document.pageSettings.margins.all=0;
    document.pageSettings.margins.right=10.0;
    final page=document.pages.add();

    drawSignature(page,imageSignature);
    // drawGrid(page);
    return saveFile(document);
    
  }

  static Future<File> generatePDF2({
    required ByteData imageSignature,
  })async{
    final pdf=pw.Document();

    
    final ByteData data = await rootBundle.load('assets/images/logo.png');
    final Uint8List image2=data.buffer.asUint8List();
    pdf.addPage(
      pw.MultiPage(
        margin:const pw.EdgeInsets.all(10),
        build: (context)=>[
          pw.ClipRRect(
            child: pw.Image(
              pw.MemoryImage(image2),
              width: 100,
              height: 75
            ),
          ),
        ]
      )
    );

    return saveDocument(name:'Example.pdf',pdf:pdf);
  }

  static void drawSignature(PdfPage page,ByteData imageSignature)async {
    final pageSize=page.getClientSize();
    // final PdfBitmap image=PdfBitmap(imageSignature.buffer.asUint8List());

    final ByteData data = await rootBundle.load('assets/images/logo.png');
    // // final ByteData data = AssetImage("")
    final Uint8List image2=data.buffer.asUint8List();
    final PdfBitmap imageMonkey=PdfBitmap(image2);
    // final PdfBitmap imageMonkey=PdfBitmap(data.buffer.asUint8List());


    page.graphics.drawImage(
      imageMonkey, 
      Rect.fromLTWH(pageSize.width-580,pageSize.height-825,100,75) 
    );
    // page.graphics.drawString(
    //   "Tech-Monkeys",
    //   PdfStandardFont(PdfFontFamily.helvetica, 18),
    //   bounds: Rect.fromLTWH(pageSize.width-330,pageSize.height-825,150,75) 
    // );
    // page.graphics.drawString(
    //   "MANTENIMIENTO PREVENTIVO",
    //   PdfStandardFont(PdfFontFamily.timesRoman, 14),
    //   bounds:const Rect.fromLTWH(200,160,250,75) 
    // );

    // page.graphics.drawImage(
    //   image,
    //   Rect.fromLTWH(pageSize.width-500,pageSize.height-75,100,40)  
    // );
  }

  static Future<File> saveFile(PdfDocument document)async{
    final path=await getApplicationDocumentsDirectory();
    final fileName=path.path+"/Invoices ${DateTime.now().toString()}.pdf";
    final file=File(fileName);
    
    file.writeAsBytes(document.save());
    document.dispose();
    return file;
  }
  static void drawGrid(PdfPage page) {
    final pageSize=page.getClientSize();
    final grid=PdfGrid();
    grid.columns.add(count: 12);
    final grid2=PdfGrid();
    grid2.columns.add(count: 12);
    final grid3=PdfGrid();
    grid3.columns.add(count: 2);
    final PdfGridRow row = grid3.rows.add();
    getUser("Cambio Condensador","","Cambio Evaporados","",grid);
    getUser("Ubicación","","Marca","",grid);
    getUser("Tipo de equipo","","Modelo","",grid);
    getUser("Mantenimiento","","N° de serie","",grid);

    getManPrev("Lavado Condensador P< a 600 psi","","Lavada Evaporada","",grid2);
    getManPrev("Limpieza y ajuste de componentes eléctricos","","Limpieza y ajuste de rejillas y difusores","",grid2);
    getManPrev("Inspección y ajuste de transmisión potencia","","Lavado/cambio filtros aire evaporador","",grid2);
    getManPrev("Limpieza y ajuste de bandeja y tubo drenaje","","Ajuste de Carga Refrigerante","",grid2);
    getManPrev("Verificar el setpoint","","Revision balanceo de aspas","",grid2);
    getManPrev("Revision de aislamiento en ductos",""," Revision de motor evaporador","",grid2);
    getManPrev("Revision componente electrico/electronico","","Revision de motor condensado","",grid2);
    getManPrev("Verifique/reapriete conexiones electricas","","Balance de voltage <= 2%","",grid2);
    getManPrev("Verificar toda la estructura del equipo","","Balance de turbina y chumacera","",grid2);
    getManPrev("Temp. Inyeccion y retorno","","Peinar aletas de los serpentine","",grid2);
    row.cells[0].value="CLIENTE";
    row.cells[1].value="TECNICO HVAC";
    grid.draw(
      page:page,
      bounds:const  Rect.fromLTWH(10, 100, 0, 0),
    );
    grid2.draw(
      page:page,
      bounds:const  Rect.fromLTWH(10, 180, 0, 0),
    );
    grid3.draw(
      page:page,
      bounds:const Rect.fromLTWH(10,810,0,0),
    );
  }
  static void getUser(String num1, String num2, String num3, String num4,PdfGrid grid){
    final PdfGridRow row = grid.rows.add();

    row.cells[0].value=num1;
    row.cells[0].rowSpan=1;
    row.cells[0].columnSpan=3;

    row.cells[3].value=num2;
    row.cells[3].rowSpan=1;
    row.cells[3].columnSpan=3;

    row.cells[6].value=num3;
    row.cells[6].rowSpan=1;
    row.cells[6].columnSpan=2;

    row.cells[8].value=num4;
    row.cells[8].rowSpan=1;
    row.cells[8].columnSpan=4;

  }

  static void getManPrev(String num1, String num2, String num3, String num4,PdfGrid grid){
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value=num1;
    row.cells[0].rowSpan=1;
    row.cells[0].columnSpan=5;

    row.cells[5].value=num2;

    row.cells[6].value=num3;
    row.cells[6].rowSpan=1;
    row.cells[6].columnSpan=5;

    row.cells[11].value=num4;
  }

  static Future<File> saveDocument({required String name, required pw.Document pdf}) async{
    final bytes= await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file=File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async{
    final url=file.path;
    await OpenFile.open(url);
  }
}