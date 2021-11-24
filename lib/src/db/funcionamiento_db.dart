part of 'reporte_servicio_db.dart';


class _FuncionamientoDatabase {

  static Future<DatosFuncionamiento> create(DatosFuncionamiento funcionamiento)async {
    final db= await _DatabaseReportes.instance.database;
    final id=await db.insert(tableFuncionamiento, DatosFuncionamiento.toJson(funcionamiento));
    funcionamiento.id=id;
    return funcionamiento;
  }

  static Future<DatosFuncionamiento> readFuncionamiento(int id)async{
    final db= await _DatabaseReportes.instance.database;

    final maps= await db.query(
      tableFuncionamiento,
      columns: FuncionamientoFields.values,
      where: '${FuncionamientoFields.reporteId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return DatosFuncionamiento.fromJson(maps.first);
    }else{
      throw Exception('ID $id no encontrado');
    }
  }

  static Future<int> update(DatosFuncionamiento funcionamiento)async{
    final db=await _DatabaseReportes.instance.database;

    return db.update(
      tableFuncionamiento, 
      DatosFuncionamiento.toJson(funcionamiento),
      where: '${FuncionamientoFields.id} = ?',
      whereArgs: [funcionamiento.id],
    );
  }

  static Future<int> delete(int id)async{
    final db= await _DatabaseReportes.instance.database;
    return await db.delete(
      tableFuncionamiento,
      where: '${FuncionamientoFields.reporteId} = ?',
      whereArgs: [id],
    );
  }
}