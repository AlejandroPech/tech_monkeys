import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';
import 'package:tech_monkeys/src/models/servicio_preventivo.dart';
part 'funcionamiento_db.dart';
part 'preventivo_db.dart';
part 'correctivo_db.dart';
part 'database_reportes.dart';
class ReportePreventivoDataBase{
  static Future<ReporteServicio> createPreventivo(ReporteServicio reporte)async {
    reporte.tipo="preventivo";
    reporte = await _ReporteServicioDataBase.create(reporte);
    reporte.servicioPreventivo!.reporteId=reporte.id;
    reporte.servicioPreventivo!=await _PreventivoDataBase.create(reporte.servicioPreventivo!);
    return reporte;
  }

  static Future<ReporteServicio> readReportePreventivo(int id)async{
    ReporteServicio servicio =await _ReporteServicioDataBase.readReporte(id);
    servicio.servicioPreventivo=await _PreventivoDataBase.read(id);
    return servicio;
  }

  static Future<List<ReporteServicio>> readAllPreventivos()async {
    return await _ReporteServicioDataBase.readAll("preventivo");
  }

  static Future<int> updatePreventivo(ReporteServicio reporte)async{
    reporte.id = await _ReporteServicioDataBase.update(reporte);
    await _PreventivoDataBase.update(reporte.servicioPreventivo!);
    return reporte.id!;
  }

  static Future<int> deletePreventivo(int id)async{
    await _PreventivoDataBase.delete(id);
    final idDelete=_ReporteServicioDataBase.deletePreventivo(id);
    return idDelete;
  }

  static Future close()async{
    final db= await _DatabaseReportes.instance.database;
    db.close();
  }
}

class ReporteCorrectivoDataBase{
  static Future<ReporteServicio> createCorrectivo(ReporteServicio reporte)async {
    reporte.tipo="correctivo";
    reporte = await _ReporteServicioDataBase.create(reporte);
    reporte.servicioCorrectivo!.reporteId=reporte.id;
    reporte.servicioCorrectivo!=await _CorrectivoDataBase.create(reporte.servicioCorrectivo!);
    return reporte;
  }

  static Future<ReporteServicio> readReporteCorrectivo(int id)async{
    ReporteServicio servicio =await _ReporteServicioDataBase.readReporte(id);
    servicio.servicioCorrectivo=await _CorrectivoDataBase.read(id);
    return servicio;
  }

  static Future<List<ReporteServicio>> readAllCorrectivos()async {
    return await _ReporteServicioDataBase.readAll("correctivo");
  }

  static Future<int> updateCorrectivo(ReporteServicio reporte)async{
    reporte.id = await _ReporteServicioDataBase.update(reporte);
    await _CorrectivoDataBase.update(reporte.servicioCorrectivo!);
    return reporte.id!;
  }

  static Future<int> deleteCorrectivo(int id)async{
    await _CorrectivoDataBase.delete(id);
    final idDelete=_ReporteServicioDataBase.deletePreventivo(id);
    return idDelete;
  }

  static Future close()async{
    final db= await _DatabaseReportes.instance.database;
    db.close();
  }
}

class _ReporteServicioDataBase {
  static Future<ReporteServicio> create(ReporteServicio reporte)async {
    final db= await _DatabaseReportes.instance.database;    
    final id=await db.insert(tableReporte, ReporteServicio.toJson(reporte));
    reporte.id=id;
    reporte.datosFuncionamiento.reporteId=id;
    reporte.datosFuncionamiento=await _FuncionamientoDatabase.create(reporte.datosFuncionamiento);
    return reporte;
  }

  static Future<ReporteServicio> readReporte(int id)async{
    final db= await _DatabaseReportes.instance.database;

    final maps= await db.query(
      tableReporte,
      columns: ReporteFields.values,
      where: '${ReporteFields.id} = ?',
      whereArgs: [id],
    );
    ReporteServicio servicio =ReporteServicio.fromJson(maps.first);
    servicio.datosFuncionamiento=await _FuncionamientoDatabase.readFuncionamiento(id);
    if(maps.isNotEmpty){
      return servicio;
    }else{
      throw Exception('ID $id no encontrado');
    }
  }

  static Future<List<ReporteServicio>> readAll(String filtro)async {
    final db=await _DatabaseReportes.instance.database;

    final result= await db.query(
      tableReporte,
      columns: ReporteFields.values,
      where: '${ReporteFields.tipo} = ?',
      whereArgs: [filtro],
    );
    if(result.isNotEmpty){
      return result.map((json) => ReporteServicio.fromJson(json)).toList();
    }else{
      return [];
    }
  }

  static Future<int> update(ReporteServicio reporte)async{
    final db=await _DatabaseReportes.instance.database;
    final id= db.update(
      tableReporte, 
      ReporteServicio.toJson(reporte),
      where: '${ReporteFields.id} = ?',
      whereArgs: [reporte.id],
    );
    await _FuncionamientoDatabase.update(reporte.datosFuncionamiento);
    return id;
  }

  static Future<int> deletePreventivo(int id)async{
    final db= await _DatabaseReportes.instance.database;
    await _FuncionamientoDatabase.delete(id);
    final idDelete =await db.delete(
      tableReporte,
      where: '${ReporteFields.id} = ?',
      whereArgs: [id],
    );
    
    return idDelete;
  }
}