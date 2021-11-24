part of 'reporte_servicio_db.dart';

class _PreventivoDataBase {
  
  static Future<ServicioPreventivo> create(ServicioPreventivo preventivo)async {
    final db= await _DatabaseReportes.instance.database;
    final id=await db.insert(tablePreventivo, ServicioPreventivo.toJson(preventivo));
    preventivo.id=id;
    return preventivo;
  }

  static Future<ServicioPreventivo> read(int id)async{
    final db= await _DatabaseReportes.instance.database;

    final maps= await db.query(
      tablePreventivo,
      columns: PreventivoFields.values,
      where: '${PreventivoFields.reporteId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return ServicioPreventivo.fromJson(maps.first);
    }else{
      throw Exception('ID $id no encontrado');
    }
  }

  static Future<int> update(ServicioPreventivo preventivo)async{
    final db=await _DatabaseReportes.instance.database;

    return db.update(
      tablePreventivo, 
      ServicioPreventivo.toJson(preventivo),
      where: '${PreventivoFields.id} = ?',
      whereArgs: [preventivo.id],
    );
  }

  static Future<int> delete(int id)async{
    final db= await _DatabaseReportes.instance.database;
    return await db.delete(
      tablePreventivo,
      where: '${PreventivoFields.reporteId} = ?',
      whereArgs: [id],
    );
  }
}