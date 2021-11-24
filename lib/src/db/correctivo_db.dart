part of 'reporte_servicio_db.dart';

class _CorrectivoDataBase {

  static Future<ServicioCorrectivo> create(ServicioCorrectivo correctivo)async {
    final db= await _DatabaseReportes.instance.database;
    final id=await db.insert(tableCorrectivo, ServicioCorrectivo.toJson(correctivo));
    correctivo.id=id;
    return correctivo;
  }

  static Future<ServicioCorrectivo> read(int id)async{
    final db= await _DatabaseReportes.instance.database;

    final maps= await db.query(
      tableCorrectivo,
      columns: CorrectivoFields.values,
      where: '${CorrectivoFields.reporteId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return ServicioCorrectivo.fromJson(maps.first);
    }else{
      throw Exception('ID $id no encontrado');
    }
  }

  static Future<int> update(ServicioCorrectivo correctivo)async{
    final db=await _DatabaseReportes.instance.database;

    return db.update(
      tableCorrectivo, 
      ServicioCorrectivo.toJson(correctivo),
      where: '${CorrectivoFields.id} = ?',
      whereArgs: [correctivo.id],
    );
  }

  static Future<int> delete(int id)async{
    final db= await _DatabaseReportes.instance.database;
    return await db.delete(
      tableCorrectivo,
      where: '${CorrectivoFields.reporteId} = ?',
      whereArgs: [id],
    );
  }
}