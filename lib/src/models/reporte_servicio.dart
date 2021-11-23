
import 'dart:typed_data';

import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';
import 'package:tech_monkeys/src/models/servicio_preventivo.dart';

const String tableReporte='reporteServicio';

class ReporteFields{
  static const List<String> values=[
    id,cliente,ubicacion,tipoEquipo,mantenimiento,fecha,marca,modelo,numSerie,descripcion,tipo,signatureCustomer,signatureTecnico,
  ];
  static const id='_id';
  static const cliente='cliente';
  static const ubicacion='ubicacion';
  static const tipoEquipo='tipoEquipo';
  static const mantenimiento='mantenimiento';
  static const fecha='fecha';
  static const marca='marca';
  static const modelo='modelo';
  static const numSerie='numSerie';
  static const descripcion='descripcion';
  static const tipo='tipo';
  static const signatureCustomer="signatureCustomer";
  static const signatureTecnico="signatureTecnico";
}

class ReporteServicio{
  int? id;
  String cliente="";
  String ubicacion="";
  String tipoEquipo="";
  String mantenimiento="";
  String fecha="";
  String marca="";
  String modelo="";
  String numSerie="";
  String descripcion="";
  String tipo="";
  ServicioPreventivo? servicioPreventivo;
  ServicioCorrectivo? servicioCorrectivo;
  DatosFuncionamiento datosFuncionamiento = DatosFuncionamiento();
  Uint8List? signatureCustomer;
  Uint8List? signatureTecnico;

  static ReporteServicio fromJson(Map<String,Object?> json){
    ReporteServicio reporte= ReporteServicio();
    reporte.id=json[ReporteFields.id]as int?;
    reporte.cliente=json[ReporteFields.cliente] as String;
    reporte.ubicacion=json[ReporteFields.ubicacion] as String;
    reporte.tipoEquipo=json[ReporteFields.tipoEquipo] as String;
    reporte.mantenimiento=json[ReporteFields.mantenimiento] as String;
    reporte.fecha=json[ReporteFields.fecha] as String;
    reporte.marca=json[ReporteFields.marca] as String;
    reporte.modelo=json[ReporteFields.modelo] as String;
    reporte.numSerie=json[ReporteFields.numSerie] as String;
    reporte.descripcion=json[ReporteFields.descripcion] as String;
    reporte.tipo=json[ReporteFields.tipo] as String;
    reporte.signatureCustomer=(json[ReporteFields.signatureCustomer]!=null)
      ?json[ReporteFields.signatureCustomer] as Uint8List
      :null;
    reporte.signatureTecnico=(json[ReporteFields.signatureTecnico]!=null)
      ?json[ReporteFields.signatureTecnico] as Uint8List
      :null;
    return reporte;
  }

  static Map<String,Object?>toJson(ReporteServicio servicio)=>{
    ReporteFields.id:servicio.id,
    ReporteFields.cliente:servicio.cliente,
    ReporteFields.ubicacion:servicio.ubicacion,
    ReporteFields.tipoEquipo:servicio.tipoEquipo,
    ReporteFields.mantenimiento:servicio.mantenimiento,
    ReporteFields.fecha:servicio.fecha,
    ReporteFields.marca:servicio.marca,
    ReporteFields.modelo:servicio.modelo,
    ReporteFields.numSerie:servicio.numSerie,
    ReporteFields.descripcion:servicio.descripcion,
    ReporteFields.tipo:servicio.tipo,
    ReporteFields.signatureCustomer:servicio.signatureCustomer,
    ReporteFields.signatureTecnico:servicio.signatureTecnico,
  };
}