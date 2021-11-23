import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';

class MethodPdfApi{

  static pw.Stack headerPage(Uint8List image2) {
    return pw.Stack(
      children: [
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 10),
          child: pw.Center(
            child:pw.Column(
              children: [
                pw.RichText(
                  text: pw.TextSpan(
                    children:  [
                      pw.TextSpan(
                        text: 'Tech',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColor.fromRYB(0.9, 0.0, 0.0,1.0),fontSize: 28 ),
                      ),
                      pw.TextSpan(
                        text: '-Monkeys', 
                        style:pw.TextStyle(fontSize: 28,fontWeight: pw.FontWeight.bold ),
                      ),
                    ],
                  ),
                ),
                pw.Text("ESPECIALISTAS EN AIRE ACONDICIONADO INDUSTRIAL",
                  style: pw.TextStyle(color: PdfColor.fromRYB(0.9, 0.0, 0.0,1.0),fontSize: 7, fontWeight: pw.FontWeight.bold)
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 20),
                  child: pw.Text("Reporte de Servicio",style: pw.TextStyle(color:PdfColor.fromRYB(1.0, 1.0, 1.0,0.2),fontSize: 20,fontWeight: pw.FontWeight.bold ))
                ),
                
              ]
            ),
          ),
        ),
        pw.Image(
          pw.MemoryImage(image2),
          width: 100,
          height: 100
        ),
      ]
    );
  }

  static pw.Table serviceTable(ReporteServicio servicio) {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(2),
        1:const pw.FlexColumnWidth(4),
        2:const pw.FlexColumnWidth(2),
        3:const pw.FlexColumnWidth(4),
      },
      children: [
        customerRowTable("Cliente",servicio.cliente,"Fecha",servicio.fecha),
        customerRowTable("Ubicación",servicio.ubicacion,"Marca",servicio.marca),
        customerRowTable("Tipo de equipo",servicio.tipoEquipo,"Modelo",servicio.modelo),
        customerRowTable("Mantenimiento",servicio.mantenimiento,"N° de Serie",servicio.numSerie),
      ]
    );
  }

  static pw.Container typeMaintenance(String typeMaintenance) {
    return pw.Container(
      margin:const pw.EdgeInsets.symmetric(vertical: 3),
      child: pw.Center(
        child: pw.Text(typeMaintenance,style: pw.TextStyle(fontWeight: pw.FontWeight.bold)) 
      ),
    );
  }

  static pw.TableRow customerRowTable(String title, String body,String title2,String body2) {
    return pw.TableRow(
      children:[
        pw.Text(title),
        pw.Text(body),
        pw.Text(title2),
        pw.Text(body2),
      ]
    );
  }

  static pw.TableRow checkRowTable(String title, bool body,String title2,bool body2,String imageData ) {
    return pw.TableRow(children: [
      pw.Text(title),
      pw.Center(child:(body)?checkImage(imageData):pw.Text("") ),
      pw.Text(title2),
      pw.Center(child:(body2)?checkImage(imageData):pw.Text("") ),
    ]);
  }

  static pw.Table onlyRowTable(String content,int cantidad,String body){
    return pw.Table(
      border: pw.TableBorder.all(),
      children:[
        pw.TableRow(
          children: [
            pw.Container(
              height: (25.0*cantidad),
              child: pw.RichText(
                text: pw.TextSpan(
                  children:  [
                    pw.TextSpan(
                      text: content,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold,),
                    ),
                    pw.TextSpan(
                      text: body,
                    ),
                  ],
                ),
              ),
              // pw.Text(content)
            ),
        ])
      ]
    );
  }

  static pw.Table datafunctionTable(String text1, String text2, String text3){
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(7),
        1:const pw.FlexColumnWidth(4),
        2:const pw.FlexColumnWidth(2),
        3:const pw.FlexColumnWidth(5),
        4:const pw.FlexColumnWidth(2),
        5:const pw.FlexColumnWidth(2),
        6:const pw.FlexColumnWidth(2),
        7:const pw.FlexColumnWidth(2),
      },
      children: [
        pw.TableRow(
          children: [
            pw.Text("Datos de funcionamiento",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text("Voltaje"),
            pw.Text(text1),
            pw.Text(""),
            pw.Text(text2),
            pw.Text("Voltaje"),
            pw.Text(text3),
            pw.Text(""),
          ]
        ),
      ]
    );
  }

  static pw.Table equipmentRowHeader() {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(7),
        1:const pw.FlexColumnWidth(6),
        2:const pw.FlexColumnWidth(7),
        3:const pw.FlexColumnWidth(6),
      },
      children: [
        pw.TableRow(
          children:[
            pw.Center(
              child: pw.Text("Equipo"),
            ),
            equipmentHeader(),
            pw.Center(
              child: pw.Text("Equipo"),
            ),
            equipmentHeader(),
          ]
        ),
      ]
    );
  }

  static pw.Table equipmentHeader() {
    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          children: [
            pw.Center(child: pw.Text("Corriente"),),
          ]
        ),
        pw.TableRow(
          children: [
            pw.Column(
              children: [
                pw.Table(
                  border: pw.TableBorder.all(),
                  children:[
                    pw.TableRow(
                    children: [
                      pw.Text("L1"),
                      pw.Text("L2"),
                      pw.Text("L3"),
                    ]
                  ),
                  ] 
                )
              ]
            )
          ]
        ),
      ]
    );
  }

  static pw.Table voltajeYAmperios(DatosFuncionamiento datosfuncionamiento, String checkIcon) {
    return pw.Table(
          border: pw.TableBorder.all(),
          columnWidths:{
            0:const pw.FlexColumnWidth(7),
            1:const pw.FlexColumnWidth(2),
            2:const pw.FlexColumnWidth(2),
            3:const pw.FlexColumnWidth(2),
            4:const pw.FlexColumnWidth(7),
            5:const pw.FlexColumnWidth(2),
            6:const pw.FlexColumnWidth(2),
            7:const pw.FlexColumnWidth(2),
          },
          children:[
            MethodPdfApi.radioRowTable("Compresor 1",datosfuncionamiento.compresor1,"Blower",datosfuncionamiento.blower,checkIcon),
            MethodPdfApi.radioAndOptionRowTable("Compresor 2",datosfuncionamiento.compresor2,"Estado de aspas",datosfuncionamiento.estadoAspas,checkIcon),
            MethodPdfApi.radioAndOptionRowTable("Vent.Cond 1",datosfuncionamiento.ventCond1,"Nivel de aceite",datosfuncionamiento.nivelAceite,checkIcon),
          ]
        );
  }

  static pw.Table datosporUnidadesMedidas(DatosFuncionamiento datosfuncionamiento) {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(7),
        1:const pw.FlexColumnWidth(2),
        2:const pw.FlexColumnWidth(4),
        3:const pw.FlexColumnWidth(7),
        4:const pw.FlexColumnWidth(2),
        5:const pw.FlexColumnWidth(4),
      },
      children: [
        MethodPdfApi.dataStringTableRow("Presión condensación","Psig",datosfuncionamiento.presionCondensacion,"Presión de evaporación","Psig",datosfuncionamiento.presionEvaporacion),
        MethodPdfApi.dataStringTableRow("Temperatura condensación","C/F",datosfuncionamiento.temperaturaCondensacion,"Temperatura ","C/F",datosfuncionamiento.temperatura),
        MethodPdfApi.dataStringTableRow("Temperatura saturacion","C/F",datosfuncionamiento.temperaturaSaturacion,"Temperatura saturacion","C/F",datosfuncionamiento.temperaturaSaturacion2),
        MethodPdfApi.dataStringTableRow("Subenfriamiento","K",datosfuncionamiento.subEnfriamiento,"Sobrecalentamiento","K",datosfuncionamiento.sobreCalentamiento),
      ]
    );
  }  

  static pw.TableRow radioRowTable(String title,List<Corriente> corrientes1,String title2,List<Corriente> corrientes2,String imageData){
    return pw.TableRow(
      children:[
        
        pw.Text(title),
        cellL(corrientes1[0]),
        cellL(corrientes1[1]),
        cellL(corrientes1[2]),
        pw.Text(title2),
        cellL(corrientes2[0]),
        cellL(corrientes2[1]),
        cellL(corrientes2[2]),
      ]
    );
  }

  static pw.TableRow radioAndOptionRowTable(String title,List<Corriente> corrientes,String title2,String option2,String imageData){
    return pw.TableRow(
      children:[
        
        pw.Text(title),
        cellL(corrientes[0]),
        cellL(corrientes[1]),
        cellL(corrientes[2]),
        pw.Text(title2),
        pw.Center(child:(option2=="Bien")?pw.Text("Bien"):(option2=="1/4")?pw.Text("1/4"):pw.Text("") ),
        pw.Center(child:(option2=="Ajuste")?pw.Text("Ajuste"):(option2=="1/2")?pw.Text("1/2"):pw.Text("") ),
        pw.Center(child:(option2=="Cambio")?pw.Text("Cambi"):(option2=="3/4")?pw.Text("3/4"):pw.Text("") ),
      ]
    );
  }
  static pw.Table radioOrOptionRowTable(String title,List<Corriente> corrientes,String title2,String comp1,String comp2,String imageData){
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(7),
        1:const pw.FlexColumnWidth(2),
        2:const pw.FlexColumnWidth(2),
        3:const pw.FlexColumnWidth(2),
        4:const pw.FlexColumnWidth(7),
        5:const pw.FlexColumnWidth(6),
      },
    children: [
      pw.TableRow(
        children:[
          pw.Text(title),
          cellL(corrientes[0]),
          cellL(corrientes[1]),
          cellL(corrientes[2]),
          pw.Text(title2),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Text("comp 1: $comp1"),
              pw.Text("comp 2: $comp2"),
            ]
          )
        ]
      )
    ]);
  }

  static pw.Column cellL(Corriente corrientes1) {
    return pw.Column(children: [
        pw.Row(children: [
          pw.Text(" v: "),
          pw.Text(corrientes1.volt),
        ]),
        pw.Row(children: [
          pw.Text(" a: "),
          pw.Text(corrientes1.amp),
        ]),
      ]);
  }

  static pw.TableRow dataStringTableRow(String title, String sigla, String value,String title2, String sigla2, String value2){
    return pw.TableRow(
      children: [
        pw.Text(title),
        pw.Text(sigla),
        pw.Text(value),
        pw.Text(title2),
        pw.Text(sigla2),
        pw.Text(value2),
      ]
    );
  }

  static pw.SvgImage checkImage(String dataImage) { 
    return pw.SvgImage(
      svg:dataImage,
      height: 15,
      width: 15,
    );
  }

  static pw.Row rowSignatures(Uint8List firmaCustomer, Uint8List firmaTecnico) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
      children: [
        pw.Image(pw.MemoryImage(firmaCustomer), height: 75, width: 100),
        pw.Image(pw.MemoryImage(firmaTecnico),height: 75, width: 100),
      ]
    );
  }

  static pw.Table tableBottomSignature() {
    return pw.Table(
      border:pw.TableBorder.all(),
      columnWidths:{
        0:const pw.FlexColumnWidth(1),
        1:const pw.FlexColumnWidth(1),
      },
      children: [
        pw.TableRow(
          children: [
            pw.Center(child:pw.Text("CLIENTE")),
            pw.Center(child:pw.Text("TECNICO HVAC")),
          ]
        )
      ]
    );
  }

}