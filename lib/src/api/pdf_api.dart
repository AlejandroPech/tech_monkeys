import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:tech_monkeys/src/api/methods_pdf_api.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
class PdfApi{

  static Future<File> generatePDFPreventivo({
    required Uint8List imageSignatureCustomer,
    required Uint8List imageSignatureTecnico,
    required ReporteServicio reporteServicio
  })async{
    final pdf=pw.Document();
    final ByteData data = await rootBundle.load('assets/images/logo.png');
    final Uint8List logo=data.buffer.asUint8List();

    final String checkIcon = await rootBundle.loadString('assets/images/check.svg');
    final preventivo = reporteServicio.servicioPreventivo;
    final datosfuncionamiento=reporteServicio.datosFuncionamiento;
    pdf.addPage(
      pw.MultiPage(
        margin:const pw.EdgeInsets.fromLTRB(15,5,7,15),
        build: (context)=>[
          MethodPdfApi.headerPage(logo),
          MethodPdfApi.serviceTable(reporteServicio),
          MethodPdfApi.typeMaintenance("MANTENIMIENTO PREVENTIVO"),
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths:{
              0:const pw.FlexColumnWidth(11),
              1:const pw.FlexColumnWidth(2),
              2:const pw.FlexColumnWidth(11),
              3:const pw.FlexColumnWidth(2),
            },
            children: [
              MethodPdfApi.checkRowTable("Lavado Condensador P< a 600 psi",preventivo!.lavadoCondensador,"Lavado Evaporador",preventivo.lavadoEvaporador,checkIcon),
              MethodPdfApi.checkRowTable("Limpieza y ajuste de componentes eléctrico",preventivo.limpAjusteCompElectrico,"Limpieza y ajuste de rejillas y difusores",preventivo.limpRejillaDifusores,checkIcon),
              MethodPdfApi.checkRowTable("Inspección y ajuste de transmisión potencia",preventivo.insAjustePotencia,"Lavado/cambio filtros aire evaporador",preventivo.lavadoFiltroAireEvaporadr,checkIcon),
              MethodPdfApi.checkRowTable("Limpieza y ajuste de bandeja y tubo drenaje",preventivo.limpBandejaDrenaje,"Ajuste de Carga Refrigerante",preventivo.ajusteCargaRefrig,checkIcon),
              MethodPdfApi.checkRowTable("Verificar el setpoint",preventivo.verificarSetPoint,"Revision balanceo de aspas",preventivo.revBalAspas,checkIcon),
              MethodPdfApi.checkRowTable("Revision de aislamiento en ductos",preventivo.revAislamientoDuctos,"Revision de motor evaporador",preventivo.revMotorEvaporador,checkIcon),
              MethodPdfApi.checkRowTable("Revision componente electrico/electronico",preventivo.revCompElectrico,"Revision de motor condensador",preventivo.revMotorCondensador,checkIcon),
              MethodPdfApi.checkRowTable("Verifique/reapriete conexiones electricas",preventivo.verificarConexElectrico,"Balance de voltage <= 2%",preventivo.balanceVoltaje,checkIcon),
              MethodPdfApi.checkRowTable("Verificar toda la estructura del equipo",preventivo.verifEstructuraEquipo,"Balance de turbina y chumacera",preventivo.balanceTurbinaChamaquera,checkIcon),
              MethodPdfApi.checkRowTable("Temp. Inyeccion y retorno",false,"Peinar aletas de los serpentines",preventivo.peinarAletasSerpentines,checkIcon),
              
            ]
          ),
          MethodPdfApi.onlyRowTable("Otra Actividad: ", 2,preventivo.otraActividad),
          MethodPdfApi.datafunctionTable("L1-","L1-","L"),
          MethodPdfApi.equipmentRowHeader(),
          MethodPdfApi.voltajeYAmperios(datosfuncionamiento, checkIcon),
          MethodPdfApi.radioOrOptionRowTable("Vent.Cond 2",datosfuncionamiento.ventCond2,"Resistencais a carter",datosfuncionamiento.resistenciaCarter1,datosfuncionamiento.resistenciaCarter2,checkIcon),
          MethodPdfApi.datosporUnidadesMedidas(datosfuncionamiento),
          MethodPdfApi.onlyRowTable("Observaciones: ", 3,datosfuncionamiento.observaciones),
          pw.Container(
            height: 75
          ),
          MethodPdfApi.rowSignatures(imageSignatureCustomer, imageSignatureTecnico),
          MethodPdfApi.tableBottomSignature()
        ]
      )
    );

    return saveDocument(name:'Reporte.pdf',pdf:pdf);
  }

  static Future<File> generatePDFCorrectivo({
    required Uint8List imageSignatureCustomer,
    required Uint8List imageSignatureTecnico,
    required ReporteServicio reporteServicio
  })async{
    final pdf=pw.Document();
    final ByteData data = await rootBundle.load('assets/images/logo.png');
    final Uint8List logo=data.buffer.asUint8List();

    final String checkIcon = await rootBundle.loadString('assets/images/check.svg');
    final correctivo = reporteServicio.servicioCorrectivo;
    final datosfuncionamiento=reporteServicio.datosFuncionamiento;
    pdf.addPage(
      pw.MultiPage(
        margin:const pw.EdgeInsets.fromLTRB(15,5,7,15),
        build: (context)=>[
          MethodPdfApi.headerPage(logo),
          MethodPdfApi.serviceTable(reporteServicio),
          MethodPdfApi.onlyRowTable("Descripción: ", 3,reporteServicio.descripcion),
          MethodPdfApi.typeMaintenance("MANTENIMIENTO PREVENTIVO"),
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths:{
              0:const pw.FlexColumnWidth(11),
              1:const pw.FlexColumnWidth(2),
              2:const pw.FlexColumnWidth(11),
              3:const pw.FlexColumnWidth(2),
            },
            children: [
              MethodPdfApi.checkRowTable("Cambio Condensador",correctivo!.cambioCondensador,"Cambio Evaporador",correctivo.cambioEvaporador,checkIcon),
              MethodPdfApi.checkRowTable("Cambio y ajuste de componentes eléctrico",correctivo.cambioAjusteCompElectrico,"Cambio y ajuste de rejillas y difusores",correctivo.cambioAjusteRejillas,checkIcon),
              MethodPdfApi.checkRowTable("Cambio y ajuste de transmisión potencia",correctivo.cambioAjusteTransPotencia,"Cambio de filtros aire evaporador",correctivo.cambioFiltroAireEvaporador,checkIcon),
              MethodPdfApi.checkRowTable("Cambio y ajuste de bandeja y tubo drenaje",correctivo.cambioAjusteBandDrenaje,"Ajuste de Carga Refrigerante",correctivo.ajusteCargaRefrigerante,checkIcon),
              MethodPdfApi.checkRowTable("Cambio de Rodamientos",correctivo.cambioRodamientos,"Cambio y balanceo de aspas",correctivo.cambioBalanceoAspas,checkIcon),
              MethodPdfApi.checkRowTable("Recupera refrigerante",correctivo.recurepaRefrigerante," Cambio/arreglo de aspas condensador",correctivo.cambioAspasCondensador,checkIcon),
              MethodPdfApi.checkRowTable("Corrección de fuga",correctivo.correccionFuga,"Cambio/arreglo motor condensador",correctivo.cambioMotorCondensador,checkIcon),
              MethodPdfApi.checkRowTable("Presurizado con Nitrógeno y barrido",correctivo.presurizadoNitrogeno,"Cambio/arreglo motor evaporador",correctivo.cambioMotorEvaporador,checkIcon),
              MethodPdfApi.checkRowTable("Vacío hasta 500 micrones",correctivo.vacioMicrones,"Cambio/arreglo compresor y filtro",correctivo.cambioCompresorFiltro,checkIcon),
              MethodPdfApi.checkRowTable("Carga de refrigerante",correctivo.cargaRefrigerante,"Cambio componente eléctrico /",correctivo.cambioComponenteElectrico,checkIcon),
              
            ]
          ),
          MethodPdfApi.onlyRowTable("Otra Actividad: ", 2,correctivo.otraActividad),
          MethodPdfApi.datafunctionTable("L1-","L1-","L"),
          MethodPdfApi.equipmentRowHeader(),
          MethodPdfApi.voltajeYAmperios(datosfuncionamiento, checkIcon),
          MethodPdfApi.radioOrOptionRowTable("Vent.Cond 2",datosfuncionamiento.ventCond2,"Resistencais a carter",datosfuncionamiento.resistenciaCarter1,datosfuncionamiento.resistenciaCarter2,checkIcon),
          MethodPdfApi.datosporUnidadesMedidas(datosfuncionamiento),
          MethodPdfApi.onlyRowTable("Observaciones: ", 3,datosfuncionamiento.observaciones),
          
          MethodPdfApi.rowSignatures(imageSignatureCustomer, imageSignatureTecnico),
          MethodPdfApi.tableBottomSignature()
        ]
      )
    );

    return saveDocument(name:'Reporte.pdf',pdf:pdf);
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